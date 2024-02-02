import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/graphql/graphql_config.dart';
import 'package:akdmvisitorsapp/graphql/query_files.dart';
import 'package:akdmvisitorsapp/model/app_json/new_api_json_model.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/repository/appjson_repository_impl.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/src/result/result.dart';

class MockGraphQLConfig extends Mock implements GraphQLConfig {}

class MockAppJsonRepository extends Mock implements AppJsonRepository {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  //AppJsonRepository appJsonRepository;
  //SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  late GraphQLConfig mockGraphQLConfig;
  late AppJsonApiModel appJsonApiModel;
  late MockAppJsonRepository mockRepository;
  late MockSharedPreferences mockSharedPreferences;
  late AppJsonModelImpl appJsonModelImpl;

  setUp(() {
    mockGraphQLConfig = MockGraphQLConfig();
    //appJsonRepository = AppJsonRepository(mockGraphQLConfig);
    mockRepository = MockAppJsonRepository();
    mockSharedPreferences = MockSharedPreferences();
    appJsonApiModel = AppJsonApiModel();
    appJsonModelImpl = AppJsonModelImpl(mockRepository, mockSharedPreferences);

    var dir = Directory.current.path;
    var apiJsonPath =
        File('$dir/test/json/api_resonse_data.json').readAsStringSync();
    final Map<String, dynamic> apiJsonMap = json.decode(apiJsonPath);
    appJsonApiModel = AppJsonApiModel.fromJson(apiJsonMap);
  });

  group('Load JSON From API', () {
    test('getLoadJsonData returns Result with success', () async {
      // Set up mock data and dependencies
      final mockResultData = appJsonApiModel;
      var lastDate = mockSharedPreferences.getString(
          keyJSONFileDownloadDatePref); //'2023-10-23T20:34:47.880178'
      final result = await mockRepository.loadJsonAPIData(
        GraphQLQuery.getAPIData(),
        variables: {
          "data": {
            "last_modified_time": lastDate,
          },
        },
      );

      //Verify that the result is as expected
      expect(result.data, Result.value(mockResultData));
    });
  });

  /*group('Load JSON From API', () {
    test('Load JSON API data', () async {
      mockGraphQLConfig = MockGraphQLConfig();

      appJsonRepository = AppJsonRepository(mockGraphQLConfig);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var lastDate = sharedPreferences.getString(keyJSONFileDownloadDatePref);

      final data = appJsonRepository.loadJsonAPIData(
        GraphQLQuery.getAPIData(),
        variables: {
          "data": {
            "last_modified_time": lastDate,
          }
        },
      );
      expect(data, appJsonApiModel);
    });
  });

  group('JSON Asset data', () {
    test('Load JSON asset data', () async {
      appJsonRepository = AppJsonRepository(mockGraphQLConfig);
      final data = appJsonRepository.loadJsonAssetData();
      expect(data, data);
    });
  });*/
}
