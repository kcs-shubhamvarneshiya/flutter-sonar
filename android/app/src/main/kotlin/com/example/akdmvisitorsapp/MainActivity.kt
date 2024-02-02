package com.example.akdmvisitorsapp

import CV
import android.Manifest
import android.app.PendingIntent
import android.bluetooth.*
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.example.akdmvisitorsapp.model.GeofenceData
import com.example.akdmvisitorsapp.model.NotificationData
import com.example.akdmvisitorsapp.service.GeofenceBroadcastReceiver
import com.example.akdmvisitorsapp.service.LocationService
import com.example.akdmvisitorsapp.service.OnGeofenceCallback
import com.example.akdmvisitorsapp.util.CM
import com.google.android.gms.location.*
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*
import kotlin.collections.HashMap


class MainActivity: FlutterActivity(), OnGeofenceCallback{
    val deviceData: ArrayList<HashMap<String, String>> = ArrayList<HashMap<String, String>>()
    private lateinit var geoClient: GeofencingClient
    private val NOTIFICATION_RESPONSIVENESS_TIME = 5000
    private val geofenceList = ArrayList<Geofence>()
    private lateinit var notificationModel: NotificationData
    //var onGeofenceCallback:onGeofenceCallback?=null

    private val geofenceIntent: PendingIntent by lazy {
        val intent = Intent(this@MainActivity, GeofenceBroadcastReceiver::class.java)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S){
            PendingIntent.getBroadcast(this@MainActivity, 0, intent,   PendingIntent.FLAG_MUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)
        }else{
            PendingIntent.getBroadcast(this@MainActivity, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //onGeofenceCallback=this
        onGeofenceCall=this
        if (intent.hasExtra(CV.NOTIFICATION_DATA)){
            val data=intent.getStringExtra(CV.NOTIFICATION_DATA).toString()
            notificationModel = Gson().fromJson(data, NotificationData::class.java)
            val hashMap=getNotificationMap(notificationModel)
            channel.invokeMethod(CV.GEOFENCE_NOTIFICATION_RECEIVE, hashMap)
        }
    }

    private fun getNotificationMap(model: NotificationData): HashMap<String, String> {
        val hashMap : HashMap<String, String> = HashMap()
        hashMap["body"] = model.body
        hashMap["deepLink"] = model.deepLink
        hashMap["notificationId"] = model.notificationId
        hashMap["title"] = model.title
        Log.d("hash Model", "onCreate: ${hashMap.values}")
        return hashMap
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        /*MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelName).setMethodCallHandler {
          call, result ->*/
        channel=MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelName)
        channel.setMethodCallHandler {
                call, result ->
           if(call.method == setGeofence){
               geoClient = LocationServices.getGeofencingClient(this)
                val latitude = call.argument<Double>(CV.LATITUDE)
                val longitude = call.argument<Double>(CV.LONGITUDE)
                val radius = call.argument<Int>(CV.RADIUSVALUE)
                Log.d("TAG", "Flutter Lat Lng " + latitude +" : "+ longitude)
                setGeofence(latitude,longitude,radius)
            }else if(call.method == setMultipleGeofence){
               onGeofenceCall=this
               geoClient = LocationServices.getGeofencingClient(this)
               val geofenceDataList = call.argument<String>(CV.GEOFENCE_LIST)
               val objectList = Gson().fromJson(geofenceDataList, Array<GeofenceData>::class.java).asList()
               Log.d("Geo single List", objectList.toString())
               setMultipleGeofence(objectList)
               CM.setSp(this,CV.GEOFENCE_LIST,Gson().toJson(objectList))
            }else {
                result.notImplemented()
            }
        }
    }

    private fun setGeofence(latitude: Double?, longitude: Double?, radius: Int?){
        geofenceList.add(
            Geofence.Builder()
                .setRequestId(resources.getString(R.string.geofenceId))
                .setCircularRegion(latitude!!, longitude!!, radius!!.toFloat())
                .setNotificationResponsiveness(NOTIFICATION_RESPONSIVENESS_TIME)
                .setExpirationDuration(Geofence.NEVER_EXPIRE)
                .setTransitionTypes(Geofence.GEOFENCE_TRANSITION_ENTER or Geofence.GEOFENCE_TRANSITION_EXIT)
                .build()
        )
        addGeofence()
    }

    private fun setMultipleGeofence(objectList: List<GeofenceData>) {
        var transitionType = 0
        for (data in objectList){
            if(data.isEntry && data.isExit){
                transitionType = Geofence.GEOFENCE_TRANSITION_ENTER or Geofence.GEOFENCE_TRANSITION_EXIT
            }else if(data.isEntry && !data.isExit){
                transitionType = Geofence.GEOFENCE_TRANSITION_ENTER
            }else{
                transitionType = Geofence.GEOFENCE_TRANSITION_EXIT
            }
            geofenceList.add(
                Geofence.Builder()
                    .setRequestId(data.notificationId)
                    .setCircularRegion(
                        data.latitude.toDouble(),
                        data.longitude.toDouble(),
                        data.radius.toFloat()
                    )
                    .setNotificationResponsiveness(NOTIFICATION_RESPONSIVENESS_TIME)
                    .setExpirationDuration(Geofence.NEVER_EXPIRE)
                    .setTransitionTypes(transitionType)
                    .build()
            )
        }
        addGeofence()
    }

    //specify the geofence to monitor and the initial trigger
    private fun seekGeofencing(): GeofencingRequest {
        return GeofencingRequest.Builder().apply {
            setInitialTrigger(GeofencingRequest.INITIAL_TRIGGER_ENTER)
            addGeofences(geofenceList)
        }.build()
    }

    //adding a geofence
    private fun addGeofence(){
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED){
            return
        }
        geoClient.addGeofences(seekGeofencing(), geofenceIntent).run {
            addOnSuccessListener {
                Log.d("seekGeofencing", "seekGeofencing: $geofenceList")
                //Toast.makeText(this@MainActivity, resources.getString(R.string.geofenceSuccess), Toast.LENGTH_SHORT).show()
                val intent = Intent(this@MainActivity, LocationService::class.java)
                ContextCompat.startForegroundService(this@MainActivity, intent)
            }
            addOnFailureListener {
                //Toast.makeText(this@MainActivity, resources.getString(R.string.geofenceFail), Toast.LENGTH_SHORT).show()
            }
        }
    }


    override fun onStart(){
        super.onStart()
    }

    override fun onDestroy(){
        super.onDestroy()
    }

   /* override fun onResume() {
        super.onResume()
        Handler(Looper.getMainLooper()).postDelayed({
            channel.invokeMethod("GEOFENCE_SUBSCRIBE","geofence is subscribe!!!")
        },0)

    }*/

    companion object {
        const val channelName=CV.CHANNEL_NAME
        const val setBluetooth = CV.BLUETOOTH_METHOD_NAME
        const val setGeofence=CV.GEOFENCE_METHOD_NAME
        const val setMultipleGeofence=CV.MULTIPLE_GEOFENCE_METHOD_NAME
        var context: Context? = null
        lateinit var channel:MethodChannel
        var onGeofenceCall:OnGeofenceCallback?=null
    }

    override fun onNotificationReceive(notificationData: String) {
        //Toast.makeText(this,"hello notification receive.",Toast.LENGTH_LONG).show()
        Log.d("from main","hello you enter in radius.")
        //channel.invokeMethod("GEOFENCE_SUBSCRIBE","geofence is subscribe!!!")
        notificationModel = Gson().fromJson(notificationData, NotificationData::class.java)
        val hashMap=getNotificationMap(notificationModel)
        channel.invokeMethod(CV.GEOFENCE_NOTIFICATION_RECEIVE, hashMap)
    }

    /*override fun onEnterRadius(notificationData: String) {
        Toast.makeText(this,"hello you enter in radius.",Toast.LENGTH_LONG).show()
        Log.d("from main","hello you enter in radius.")
        //channel.invokeMethod("GEOFENCE_SUBSCRIBE","geofence is subscribe!!!")
        notificationModel = Gson().fromJson(notificationData, NotificationData::class.java)
        val hashMap : HashMap<String, String> = HashMap()
        hashMap["body"] = notificationModel.body
        hashMap["deepLink"] = notificationModel.deepLink
        hashMap["notificationId"] = notificationModel.notificationId
        hashMap["title"] = notificationModel.title
        Log.d("hashmap Model", "on Enter: ${hashMap.values}")
        channel.invokeMethod(CV.GEOFENCE_NOTIFICATION_RECEIVE, hashMap)
    }

    override fun onExitRadius(notificationData: String){
        Toast.makeText(this,"hello you exit in radius.",Toast.LENGTH_LONG).show()
        Log.e("from main","hello you exit in radius.")
        //channel.invokeMethod("GEOFENCE_UNSUBSCRIBE","geofence is unsubscribe???")
        notificationModel = Gson().fromJson(notificationData, NotificationData::class.java)
        val hashMap : HashMap<String, String> = HashMap()
        hashMap["body"] = notificationModel.body
        hashMap["deepLink"] = notificationModel.deepLink
        hashMap["notificationId"] = notificationModel.notificationId
        hashMap["title"] = notificationModel.title
        Log.d("hashmap Model", "on Exit: ${hashMap.values}")
        channel.invokeMethod(CV.GEOFENCE_NOTIFICATION_RECEIVE,hashMap)
    }*/

}
