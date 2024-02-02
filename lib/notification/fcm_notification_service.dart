import 'dart:convert';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/notification/notification.dart';
import '../utils/BottomNavNotifier.dart';
import '../utils/constants.dart';
import '../utils/enums.dart';
import '../utils/strings.dart';

@singleton
class FcmNotificationService {
  bool isFlutterLocalNotificationsInitialized = false;

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  List<NotificationLog> savedNotificationList = [];
  static bool initialRedirection = false;
  AppJsonRepository appJsonRepository;

  FcmNotificationService(
      this.flutterLocalNotificationsPlugin, this.appJsonRepository);

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {
          //local notification receive
        });

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    //application is opened from a foreground state.
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      if (notificationResponse.payload != "null") {
        onSelectNotification(notificationResponse.payload);
      }
    });

    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      // description
      importance: Importance.high,
    );

    //flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            Constant.notificationChannelId, Constant.notificationChannelName,
            channelDescription: Constant.channelDescription,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
  }

  void showFCMFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      // description
      importance: Importance.high,
    );
    if (notification != null && android != null && !kIsWeb) {
      var model = NotificationLog(
          id: notification.hashCode.toString(),
          title: notification.title,
          body: notification.body,
          isRead: true,
          isSelected: false,
          previewBody: message.data["previewBody"].toString(),
          deepLink: message.data["deepLink"].toString());
      var encodedData = jsonEncode(model);
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: 'launch_background',
            styleInformation: BigTextStyleInformation(
              htmlFormatContent: true,
              notification.body.toString(),
              htmlFormatBigText: true,
            ),
          ),
        ),
        payload: encodedData,
      );
      storeLocalNotification(
          notification.hashCode.toString(),
          notification.title.toString(),
          notification.body.toString(),
          false,
          message.data["previewBody"].toString(),
          DateTime.now().toIso8601String(),
          message.data["deepLink"].toString());
    }
  }

  //FCM notification listen methods
  Future<void> configureFCMNotifications() async {
    FirebaseMessaging.instance.getToken().then((value) async {
      print("FCM: Token:${value}");
      SharedPreferences? sharedPreferences = getIt<SharedPreferences>();
      sharedPreferences.setString(Constant.deviceToken,value.toString());
    });
    // subscribe to topic on each app start-up
    subscribeForFCMTopic(GeoFenceNotifyType.ALL.name);

    //application is opened from a terminated state.
    FirebaseMessaging.instance.getInitialMessage().then((value) async {
      print("FCM Initialized: ${value?.data.toString()}");
      if (value != null) {
        initialRedirection = true;
        await Future.delayed(const Duration(seconds: 3));
        fcmRedirection(value.data['deepLink'].toString());
      }
    });

    //application is opened from a foreground state.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("FCM:onMessage:${message.notification}");
      if (message.notification != null) {
        setupFlutterNotifications();
        showFCMFlutterNotification(message);
      }
    });

    //application is opened from a background state.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      /*print('A new onMessageOpenedApp event was published!');*/
      fcmRedirection(message.data['deepLink'].toString());
    });
  }

  //Subscribe for Topic

  void subscribeForFCMTopic(String topicName) {
    //FirebaseMessaging.instance.subscribeToTopic('ON_CAMPUS');
    FirebaseMessaging.instance
        .subscribeToTopic(topicName); //ONCAMPUS / OFFCAMPUS / ALL
    //showToast("Geofence data subscribe");
  }

  void unSubscribeForFCMTopic(String topicName) {
    //FirebaseMessaging.instance.subscribeToTopic('ON_CAMPUS');
    FirebaseMessaging.instance
        .unsubscribeFromTopic(topicName); //ONCAMPUS / OFFCAMPUS / ALL
    //showToasts("Geofence data unsubscribe");
  }

  Future<void> storeLocalNotification(String id, String title, String body,
      bool isRead, String previewBody, String date, String deepLink) async {
    savedNotificationList.clear();
    SharedPreferences? sharedPreferences = getIt<SharedPreferences>();
    //var sharedPreferences = getIt<SharedPreferences>();
    List? listString = sharedPreferences.getStringList(notificationList);
    print("notificationList:${listString?.length}");
    var notification = NotificationLog(id:id,type: NotificationType.FCM.name,
        title: title,isRead:isRead ,date: date,body: body,
        isSelected: false,previewBody: previewBody, deepLink: deepLink);
    if(listString == null){
      savedNotificationList.add(notification);
      List<String> updatedNotificationList = savedNotificationList
          .map((item) => jsonEncode(item.toJson()))
          .toList();
      sharedPreferences.setStringList(
          notificationList, updatedNotificationList);
    } else {
      List<NotificationLog> oldList = listString
          .map((item) => NotificationLog.fromJson(json.decode(item)))
          .toList();
      savedNotificationList.addAll(oldList);
      bool isExisted = oldList.map((item) => item.id).contains(id.toString());
      int index = oldList.indexWhere((element) => element.id == id.toString());
      if (isExisted) {
        oldList[index].isRead = isRead;
        List<String> updatedList =
            oldList.map((item) => jsonEncode(item.toJson())).toList();
        sharedPreferences.setStringList(notificationList, updatedList);
      }else{
        savedNotificationList.add(notification);
        List<String> updatedList = savedNotificationList
            .map((item) => jsonEncode(item.toJson()))
            .toList();
        sharedPreferences.setStringList(notificationList, updatedList);
      }
    }
    updateCount(savedNotificationList);
  }

  Future<void> redirectToAttraction(String id) async {
    List<Attraction> temp = [];
    AppJsonModel jsonDataRepo = await appJsonRepository.loadJsonAssetData();
    var attractionData = jsonDataRepo.attractions
        ?.firstWhere((element) => element.id == int.parse(id));
    if (attractionData != null) {
      temp.add(attractionData);
    }
    getIt<AppRouter>().push(
      AttractionDetailsRoute(appJsonModel: temp, isDeeplink: true),
    );
  }

  void updateCount(List<NotificationLog> savedNotificationList) {
    if (savedNotificationList.isNotEmpty) {
      var notificationCount =
          savedNotificationList.where((i) => i.isRead == false).toList().length;
      updateValue.countValueNotifier.value = notificationCount;
      print("notification Fcm Count:$notificationCount");
    }
  }

  void onSelectNotification(String? notificationPayload) {
    var data = json.decode(notificationPayload!);
    print("Notification payload${data.toString()}");
    storeLocalNotification(
        data['id'].toString(),
        data['title'].toString(),
        data['body'].toString(),
        data['isRead'],
        data['previewBody'],
        DateTime.now().toIso8601String(),
        data["deepLink"].toString());
    fcmRedirection(data['deepLink'].toString());
  }

  fcmRedirection(String screenType) {
    if (screenType.contains("${Constant.attractionScreen}:")) {
      var attractionId = screenType.split(":")[1];
      redirectToAttraction(attractionId);
    }
    switch (screenType) {
      case Constant.mapScreen:
        getIt<AppRouter>().push(HomeBottomNavRoute(initialIndex: 1));
        break;
      case Constant.visitScreen:
        getIt<AppRouter>().push(HomeBottomNavRoute(initialIndex: 2));
        break;
      case Constant.moreScreen:
        getIt<AppRouter>().push(HomeBottomNavRoute(initialIndex: 3));
        break;
      case Constant.attractionScreen:
        getIt<AppRouter>().push(HomeBottomNavRoute(initialIndex: 1));
        break;
      case Constant.notificationScreen:
        getIt<AppRouter>().push(const NotificationScreenRoute());
        break;
      default:
        return getIt<AppRouter>().replace(const HeaderFooterHomeRoute());
    }
  }
}
