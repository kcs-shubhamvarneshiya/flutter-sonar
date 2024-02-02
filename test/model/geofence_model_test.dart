import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/notification/geofence.dart';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //to create the notification Model
  final geofenceNotification = GeofenceList(
      notificationId: "1234567890",
      id: "9876543210",
      notificationTitle: "Geofence Notification",
      notificationDesc: "You are entering a geofence.",
      radius: "100",
      latitude: "37.7833",
      longitude: "-122.4167",
      deepLink: "https://example.com/deeplink",
      isEntry: true,
      isExit: false);

  final geofenceModel = [geofenceNotification];
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath = File('$dir/test/json/geofence_notification_test.json')
          .readAsStringSync();

      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final List<dynamic> jsonList = jsonMap['GeofenceList'];
      // act
      var result = jsonList.map((jsonItem) => GeofenceList.fromJson(jsonItem)).toList();
      // assert
      expect(result[0].toJson(), geofenceModel[0].toJson());
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = geofenceModel;
      final expectedJsonMap = {
        "GeofenceList": [
          {
            "notificationId": "1234567890",
            "id": "9876543210",
            "notificationTitle": "Geofence Notification",
            "notificationDesc": "You are entering a geofence.",
            "radius": "100",
            "latitude": "37.7833",
            "longitude": "-122.4167",
            "deepLink": "https://example.com/deeplink",
            "isEntry": true,
            "isExit": false
          }
        ]
      };
      expect(result[0].toJson(), expectedJsonMap['GeofenceList']![0]);
    });
  });
}
