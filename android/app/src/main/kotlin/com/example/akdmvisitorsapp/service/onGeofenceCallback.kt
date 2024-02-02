package com.example.akdmvisitorsapp.service

import com.example.akdmvisitorsapp.model.NotificationData

interface OnGeofenceCallback{
    /*fun onEnterRadius(notificationData: String)
    fun onExitRadius(notificationData: String)*/
    fun onNotificationReceive(notificationData: String)
}