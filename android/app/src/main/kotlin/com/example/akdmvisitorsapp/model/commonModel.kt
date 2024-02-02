package com.example.akdmvisitorsapp.model


data class GeofenceData(
    var attractionId: String = "",
    var deepLink: String = "",
    var isEntry: Boolean = false,
    var isExit: Boolean = false,
    var latitude: String = "",
    var longitude: String = "",
    var notificationDesc: String = "",
    var notificationId: String = "",
    var notificationTitle: String = "",
    var radius: String = ""
)

data class NotificationData(
    var body: String = "",
    var deepLink: String = "",
    var notificationId: String = "",
    var title: String = ""
)