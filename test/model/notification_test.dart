import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //to create the notification Model
  final  notificationLog =  NotificationLog(
      id:"1",
      title:"Welcome Message from TEMPLE",
      body:"Welcome to mandir area!!.",
      date:"2023-10-25T22:36:00.733032",
      type:"FCM",
      isRead:true,
      isSelected:false,
      previewBody:"Jay Swaminarayan Swaminarayan Lord, also known as Bhagwan Swaminarayan.",
      deepLink:"ATTRACTION:1"
  );

  final notificationModel =[notificationLog];
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath = File('$dir/test/json/notification_log_test.json').readAsStringSync();
      // act
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final List<dynamic> jsonList = jsonMap['NotificationLog'];
      // act
      var result =jsonList.map((jsonItem) => NotificationLog.fromJson(jsonItem)).toList();
      // assert
      expect(result[0].toJson(),notificationModel[0].toJson());
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = notificationModel;
      final expectedJsonMap = {
        "NotificationLog": [
          {
            "id": "1",
            "title": "Welcome Message from TEMPLE",
            "body": "Welcome to mandir area!!.",
            "date": "2023-10-25T22:36:00.733032",
            "type": "FCM",
            "previewBody": "Jay Swaminarayan Swaminarayan Lord, also known as Bhagwan Swaminarayan.",
            "deepLink": "ATTRACTION:1",
            "isRead": true,
            "isSelected": false
          },
          {
            "id": "2",
            "title": "Welcome Message from BAPS",
            "body": "Welcome to akshardham!!.",
            "date": "2023-10-25T22:35:27.165877",
            "type": "FCM",
            "previewBody": "Jay Swaminarayan Swaminarayan Lord, also known as Bhagwan Swaminarayan.",
            "deepLink": "ATTRACTION:2",
            "isRead": true,
            "isSelected": false
          }
        ]
      };
      expect(result[0].toJson(), expectedJsonMap['NotificationLog']![0]);
    });
  });
}
