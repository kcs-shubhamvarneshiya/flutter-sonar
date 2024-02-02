import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/app_json/new_api_json_model.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_state.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/repository/appjson_repository_impl.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/src/result/result.dart';

//@GenerateMocks([AppJsonRepository, AppJsonService])
class MockAppJsonService extends Mock implements AppJsonService{
  @override
  Future<Result<AppJsonApiModel>> getLoadJsonData() async {
    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/api_resonse_data.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final appJsonApiModel = AppJsonApiModel.fromJson(jsonMap);
    return Result.value(appJsonApiModel);
  }

  /*@override
  Future<Result<AppJsonApiModel>> getLoadJsonData() async {
    return Result.error('Error occurred');
  }*/
}

class MockAppJsonRepository extends Mock implements AppJsonRepository {
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
Future<void> setupGetIt(MockAppJsonService mockService) async {
  sl.registerSingleton<AppJsonService>(mockService);
}

Future<void> main() async {
  SharedPreferences.setMockInitialValues({});
  late AppJsonBloc jsonBloc;
  late AppJsonAPIBloc appJsonAPIBloc;
  late MockAppJsonRepository mockTaskRepository;
  late AppJsonModel jsonModel;
  late AppJsonApiModel appJsonApiModel;

  final mockService = MockAppJsonService();
  setupGetIt(mockService);

  setUp(() async {
    mockTaskRepository = MockAppJsonRepository();
    jsonBloc = AppJsonBloc(mockTaskRepository);
    appJsonAPIBloc=AppJsonAPIBloc();
    jsonModel = AppJsonModel();
    appJsonApiModel = AppJsonApiModel();

    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    jsonModel = AppJsonModel.fromJson(jsonMap);

    var apiJsonPath = File('$dir/test/json/api_resonse_data.json').readAsStringSync();
    final Map<String, dynamic> apiJsonMap = json.decode(apiJsonPath);
    appJsonApiModel = AppJsonApiModel.fromJson(apiJsonMap);
  });

  group("AppJsonBloc", () {

    blocTest<AppJsonBloc, AppJsonState>(
      'Should emit successfull ',
      setUp: () async {},
      build: () {
        when(mockTaskRepository.loadJsonAssetData())
            .thenAnswer((_) async => jsonModel);
        return jsonBloc;
      },
      act: (bloc) => bloc.add(const LoadAppJsonEvent()),
      wait: const Duration(seconds: 2),
      expect: () => [
        const AppJsonState.loading(),
        AppJsonState.loaded(jsonModel),
      ],
    );
  });

  group('AppJsonAPIBloc', () {

    blocTest<AppJsonAPIBloc, JsonAPIState>(
      'Should emit successfull ',
      setUp: () {
      },
      build: () {
        return appJsonAPIBloc;
      },
      act: (bloc) => bloc.add(const LoadAppJsonEvent()),
      expect: () => [const JsonAPIState.loading(),
        JsonAPIState.loaded(appJsonApiModel)],
    );

    blocTest<AppJsonAPIBloc, JsonAPIState>(
      'emits JsonAPIState.error() when LoadAppJsonEvent is added and an error occurs',
      build: () {
        return appJsonAPIBloc;
      },
      act: (bloc) => bloc.add(const LoadAppJsonEvent()),
      expect:()=>[ const JsonAPIState.loading(),
        const JsonAPIState.error('Error occurred')],
    );
  });


}
