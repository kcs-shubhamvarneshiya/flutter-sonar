import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/gallery/gallery.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //media list

  final List<Media> mediaList = [];
  mediaList.add(
    Media(
      type: "IMAGE",
      name: "Tapomurti Shri Nilkanth Varni",
      captions:
          "This murti (sacred image) of Tapomurti Shri Nilkanth Varni is a homage to his travels around the Indian subcontinent for 7 years during his teenage years. Nilkanth Varni is portrayed in an ascetic pose performing tapas, or penance and worship with intense self-discipline",
      src:
          "https://media.baps.dev/wp-content/uploads/2021/10/15140152/05-Tapomurti-Nilkanth-Varni-Moods-scaled.jpg",
      thumbnail:
          "https://media.baps.dev/wp-content/uploads/2021/10/15140152/05-Tapomurti-Nilkanth-Varni-Moods-scaled.jpg",
    ),
  );

  //to create the galleries Model
  final galleries = Galleries(
    id: 0,
    title: "Homepage",
    description: "",
    media: mediaList,
  );

  final galleryModel = AppJsonModel(galleries: [galleries]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      var dir = Directory.current.path;
      var currentPath =
          File('$dir/test/json/galleries_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final result = AppJsonModel.fromJson(jsonMap);
      expect(result.galleries, galleryModel.galleries);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = galleryModel;
      final expectedJsonMap = {
        "galleries": [
          {
            "id": 0,
            "title": "Homepage",
            "description": "",
            "media": mediaList
          }
        ]
      };
      expect(result.galleries![0].toJson(), expectedJsonMap['galleries']![0]);
    });
  });
}
