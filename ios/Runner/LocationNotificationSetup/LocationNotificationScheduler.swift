//
//  LocationNotificationScheduler.swift
//  LocationNotifier
//
//  Created by Jonathan Samudio on 5/8/19.
//  Copyright © 2019 Jonathan Samudio. All rights reserved.
//

import CoreLocation
import UserNotifications
import CoreLocation
import MapKit

class LocationNotificationScheduler: NSObject {
    
    // MARK: - Public Properties
    
    weak var delegate: LocationNotificationSchedulerDelegate? {
        didSet {
            UNUserNotificationCenter.current().delegate = delegate
        }
    }
    
    
    // MARK: - Private Properties
    
    private let locationManager = CLLocationManager()
    
    // MARK: - Public Functions
    
    /// Request a geo location notification with optional data.
    ///
    /// - Parameter data: Data that will be sent with the notification.
    func requestNotification(with notificationInfo: LocationNotificationInfo) {
        DispatchQueue.global().async {
            self.locationManager.requestWhenInUseAuthorization()
            if CLLocationManager.locationServicesEnabled() {
              // your code here
                self.locationManager.allowsBackgroundLocationUpdates = true
                self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
                self.locationManager.startMonitoringSignificantLocationChanges()
                self.locationManager.startUpdatingLocation()
                self.locationManager.allowsBackgroundLocationUpdates = true
                self.locationManager.delegate = self
                self.askForNotificationPermissions(notificationInfo: notificationInfo)
            }
        }
//        switch CLLocationManager.authorizationStatus() {
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//            askForNotificationPermissions(notificationInfo: notificationInfo)
//        case .authorizedWhenInUse, .authorizedAlways:
//            askForNotificationPermissions(notificationInfo: notificationInfo)
//        case .restricted, .denied:
//            delegate?.locationPermissionDenied()
//            break
//        }
    }
}

// MARK: - Private Functions

private extension LocationNotificationScheduler {
    
    func askForNotificationPermissions(notificationInfo: LocationNotificationInfo) {
        guard CLLocationManager.locationServicesEnabled() else {
            return
        }
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge],
            completionHandler: { [weak self] granted, _ in
                guard granted else {
                    DispatchQueue.main.async {
                        self?.delegate?.notificationPermissionDenied()
                    }
                    return
                }
                
                self?.requestNotification(notificationInfo: notificationInfo)
            })
    }
    
    func requestNotification(notificationInfo: LocationNotificationInfo) {
        
        let notification = notificationContent(notificationInfo: notificationInfo)
        let destRegion = destinationRegion(notificationInfo: notificationInfo)
        let trigger = UNLocationNotificationTrigger(region: destRegion, repeats: true)
        
        let request = UNNotificationRequest(identifier: notificationInfo.notificationId,
                                            content: notification,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { [weak self] (error) in
            DispatchQueue.main.async {
                self?.delegate?.notificationScheduled(error: error)
            }
        }
    }
    
    func notificationContent(notificationInfo: LocationNotificationInfo) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "\(notificationInfo.title)"
        content.body = notificationInfo.body
        content.sound = UNNotificationSound.defaultCritical
        
        if let data = notificationInfo.data {
            content.userInfo = data
        }
        return content
    }
    
    func destinationRegion(notificationInfo: LocationNotificationInfo) -> CLCircularRegion {
        let destRegion = CLCircularRegion(center: notificationInfo.coordinates,
                                          radius: notificationInfo.radius,
                                          identifier: notificationInfo.locationId)
        destRegion.notifyOnEntry = notificationInfo.onEntry
        destRegion.notifyOnExit = notificationInfo.onExit
        return destRegion
    }
}


extension LocationNotificationScheduler : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            //print("Latitude \(location.coordinate.latitude), \(location.coordinate.longitude)")
        }
    }
}
