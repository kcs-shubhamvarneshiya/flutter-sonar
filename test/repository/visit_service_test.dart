import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_service.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {
  // Arrange: Set up the mock behavior for SharedPreferences.
  @override
  List<String>? getStringList(String key) {
    if (key == "keyAttractionListForPlanPref") {
      var dir = Directory.current.path;
      var fileContents = File('$dir/test/json/attractions_test.json').readAsStringSync();
      var jsonData = json.decode(fileContents);
      var jsonList = jsonData['attractions'];
      if (jsonList is List<dynamic>) {
        var stringList = jsonList.map((item) => json.encode(item)).toList();
        return stringList;
      }
    }

    return super.noSuchMethod(
      Invocation.method(#getStringList, [key]),
      returnValue: Future.value(null),
    ).await;

    //can also pass the dummy string list.
    /*if (key == "keyAttractionListForPlanPref") {
      return ['{"id": 1, "title": "Parking A"}'];
    }*/
  }
}

class MockAppJsonRepository extends Mock implements AppJsonRepository{
  // Arrange: Set up the mock behavior for AppJsonRepository.
  @override
  Future<AppJsonModel> loadJsonAssetData() async {
    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final jsonModel = AppJsonModel.fromJson(jsonMap);
    return jsonModel;
  }
}

GetIt sl = GetIt.instance;
Future<void> setupGetIt(MockSharedPreferences mockSharedPreferences) async {
  sl.registerSingleton<SharedPreferences>(mockSharedPreferences);
}


void main() {
  late VisitServiceImpl visitService;
  late MockSharedPreferences mockSharedPreferences;
  late MockAppJsonRepository mockAppJsonRepository;

  mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockSharedPreferences);

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    mockAppJsonRepository = MockAppJsonRepository();
    visitService = VisitServiceImpl(mockAppJsonRepository);
  });

  test('getAttractionList returns a list of attractions', () async {
    // Act: Call the getAttractionList method.
    final attractionList = await visitService.getAttractionList();

    //Assert: Check if the returned list is not empty.
    expect(attractionList, isNotEmpty);
    expect(attractionList.length, 1);
    expect(attractionList[0].id, 1);
    expect(attractionList[0].title, "Parking A");
  });

  test('getFilterAttractionList returns a list of filtered attractions', () async {
    // Act: Call the getFilterAttractionList method.
    final filteredList = await visitService.getFilterAttractionList();

    // Assert: Check if the returned list is not empty and doesn't contain items already in SharedPreferences.
    expect(filteredList, isNotEmpty);
    expect(filteredList.length, 1);
    expect(filteredList[0].id, 1);
    expect(filteredList[0].title, "Parking A");
  });
}
