import UIKit
import Flutter
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    let METHOD_CHANNEL_GEOFENCE = "geofence_connect"
    let GEOFENCE_NOTI_RECEIVED = "geofenceNotificationReceived"
    let PUSH_NOTI_TYPE = "push"
    
    private let locationNotificationScheduler = LocationNotificationScheduler()
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        getLoadedNotifications()
    }
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      locationNotificationScheduler.delegate = self
      let deviceChannel = FlutterMethodChannel(name: METHOD_CHANNEL_GEOFENCE, binaryMessenger: controller.binaryMessenger)
      prepareMethodHandler(deviceChannel: deviceChannel)
      
      GeneratedPluginRegistrant.register(with: self)
    Thread.sleep(forTimeInterval: 1.0)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

extension AppDelegate: LocationNotificationSchedulerDelegate {
    
    func locationPermissionDenied() {
        let message = "The location permission was not authorized. Please enable it in Settings to continue."
        presentSettingsAlert(message: message)
    }
    
    func notificationPermissionDenied() {
        let message = "The notification permission was not authorized. Please enable it in Settings to continue."
        presentSettingsAlert(message: message)
    }
    
    func notificationScheduled(error: Error?) {
        if let error = error {
            let alertController = UIAlertController(title: "Notification Schedule Error",
                                                    message: error.localizedDescription,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(title: "Notification Scheduled!",
                                                    message: "You will be notified when you are near the location!",
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //present(alertController, animated: true)
        }
    }
    
    override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                         withCompletionHandler completionHandler: @escaping () -> Void) {
        print("iOS:didReceive------------")
        sendNotificationDataToFlutterViaMethodChannel(notification: response.notification, isReceived: true)
        completionHandler()
    }
    
    override func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // This will call on notification present in the screen
        print("iOS:willPresent------------")
        sendNotificationDataToFlutterViaMethodChannel(notification: notification, isReceived: false)
        completionHandler([.alert, .sound])
    }
    private func presentSettingsAlert(message: String) {
        let alertController = UIAlertController(title: "Permissions Denied!",
                                                message: message,
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alertAction) in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        
        //present(alertController, animated: true)
    }
}
//Push Notification Handlers
extension AppDelegate{
 
    //This method will have the list of delivered notifications but not clicked by the user. Once user will launch/active the app, it will store all delivered notifications via Method channel to flutter and remove them from notification tray.
    private func getLoadedNotifications(){
            let center = UNUserNotificationCenter.current()
        center.getDeliveredNotifications(completionHandler: { (notificationRequests) in
            for notification in notificationRequests {
                //print("getLoadedNotifications: For:\(x.request.content.title)")
                DispatchQueue.main.async {
                    self.sendNotificationDataToFlutterViaMethodChannel(notification: notification, isReceived: false)
                }
            }
            
            center.removeAllDeliveredNotifications()
            center.removeAllPendingNotificationRequests()
        })
    }
    
    private func sendNotificationDataToFlutterViaMethodChannel(notification: UNNotification, isReceived : Bool){
        var data = [String: Any]()
        let notificationData = notification.request.content.userInfo
        let title = notification.request.content.title
        let body = notification.request.content.body
        //Date and time when notification received
        let actualDate = notification.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSS" //ISO format
        let notificationDate = dateFormatter.string(from: actualDate)
        
        if(notification.request.trigger is UNPushNotificationTrigger){
            //Push Notification
            print("iOS:PUSH:\(notification.request.identifier)")
            data = ["notificationId": notification.request.identifier,
                        "deepLink": PUSH_NOTI_TYPE,
                    "title": title, "body": body,
                    "previewBody" : notificationData["previewBody"] ?? "",
                    "screenRedirect" : notificationData["deepLink"] ?? "",
                    "notificationDate" : notificationDate]
        }else{
            //Local Notification
            print("iOS:LOCAL:\(notification.request.identifier)")
            if(isReceived){
                data = ["notificationId": notificationData["notificationId"] ?? "",
                                        "deepLink": "\(notificationData["deepLink"] ?? "")",
                                        "title": title, "body": body]
            }
        }
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let deviceChannel = FlutterMethodChannel(name: METHOD_CHANNEL_GEOFENCE, binaryMessenger: controller.binaryMessenger)
        deviceChannel.invokeMethod(GEOFENCE_NOTI_RECEIVED, arguments: data)
    }
    private func prepareMethodHandler(deviceChannel: FlutterMethodChannel) {
        deviceChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if call.method == "setLocationBasedNotification" {
                self.receiveNotificationDetailsFromFlutterCode(call, result: result)
            }
            else {
                result(FlutterMethodNotImplemented)
                return
            }
        })
    }
    
    private func receiveNotificationDetailsFromFlutterCode(_ call: FlutterMethodCall, result: FlutterResult) {
        
        if let args = call.arguments as? Dictionary<String, Any>,
           let latitude = args["latitude"] as? Double,
           let longitude = args["longitude"] as? Double,
           let radius = args["radius"] as? Double,
           let notificationId = args["notificationId"] as? String,
           let notificationTitle = args["notificationTitle"] as? String,
           let notificationDesc = args["notificationDesc"] as? String,
           let deepLink = args["deepLink"] as? String,
           let isEntry = args["isEntry"] as? Bool,
           let isExit = args["isExit"] as? Bool{
            print("From Flutter:\(args)")
            
            // Notification is created
            let notificationInfo = LocationNotificationInfo(notificationId: notificationId,
                                                            locationId: notificationId,
                                                            radius: radius,
                                                            latitude: latitude,longitude: longitude,
                                                            title: notificationTitle,
                                                            body: notificationDesc,
                                                                  onEntry: isEntry,
                                                                  onExit: isExit,
                                                                 data: ["notificationId": notificationId,"deepLink":deepLink])
            
            locationNotificationScheduler.requestNotification(with: notificationInfo)
            result("Geofence notification configured successfully")
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
        
    }
}
