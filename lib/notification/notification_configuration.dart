import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/campus/campus.dart';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../model/notification/geofence.dart';
import '../router_page/app_router.dart';
import '../utils/constants.dart';
import '../utils/enums.dart';
import '../utils/strings.dart';

class NotificationConfigurations {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  int id = 0;
  static const channelName = MethodChannel(Constant.channelName);
  List<NotificationLog> savedNotificationList = [];

  Future setupLocalNotification(String msg, String? attraction) async {
    id=UniqueKey().hashCode;
    AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:(int id, String? title, String? body, String? payload) async {
          //local notification receive
        });

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:(NotificationResponse notificationResponse) async {
      if(notificationResponse.payload !="null" ){
        onSelectNotification(notificationResponse.payload);
      }
      //storeLocalNotification(Constant.notificationTitle,msg,true);
    });

    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(Constant.notificationChannelId,
        Constant.notificationChannelName,
        channelDescription: Constant.channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
        id, Constant.notificationTitle, msg, notificationDetails,
        payload: attraction.toString());

    //storeLocalNotification(Constant.notificationTitle!,msg!,false);

  }

  Future<dynamic> onSelectNotification(payload) async {
    List<Attraction>jsonList = [];
    var attraction = Attraction.fromJson(json.decode(payload));
    jsonList.add(attraction);
    //implement the navigation logic
    getIt<AppRouter>().push(
      AttractionDetailsRoute(
        appJsonModel: jsonList),
    );
  }

  Future<void> setupGeofencingNotification(Campus campus, List<Attraction>? attractions) async {
    List<GeofenceList> geofenceList = <GeofenceList>[];
    for(var data in attractions!){
      if(data.notificationMessage !=null){
        geofenceList.add(GeofenceList(id: data.id.toString(),longitude:data.longitude,latitude:data.latitude ,radius: data.radius.toString(),notificationDesc: data.notificationMessage!.body,notificationTitle: data.notificationMessage!.title,notificationId: data.id.toString(),deepLink: NotificationTypeForRedirection.attraction.name,isExit: true,isEntry: true));
        if(Platform.isIOS){
          createiOSLocationBasedNotifications(double.parse(data.latitude.toString()), double.parse(data.longitude.toString()), double.parse(data.radius.toString()), data.id.toString(),'${data.notificationMessage!.title}',
              '${data.notificationMessage!.body}',NotificationTypeForRedirection.attraction.name,true,true);
        }
      }
    }
    geofenceList.add(GeofenceList(notificationId:Constant.campusEntryId ,id:Constant.campusEntryId ,notificationTitle: "Welcome!",notificationDesc: "Welcome to Akshardham temple.",radius: "50",latitude: campus.latitude,longitude:campus.longitude,deepLink: NotificationTypeForRedirection.campus.name,isEntry: true,isExit:false));
    geofenceList.add(GeofenceList(notificationId:Constant.campusExitId ,id:Constant.campusExitId ,notificationTitle: "Thank You!",notificationDesc: "Thank You for visiting akshardham temple.",radius: "50",latitude: campus.latitude,longitude:campus.longitude,deepLink: NotificationTypeForRedirection.campus.name,isEntry: false,isExit:true));

    if(Platform.isIOS){
      //createiOSLocationBasedNotifications(latitude, longitude, 50);
      createiOSLocationBasedNotifications(double.parse(campus.latitude.toString()), double.parse(campus.longitude.toString()), 50,Constant.campusEntryId,'Welcome to Akshardham Temple!',
      'Tap to see more information',NotificationTypeForRedirection.campus.name,true,false);
      createiOSLocationBasedNotifications(double.parse(campus.latitude.toString()), double.parse(campus.longitude.toString()), 50,Constant.campusExitId,'Thank You for visiting Akshardham Temple',
          'Hope you enjoyed the visit!',NotificationTypeForRedirection.campus.name,false,true);

      //Home location geofence
      /*createiOSLocationBasedNotifications(23.0605120, 72.5594155, 50,'pmp_home_entry_id','Welcome Home!',
          'Finally day end and take rest!','Attraction',true,false);
      createiOSLocationBasedNotifications(23.0605120, 72.5594155, 50,'pmp_home_exit_id','Ready for Work?',
          'Day started! Be ready for AKDM App work','Campus',false,true);*/
      //createiOSLocationBasedNotifications(23.037657, 72.542235, 200);//Gujarat University Location
    }else{
      //await channelName.invokeMethod(Constant.getGeofenceMethod,{'latitude': latitude,'longitude':longitude,'radiusValue':10});
      //await channelName.invokeMethod(Constant.getGeofenceListMethod,{'geofenceList': geofenceList.toList(),});
      //List<Map<String, dynamic>> jsonList = geofenceList.map((obj) => obj.toJson()).toList();
      //await channelName.invokeMethod(Constant.getGeofenceListMethod,{'geofenceList': json.encode(geofenceList).toString(),});
      await channelName.invokeMethod(Constant.getGeofenceListMethod,{'geofenceList': json.encode(geofenceList).toString(),});
    }
  }

  Future<void> createiOSLocationBasedNotifications(double lat, double long,
      double radius, String notificationId, String notificationTitle, String notificationDesc, String deepLink,
      bool isEntry, bool isExit) async {
    //const platformChannel = MethodChannel('in.co.kcspl.akdmvisitorsapp/iOS');
    String _model;
    try {
      //final String result = await platformChannel.invokeMethod(
      final String result = await channelName.invokeMethod(
          'setLocationBasedNotification',
          {'latitude': lat, 'longitude': long, 'radius': radius,
            'notificationId': notificationId, 'notificationTitle': notificationTitle,
            'notificationDesc': notificationDesc, 'deepLink': deepLink, 'isEntry': isEntry, 'isExit': isExit});

      _model = result;
      //print("createiOSLocationBasedNotifications:(${lat},${long}): ${radius}Radius");
      //Functions.showToast("Geofence:${_model}");
    } catch (e) {
      _model = "Can't fetch the method: '$e'.";
    }
  }

  void setupIBeaconNotification(){

  }

  Future<void> storeLocalNotification(String title,String body, bool isRead) async {
    SharedPreferences? sharedPreferences = getIt<SharedPreferences>();
    List? listString = sharedPreferences.getStringList(notificationList);
    print("notificationList:${listString?.length}");
    var notificaiton = NotificationLog(id:id.toString(),type: NotificationType.LOCAL.name,title: title,isRead:isRead ,date: DateTime.now().toIso8601String(),body: body,isSelected: false,previewBody: "");
    if(listString == null){
      savedNotificationList.add(notificaiton);
      List<String> updatedNotificationList = savedNotificationList
          .map((item) => jsonEncode(item.toJson()))
          .toList();
      sharedPreferences.setStringList(notificationList, updatedNotificationList);
    }else {
      List<NotificationLog> oldList = listString.map((item) => NotificationLog.fromJson(json.decode(item))).toList();
      bool isExisted = oldList
          .map((item) => item.id)
          .contains(id.toString());
      int index = oldList.indexWhere((element) => element.id == id.toString());
      if(isExisted){
        oldList[index].isRead =isRead;
        List<String> updatedList = oldList.map((item) => jsonEncode(item.toJson())).toList();
        sharedPreferences.setStringList(notificationList, updatedList);
        print("store method:${title.toString()}\n body:${body.toString()}isRead:${isRead}");
      }else{
        savedNotificationList.addAll(oldList);
        savedNotificationList.add(notificaiton);
        List<String> updatedList = savedNotificationList
            .map((item) => jsonEncode(item.toJson()))
            .toList();
        sharedPreferences.setStringList(notificationList, updatedList);
      }
    }
  }

  /*List<GeofenceList> geofenceList = <GeofenceList>[
    GeofenceList(notificationId:"1" ,id:"1" ,notificationTitle: "Welcome Center",notificationDesc: "Welcome Center attraction.",radius: "20",latitude: "23.0101207",longitude: "72.6339118",deepLink: "Attraction",isEntry: false,isExit:true),
    GeofenceList(notificationId:"2" ,id:"2" ,notificationTitle: "Nilkanth Plazza",notificationDesc: "Nilkanth Plazza attraction.",radius: "20",latitude: "23.0376497",longitude: "72.5422683",deepLink: "Attraction",isEntry: true,isExit:true),
    GeofenceList(notificationId:"3" ,id:"0" ,notificationTitle: "Campus Timing",notificationDesc: "Welcome to akdm campus.",radius: "20",latitude: "23.0376497",longitude: "72.5422683",deepLink: "Campus",isEntry: true,isExit:true),
  ];*/

}



