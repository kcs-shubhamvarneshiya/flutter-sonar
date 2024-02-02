import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/video_url/video_url.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //to create the Social media Model

  List<String> urlsList = [];
  urlsList.add("https://akdm-ve.myseva.us/GuidelineIcons/1697178482231_hero-intro-fireworks480p2.mp4");
  urlsList.add("https://akdm-ve.myseva.us/GuidelineIcons/1697178568976_hero-intro-fireworks480p.mp4");
  urlsList.add("https://cdn.baps-webnext-akshardham.org/media/explore/hero-intro-5.mp4");

  final videoUrl = VideoConfig(
      urlsList
  );

  final videoUrlModel = videoUrl;
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath = File('$dir/test/json/video_url_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = VideoConfig.fromJson(jsonMap);
      // assert
      expect(result.toJson(), videoUrlModel.toJson());
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = videoUrl;
      final expectedJsonMap = {
         "urls": [
            "https://akdm-ve.myseva.us/GuidelineIcons/1697178482231_hero-intro-fireworks480p2.mp4",
            "https://akdm-ve.myseva.us/GuidelineIcons/1697178568976_hero-intro-fireworks480p.mp4",
            "https://cdn.baps-webnext-akshardham.org/media/explore/hero-intro-5.mp4"
          ]
      };
      expect(result.urls[0], expectedJsonMap['urls']![0]);
    });
  });
}
