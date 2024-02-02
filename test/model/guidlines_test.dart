import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/guidelines/content.dart';
import 'package:akdmvisitorsapp/model/guidelines/guidelines.dart';
import 'package:akdmvisitorsapp/model/guidelines/section.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //to create the Guidelines Model

  //image list
  List<String> imageList = [];
  imageList.add(
      "https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg");
  imageList.add(
      "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG");
  imageList.add(
      "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/SAV%20Mandir_002.jpg");

  //contentList
  final List<Content> contentList = [];
  contentList.add(Content(
      order: 1,
      imageURL: imageList,
      text: "Please note that a strict dress code operates within the complex.",
      videoUrl: "http://abc.com"));

  final List<Section> sectionList = [];
  sectionList.add(Section(
      title: "Dress Code",
      imageURL:
          "https://akdmves.baps-apps.org/GuidelineIcons/1697104632851_clothes-hoodie.png",
      content: contentList));

  final guidLineData = Guidelines(
      image:
          "https://upload.wikimedia.org/wikipedia/commons/7/77/Akshardham_Gandhinagar_Gujarat.jpg",
      description:
          "During your visit, we kindly ask you be respectful of fellow visitors and the campus. See our full list of visitor guidelines to learn more.",
      link: "https://www.baps.org/Terms-and-Conditions.aspx",
      sections: sectionList);

  final guidLineModel = AppJsonModel(guidelines: guidLineData);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath =
          File('$dir/test/json/guidlines_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = AppJsonModel.fromJson(jsonMap);
      // assert
      expect(result, guidLineModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange
      // act
      final result = guidLineModel;
      // assert
      final expectedJsonMap = {
        "guidelines": {
          "image":
              "https://upload.wikimedia.org/wikipedia/commons/7/77/Akshardham_Gandhinagar_Gujarat.jpg",
          "description":
              "During your visit, we kindly ask you be respectful of fellow visitors and the campus. See our full list of visitor guidelines to learn more.",
          "link": "https://www.baps.org/Terms-and-Conditions.aspx",
          "sections": sectionList
        }
      };
      expect(result.guidelines!.toJson(), expectedJsonMap['guidelines']);
    });
  });

  final guidLineModelSection = AppJsonModel(guidelines: guidLineData);
  group('fromJson', () {
    test('should return a valid content model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath =
          File('$dir/test/json/guidlines_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = AppJsonModel.fromJson(jsonMap);
      // assert
      expect(result.guidelines?.sections, guidLineModelSection.guidelines?.sections);
    });
  });

  group('toJson', () {
    test('should return a JSON map content model proper data', () async {
      // arrange
      // act
      final result = guidLineModelSection;
      // assert
      final expectedJsonMap = {
        "sections": [
          {
            "title": "Dress Code",
            "imageURL": "https://akdmves.baps-apps.org/GuidelineIcons/1697104632851_clothes-hoodie.png",
            "content": [
              {
                "order": 1,
                "text": "Please note that a strict dress code operates within the complex.",
                "videoUrl": "http://abc.com",
                "imageURL": [
                  "https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg",
                  "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG",
                  "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/SAV%20Mandir_002.jpg"
                ]
              }
            ]
          }
        ]
      };
      expect(result.guidelines!.sections![0].toJson(), expectedJsonMap['sections']);
    });
  });


  final guidLineModelContent = AppJsonModel(guidelines: guidLineData);
  group('fromJson', () {
    test('should return a valid section model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath =
      File('$dir/test/json/guidlines_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = AppJsonModel.fromJson(jsonMap);
      // assert
      expect(result.guidelines?.sections![0].content, guidLineModelContent.guidelines?.sections![0].content);
    });
  });

  group('toJson', () {
    test('should return a JSON map section model proper data', () async {
      // arrange
      // act
      final result = guidLineModelContent;
      // assert
      final expectedJsonMap = {
            "content": [
              {
                "order": 1,
                "text": "Please note that a strict dress code operates within the complex.",
                "videoUrl": "http://abc.com",
                "imageURL": [
                  "https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg",
                  "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG",
                  "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/SAV%20Mandir_002.jpg"
                ]
              }
            ]
      };

      expect(result.guidelines!.sections![0].content![0].toJson(), expectedJsonMap['content']);

    });
  });







}
