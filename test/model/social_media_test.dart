import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/social_media/social_media.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //to create the Social media Model
  final  socialMedia =  SocialMedia(
      type: "FACEBOOK",
      link: "https://caiosdf.com",
      handle: "asdf",
      date: "2023-06-06T18:30:00.000Z",
      description: "asdf",
      thumbnail:
      "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127091054_images.jpg",
      profileImage:
      "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127092396_insta.jpg");

  final socialMediaModel = AppJsonModel(socialMedia: <SocialMedia>[socialMedia]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath =
          File('$dir/test/json/social_media_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = AppJsonModel.fromJson(jsonMap);
      // assert
      expect(result.socialMedia![0].toJson(), socialMediaModel.socialMedia![0].toJson());
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = socialMediaModel;
      final expectedJsonMap = {
        "socialMedia": [
          {
            "type": "FACEBOOK",
            "link": "https://caiosdf.com",
            "handle": "asdf",
            "date": "2023-06-06T18:30:00.000Z",
            "description": "asdf",
            "thumbnail":
                "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127091054_images.jpg",
            "profileImage":
                "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127092396_insta.jpg"
          }
        ]
      };
      expect(
          result.socialMedia![0].toJson(), expectedJsonMap['socialMedia']![0]);
    });
  });
}
