
import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/announcements/announcements.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //to create the Announcement Model
  final announcementList = Announcements(
      id: 1,
      priority: "INFO",
      title: "Update to Mandir Timings",
      message: "Mandir timings have been updated to reflect the summer visiting hours",
      details: "",
      thumbnail: "https://upload.wikimedia.org/wikipedia/commons/7/77/Akshardham_Gandhinagar_Gujarat.jpg",
      startTime: "2023-04-30T01:13:03.074Z",
      endTime: "2023-04-30T02:13:03.074Z"
  );

  final announceModel = AppJsonModel(announcements: <Announcements>[announcementList]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath =  File('$dir/test/json/annoucement_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = AppJsonModel.fromJson(jsonMap);
      // assert
      expect(result,announceModel);

    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = announceModel ;
      // assert

      final expectedJsonMap = {
        "announcements": [
          {
            "id": 1,
            "priority": "INFO",
            "title": "Update to Mandir Timings",
            "message": "Mandir timings have been updated to reflect the summer visiting hours",
            "details": "",
            "thumbnail": "https://upload.wikimedia.org/wikipedia/commons/7/77/Akshardham_Gandhinagar_Gujarat.jpg",
            "startTime": "2023-04-30T01:13:03.074Z",
            "endTime": "2023-04-30T02:13:03.074Z"
          },
        ],
      };
      expect(result.announcements![0].toJson(), expectedJsonMap['announcements']![0]);
    });
  });
}
