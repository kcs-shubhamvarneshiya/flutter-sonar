import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/announcements/announcements.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_state.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppJsonRepository extends Mock implements AppJsonRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late AppJsonBloc jsonBloc;
  AppJsonRepository mockTaskRepository;
  late AppJsonModel jsonModel;

  /*setUp(() async {
    mockTaskRepository = AppJsonRepository();
    jsonBloc = AppJsonBloc(mockTaskRepository);
    jsonModel = AppJsonModel();
  });*/

  setUp(() {
    mockTaskRepository = MockAppJsonRepository();
    jsonBloc = AppJsonBloc(mockTaskRepository);
    jsonModel = AppJsonModel();
  });


  group('', ()  {
    //mockTaskRepository = AppJsonRepository();
    mockTaskRepository = MockAppJsonRepository();
    test('Initial state should be empty', () async {
      expect(jsonBloc.state, const AppJsonState.loading());
    });

    test('should return expected data state', () async {
      // Arrange

      // Act
      final result = await mockTaskRepository.loadJsonAssetData();

      print(result);
      var dir = Directory.current.path;
      var currentPath = File('$dir/test/json/annoucement_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final annouceMents = AppJsonModel.fromJson(jsonMap);
      var expected = annouceMents.announcements![0].id;
      // act
      //assert
      expect(result.announcements![0].id, equals(expected));
    });

    group('check annoucements toJson is correct', () {
      test('should return a JSON map containing proper data', () async {
        // arrange
        final result = await mockTaskRepository.loadJsonAssetData();
        // act
        final mockResult = result.toJson();
        // assert

        final expectedJsonMap = {
          "id": 1,
          "priority": "INFO",
          "title": "Update to Mandir Timings",
          "message":
          "Mandir timings have been updated to reflect the summer visiting hours",
          "details": "",
          "thumbnail":
          "https://upload.wikimedia.org/wikipedia/commons/7/77/Akshardham_Gandhinagar_Gujarat.jpg",
          "startTime": "2023-04-30T01:13:03.074Z",
          "endTime": "2023-04-30T02:13:03.074Z"
        };
        var expected = Announcements.fromJson(expectedJsonMap);
        var actual = Announcements.fromJson(mockResult['announcements'][0]);
        expect(actual, equals(expected));
      });
    });

    test('should return expected data state', () async {
      // Arrange

      // Act
      final result = await mockTaskRepository.loadJsonAssetData();
      var dir = Directory.current.path;
      var currentPath =
      File('$dir/test/json/attractions_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final mainModel = AppJsonModel.fromJson(jsonMap);
      var expected = mainModel.attractions![0].title.toString();
      // act
      //assert
      expect(result.attractions![0].title, equals(expected));
    });

    group('check toJson is correct', () {
      test('should return a JSON map containing proper data', () async {
        // arrange
        final result = await mockTaskRepository.loadJsonAssetData();
        // act
        final mockResult = result.toJson();
        // assert

        final expectedJsonMap = {
          "id": 0,
          "title": "Parking A",
          "description":
          "Parking area for all visitors to the BAPS Swaminarayan Akshardham in New Jersey",
          "thumbnail":
          "https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
          "heroImage":
          "https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
          "images": [
            "https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg",
            "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG",
            "https://www.baps.org//Data/Sites/1/Media/LocationImages/1387Milwaukee.jpg",
            "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/SAV%20Mandir_002.jpg"
          ],
          "type": "Outdoor Attraction",
          "duration": "1",
          "options": {
            "reservable": false,
            "is_recommended": true,
            "external_link": "url"
          },
          "display_order": {"explore_list": 2, "visit_planner": 4},
          "longitude": "",
          "latitude": "",
          "map_icon": "",
          "attraction_type": ""
        };
        var expected = Attraction.fromJson(expectedJsonMap);
        var actual = mockResult['attraction'][0];
        expect(actual['title'].toString(), equals(expected.title));
      });
    });

    blocTest<AppJsonBloc, AppJsonState>(
      'Should emit successfull ',
      setUp: () async {
        await mockTaskRepository.loadJsonAssetData().then((value) {
          jsonModel = value;

        },);
      },
      build: () {
        return jsonBloc;
      },
      act: (bloc) => bloc.add(const LoadAppJsonEvent()),
      wait: const Duration(seconds: 2),
      expect: () => [
        const AppJsonState.loading(),
        AppJsonState.loaded(jsonModel),
      ],
    );


    test('should return compus data state', () async {
      // Arrange

      // Act
      final result = await mockTaskRepository.loadJsonAssetData();
      var dir = Directory.current.path;
      var currentPath =
      File('$dir/test/json/campus_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final mainModel = AppJsonModel.fromJson(jsonMap);
      var expected = mainModel.campus!.name.toString();
      // act
      //assert
      expect(result.campus!.name.toString(), equals(expected));
    });


    test('should return gallery data state', () async {
      // Arrange

      // Act
      final result = await mockTaskRepository.loadJsonAssetData();
      var dir = Directory.current.path;
      var currentPath =
      File('$dir/test/json/social_media_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final mainModel = AppJsonModel.fromJson(jsonMap);
      var expected = mainModel.galleries![0].title.toString();
      // act
      //assert
      expect(result.galleries![0].title.toString(), equals(expected));
    });

    test('should return GuideLine data state', () async {
      // Arrange

      // Act
      final result = await mockTaskRepository.loadJsonAssetData();
      var dir = Directory.current.path;
      var currentPath =
      File('$dir/test/json/guidlines_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final mainModel = AppJsonModel.fromJson(jsonMap);
      var expected = mainModel.guidelines!.link.toString();
      // act
      //assert

      final tojson = await mockTaskRepository.loadJsonAssetData();
      // act
      final mockResult = tojson.toJson();
      expect(mockResult.isNotEmpty, true);
      expect(result.guidelines!.link, equals(expected));

    });


    test('should return GuideLine data state', () async {
      // Arrange

      // Act
      final result = await mockTaskRepository.loadJsonAssetData();
      var dir = Directory.current.path;
      var currentPath =
      File('$dir/test/json/lookups_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final mainModel = AppJsonModel.fromJson(jsonMap);
      var expected = mainModel.lookups!.aboutUs.toString();
      // act
      //assert

      expect(result.lookups!.aboutUs, equals(expected));

    });


    test('should return GuideLine data state', () async {
      // Arrange

      // Act
      final result = await mockTaskRepository.loadJsonAssetData();
      var dir = Directory.current.path;
      var currentPath =
      File('$dir/test/json/social_media_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final mainModel = AppJsonModel.fromJson(jsonMap);
      var expected = mainModel.socialMedia![0].description.toString();
      // act
      //assert

      expect(result.socialMedia![0].description, equals(expected));

    });



    test('should return GuideLine data state', () async {
      // Arrange

      // Act
      final result = await mockTaskRepository.loadJsonAssetData();
      var dir = Directory.current.path;
      var currentPath =
      File('$dir/test/json/upcoming_event_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final mainModel = AppJsonModel.fromJson(jsonMap);
      var expected = mainModel.events![0].title.toString();
      // act
      //assert

      expect(result.events![0].title, equals(expected));

    });

  });

}