import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/special_notices/spacial_notices.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //image list

  final List<Details> detailsList=[];
  detailsList.add(Details(detailText: "Detail 1",detailType:"text 1"));
  detailsList.add(Details(detailText: "Detail 2",detailType:"text 2"));

  final audioObject = Audio(audioUrl: "https://example.com/audio.mp3", audioTitle:"My Audio");
  final videoObject = Video(itemUrl: "https://example.com/video.mp4", itemThumbnail: "https://example.com/video.png",);

  //to create the Attraction Model
  final specialNoticeList = SpecialNotices(
      audio: audioObject,
      image: "https://example.com/image.png",
      title: "Special Notice Title",
      video: videoObject,
      details: detailsList,
      description: "This is a special notice.",
      id: 1234567890
  );

  final specialNoticeModel = AppJsonModel(specialNotices: <SpecialNotices>[specialNoticeList]);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath = File('$dir/test/json/special_notices_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = AppJsonModel.fromJson(jsonMap);
      // assert
      //expect(result.specialNotices, specialNoticeModel.specialNotices);

      expect(result.specialNotices![0].title, specialNoticeModel.specialNotices![0].title);
      expect(result.specialNotices![0].description, specialNoticeModel.specialNotices![0].description);

    });
  });


  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = specialNoticeModel;
      final expectedJsonMap = {
          "specialNotices": [
            {
              "audio": audioObject,
              "image": "https://example.com/image.png",
              "title": "Special Notice Title",
              "video": videoObject,
              "details": detailsList,
              "description": "This is a special notice.",
              "id": 1234567890
            }
          ]
      };
      expect(result.specialNotices![0].toJson(), expectedJsonMap["specialNotices"]![0]);
    });
  });


  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = specialNoticeModel;
      final expectedJsonMap = {
        "audio": {
          "audio_url": "https://example.com/audio.mp3",
          "audio_title": "My Audio"
        },
      };
      expect(result.specialNotices![0].audio?.toJson(), expectedJsonMap["audio"]);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = specialNoticeModel;
      final expectedJsonMap = {
        "video": {
          "item_url": "https://example.com/video.mp4",
          "item_thumbnail": "https://example.com/video.png"
        },
      };
      expect(result.specialNotices![0].video?.toJson(), expectedJsonMap["video"]);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = specialNoticeModel;
      final expectedJsonMap = {
            "detail_text": "Detail 1",
            "detail_type": "text 1"
      };
      expect(result.specialNotices![0].details![0].toJson(), expectedJsonMap);
    });
  });



}
