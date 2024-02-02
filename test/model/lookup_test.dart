import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/lookups/lookups.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //to create the look Up Model
  final lookUpList = Lookups(
      aboutUs: "https://www.baps.org/About-BAPS.aspx",
      donate: "https://donate.na.baps.org/robbinsville",
      visitorGuidelines: "https://www.baps.org/Global-Network/North-America/Robbinsville/Visitor-Info.aspx",
      glossary: "https://www.baps.org/glossary.aspx",
      privacyPolicy: "https://www.baps.org/Privacy-Policy.aspx",
      termsConditions: "https://www.baps.org/Terms-and-Conditions.aspx",
      socialYoutubeLink: "https://www.youtube.com/c/PSM100yrs/featured",
      socialInstagramLink: "https://www.instagram.com/psm100yrs",
      socialFacebookLink: "https://www.facebook.com/psm100yrs",
      socialTwitterLink: "https://twitter.com/psm100yrs",
      uberDeeplink: "https://m.uber.com/ul/?client_id=gbjhdsfjhhku25sd",
      lyftDeeplink: "https://www.lyft.com/",
      shayonaCafe:"https://usa.akshardham.org/explore#shayona",
      giftShop:"https://www.baps.org/Global-Network/North-America/Robbinsville.aspx",
      yourTickets:"https://donate.na.baps.org/robbinsville",
      bookedTours:"https://donate.na.baps.org/robbinsville"
  );

  final lookUpModel = AppJsonModel(lookups: lookUpList);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath =
          File('$dir/test/json/lookups_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = AppJsonModel.fromJson(jsonMap);
      // assert
      expect(result.lookups, lookUpModel.lookups);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = lookUpModel;
      // assert

      final expectedJsonMap = {
        "lookups": {
          "aboutUs": "https://www.baps.org/About-BAPS.aspx",
          "donate": "https://donate.na.baps.org/robbinsville",
          "visitorGuidelines": "https://www.baps.org/Global-Network/North-America/Robbinsville/Visitor-Info.aspx",
          "glossary": "https://www.baps.org/glossary.aspx",
          "privacyPolicy": "https://www.baps.org/Privacy-Policy.aspx",
          "termsConditions": "https://www.baps.org/Terms-and-Conditions.aspx",
          "socialYoutubeLink": "https://www.youtube.com/c/PSM100yrs/featured",
          "socialInstagramLink": "https://www.instagram.com/psm100yrs",
          "socialFacebookLink": "https://www.facebook.com/psm100yrs",
          "socialTwitterLink": "https://twitter.com/psm100yrs",
          "uberDeeplink": "https://m.uber.com/ul/?client_id=gbjhdsfjhhku25sd",
          "lyftDeeplink": "https://www.lyft.com/",
          "shayonaCafe": "https://usa.akshardham.org/explore#shayona",
          "giftShop": "https://www.baps.org/Global-Network/North-America/Robbinsville.aspx",
          "yourTickets": "https://donate.na.baps.org/robbinsville",
          "bookedTours": "https://donate.na.baps.org/robbinsville"
        },
      };
      expect(result.lookups!.toJson(), expectedJsonMap['lookups']);
    });
  });
}
