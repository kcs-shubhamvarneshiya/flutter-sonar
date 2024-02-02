package com.example.akdmvisitorsapp.service

import CV
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.BitmapFactory
import android.graphics.Color
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.text.TextUtils
import android.util.Log
import androidx.core.app.JobIntentService
import androidx.core.app.NotificationCompat
import androidx.core.app.TaskStackBuilder
import com.example.akdmvisitorsapp.MainActivity
import com.example.akdmvisitorsapp.MainActivity.Companion.onGeofenceCall
import com.example.akdmvisitorsapp.R
import com.example.akdmvisitorsapp.model.GeofenceData
import com.example.akdmvisitorsapp.model.NotificationData
import com.example.akdmvisitorsapp.util.CM
import com.example.akdmvisitorsapp.util.GeofenceErrorMessages
import com.google.android.gms.location.Geofence
import com.google.android.gms.location.GeofencingEvent
import com.google.gson.Gson
import java.util.*


class GeofenceTransitionsJobIntentService : JobIntentService() {
    private val JOB_ID = 573
    private val TAG = "GeofenceTransitionsIS"
    private val CHANNEL_ID = "channel_01"
    var geoFencecallBack: OnGeofenceCallback? =null
    fun enqueueWork(context: Context?, intent: Intent?,onGeofenceCallback :OnGeofenceCallback?) {
        geoFencecallBack = onGeofenceCallback
        enqueueWork(context!!, GeofenceTransitionsJobIntentService::class.java, JOB_ID, intent!!)
    }

    override fun onCreate() {
        super.onCreate()
    }
    override fun onHandleWork(intent: Intent) {
        val geofencingEvent = GeofencingEvent.fromIntent(intent)

        if (geofencingEvent != null) {
            if (geofencingEvent.hasError()) {
                val errorMessage: String = GeofenceErrorMessages.getErrorString(this, geofencingEvent.errorCode).toString()
                Log.e(TAG, errorMessage)
                return
            }
        }

        // Test that the reported transition was of interest.
        // Get the transition type.
        val geofenceTransition = geofencingEvent?.geofenceTransition

        Log.e("TAG", "Geo Fence Transition ... $geofenceTransition")
        if (geofenceTransition == Geofence.GEOFENCE_TRANSITION_ENTER){
            //geoFencecallBack?.onEnterRadius()
            /*Handler(Looper.getMainLooper()).post{
                MainActivity.channel.invokeMethod("GEOFENCE_SUBSCRIBE","geofence is subscribe!!!")
            }*/
            val triggeringGeofences = geofencingEvent.triggeringGeofences
            //Get the transition details as a String.
            val geofenceTransitionDetails: String = getGeofenceTransitionDetails(geofenceTransition, triggeringGeofences!!)
            val data = CM.getSp(this,CV.GEOFENCE_LIST, "").toString()
            val objectList = Gson().fromJson(data, Array<GeofenceData>::class.java).asList()
            for(i in objectList.indices){
                for(j in triggeringGeofences.indices){
                    if(objectList[i].notificationId == triggeringGeofences[j].requestId && objectList[i].deepLink =="campus"){
                        sendNotification(objectList[i])
                        Handler(Looper.getMainLooper()).post{
                            val model=NotificationData()
                            model.notificationId=objectList[i].notificationId
                            model.body=objectList[i].notificationDesc
                            model.title=objectList[i].notificationTitle
                            model.deepLink=objectList[i].deepLink
                            //onGeofenceCall?.onEnterRadius(Gson().toJson(model))
                            //comment as receive multiple notification.
                            onGeofenceCall?.onNotificationReceive(Gson().toJson(model))
                        }
                    }else if(objectList[i].notificationId == triggeringGeofences[j].requestId){
                        sendNotification(objectList[i])
                    }
                }
            }
            //sendNotification(getString(R.string.enterRadiusMsg))
        } else if (geofenceTransition == Geofence.GEOFENCE_TRANSITION_EXIT) {
            //geoFencecallBack?.onExitRadius()
            /*Handler(Looper.getMainLooper()).post{
                MainActivity.channel.invokeMethod("GEOFENCE_UNSUBSCRIBE","geofence is unsubscribe???")
            }*/
            val triggeringGeofences = geofencingEvent.triggeringGeofences
            val geofenceTransitionDetails: String = getGeofenceTransitionDetails(geofenceTransition, triggeringGeofences!!)
            val data = CM.getSp(this,CV.GEOFENCE_LIST, "").toString()
            val objectList = Gson().fromJson(data, Array<GeofenceData>::class.java).asList()
            for(i in objectList.indices){
                for(j in triggeringGeofences.indices){
                    if(objectList[i].notificationId == triggeringGeofences[j].requestId && objectList[i].deepLink =="campus"){
                        sendNotification(objectList[i])
                        Handler(Looper.getMainLooper()).post{
                            val model=NotificationData()
                            model.notificationId=objectList[i].notificationId
                            model.body=objectList[i].notificationDesc
                            model.title=objectList[i].notificationTitle
                            model.deepLink=objectList[i].deepLink
                            //onGeofenceCall?.onExitRadius(Gson().toJson(model))
                            //comment as receive multiple notification.
                            onGeofenceCall?.onNotificationReceive(Gson().toJson(model))
                        }
                    }else if(objectList[i].notificationId == triggeringGeofences[j].requestId){
                        sendNotification(objectList[i])
                    }
                }
            }
            //sendNotification(getString(R.string.exitRadiusMsg))
        } else if (geofenceTransition == Geofence.GEOFENCE_TRANSITION_DWELL) {
            //sendNotification(getString(R.string.dwellRadiusMsg),getString(R.string.geofence_transition_notification_text))
        }
    }

    private fun sendNotification(geofenceData: GeofenceData){
        // Get an instance of the Notification manager
        val id= Random(System.currentTimeMillis()).nextInt(1000)
        val mNotificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
            val name: CharSequence = getString(R.string.app_name)
            val mChannel = NotificationChannel(CHANNEL_ID, name, NotificationManager.IMPORTANCE_DEFAULT)
            mNotificationManager.createNotificationChannel(mChannel)
        }

        val notificationIntent = Intent(applicationContext, MainActivity::class.java)
        val model=NotificationData()
        model.notificationId=geofenceData.notificationId
        model.body=geofenceData.notificationDesc
        model.title=geofenceData.notificationTitle
        model.deepLink=geofenceData.deepLink
        notificationIntent.putExtra(CV.NOTIFICATION_DATA,Gson().toJson(model))

        val stackBuilder = TaskStackBuilder.create(this)
        stackBuilder.addParentStack(MainActivity::class.java)
        stackBuilder.addNextIntent(notificationIntent)

        // Get a PendingIntent containing the entire back stack.
        val notificationPendingIntent = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            stackBuilder.getPendingIntent(id, PendingIntent.FLAG_IMMUTABLE)//PendingIntent.FLAG_UPDATE_CURRENT or FLAG_IMMUTABLE
        } else {
            stackBuilder.getPendingIntent(id, PendingIntent.FLAG_UPDATE_CURRENT)
        }
        Log.d(TAG, "sendNotification ${geofenceData.notificationId}: ${id}")

        // Get a notification builder that's compatible with platform versions >= 4
        val builder = NotificationCompat.Builder(this,CHANNEL_ID)
        builder.setSmallIcon(R.drawable.ic_baseline_notifications_24)
            .setLargeIcon(BitmapFactory.decodeResource(resources, R.drawable.ic_baseline_notifications_24))
            .setColor(Color.RED)
            .setContentTitle(geofenceData.notificationTitle)
            .setContentText(geofenceData.notificationDesc)
            .setContentIntent(notificationPendingIntent)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            builder.setChannelId(CHANNEL_ID) // Channel ID
        }
        builder.setAutoCancel(true)
        mNotificationManager.notify(id, builder.build())
    }


    private fun getGeofenceTransitionDetails(
        geofenceTransition: Int,
        triggeringGeofences: List<Geofence>
    ): String {
        val geofenceTransitionString: String = getTransitionString(geofenceTransition)
        // Get the Ids of each geofence that was triggered.
        val triggeringGeofencesIdsList = ArrayList<String?>()
        for (geofence in triggeringGeofences) {
            triggeringGeofencesIdsList.add(geofence.requestId)
        }
        val triggeringGeofencesIdsString = TextUtils.join(", ", triggeringGeofencesIdsList)
        return "$geofenceTransitionString: $triggeringGeofencesIdsString"
    }

    private fun getTransitionString(transitionType: Int): String {
        return when (transitionType) {
            Geofence.GEOFENCE_TRANSITION_ENTER -> getString(R.string.geofence_transition_entered)
            Geofence.GEOFENCE_TRANSITION_EXIT -> getString(R.string.geofence_transition_exited)
            else -> getString(R.string.unknown_geofence_transition)
        }
    }


}

