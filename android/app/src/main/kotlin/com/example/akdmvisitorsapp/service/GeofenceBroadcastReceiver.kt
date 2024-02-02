package com.example.akdmvisitorsapp.service
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.example.akdmvisitorsapp.MainActivity

class GeofenceBroadcastReceiver : BroadcastReceiver() {
    var geoFenceCallback: OnGeofenceCallback? =null

    //on receive geofence broadcast call service for get notification.
    override fun onReceive(context: Context?, intent: Intent?) {
        // Enqueues a JobIntentService passing the context and intent as parameters
        //geoFenceCallback = MainActivity().onGeofenceCallback
        GeofenceTransitionsJobIntentService().enqueueWork(context, intent,geoFenceCallback)

    }
}
