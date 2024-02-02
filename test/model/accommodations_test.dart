import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/accommodations/accommodations.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group(
    'Test case for Accommodation model',
    () {
      final accommodationModel = Accommodations(
        id: 40,
        name: "BAPS Swaminarayan Chhatralaya-1",
        location: "Adipur -1",
        price: 400,
        link: "https://www.baps.org/Terms-and-Conditions.aspx",
        thumbnail:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/BAPS_Mandir_Chino_Hills.jpg/1280px-BAPS_Mandir_Chino_Hills.jpg",
      );
      final accommodationJSONData = AppJsonModel(accommodations: <Accommodations>[accommodationModel]);
      //json model test case
      test(
        'Accommodation model should return correct Json',
        () async {
          var dir = Directory.current.path;
          var jsonFilePath =
              File('$dir/test/json/accommodation_test.json').readAsStringSync();
          final Map<String, dynamic> jsonMap = await json.decode(jsonFilePath);
          final result = AppJsonModel.fromJson(jsonMap);
          expect(result.accommodations, accommodationJSONData.accommodations);
        },
      );
      //JSON map test case
      test(
        'JSON map containing proper data',
        () async {
          final jsonModel = accommodationJSONData;
          final expectedAccommodationMap = {
            "accommodations": [
              {
                "id": 40,
                "name": "BAPS Swaminarayan Chhatralaya-1",
                "location": "Adipur -1",
                "price": 400,
                "link": "https://www.baps.org/Terms-and-Conditions.aspx",
                "thumbnail":
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/BAPS_Mandir_Chino_Hills.jpg/1280px-BAPS_Mandir_Chino_Hills.jpg"
              }
            ]
          };
          expect(jsonModel.accommodations![0].toJson(),expectedAccommodationMap['accommodations']![0]);
        },
      );
    },
  );
}
