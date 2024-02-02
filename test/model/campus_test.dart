import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/campus/campus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //campus list
  final address = Address(street: "112 N Main St", city: "Windsor", state: "NJ", postal: "08561");

  //contact info list
  final List<ContactInfo> contactInfo = [];
  contactInfo.add(ContactInfo(type: "tel", title: "Reception", value: "+1-609-918-1212"));
  contactInfo.add(ContactInfo(type: "email", title: "Media Inquiries", value: "mediarelations@na.baps.org"));
  contactInfo.add(ContactInfo(type: "tel", title: "Media Inquiries", value: "+1-609-447-1008"));

  //to create the campus Model
  final campusObject = Campus(
    name:"Akshardham",
    description: "This data is coming from the file stored in asset folder in the project.",
    latitude: "40.2537234",
    longitude: "-74.5797675",
    address: address,
    contactInfo: contactInfo,
  );

  final campusModel = AppJsonModel(campus: campusObject);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
// arrange
      var dir = Directory.current.path;
      var currentPath = File('$dir/test/json/campus_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
// act
      final result = AppJsonModel.fromJson(jsonMap);
// assert
      expect(result.campus, campusModel.campus);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = campusModel ;
      final expectedJsonMap = {
        "campus": {
          "name": "Akshardham",
          "description": "This data is coming from the file stored in asset folder in the project.",
          "latitude": "40.2537234",
          "longitude": "-74.5797675",
          "address": address,
          "contactInfo": contactInfo
        }
      };
      expect(result.campus!.toJson(), expectedJsonMap['campus']);
    });
  });
}
