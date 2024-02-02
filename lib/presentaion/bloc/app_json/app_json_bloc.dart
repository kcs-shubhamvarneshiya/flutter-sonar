import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../model/app_json/app_json.dart';
import '../../../model/app_json/new_api_json_model.dart';
import '../../../repository/appjson_repository_impl.dart';
import 'app_json_events.dart';
import 'app_json_state.dart';

@injectable
class AppJsonBloc extends Bloc<AppJsonEvent, AppJsonState> {
  final AppJsonRepository appJsonRepository;

  AppJsonBloc(this.appJsonRepository) : super(const AppJsonState.loading()) {
    on<LoadAppJsonEvent>(getUserAssetJsonData);
  }

  getUserAssetJsonData(LoadAppJsonEvent event, emit) async {
    emit(const AppJsonState.loading());
    try {
      AppJsonModel jsonDataRepo = await appJsonRepository.loadJsonAssetData();
      emit(AppJsonState.loaded(jsonDataRepo));
    } catch (e) {
      emit(
        AppJsonState.error(e.toString()),
      );
    }
  }
}

@injectable
class AppJsonAPIBloc extends Bloc<AppJsonEvent, JsonAPIState> {
   AppJsonService? appJsonRepo;
  AppJsonAPIBloc() : appJsonRepo = getIt<AppJsonService>(),super(const JsonAPIState.loading()) {
    on<LoadAppJsonEvent>(getUserAPIData);
  }

  Future<String> get filePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  getUserAPIData(LoadAppJsonEvent event, emit) async {
    emit(const JsonAPIState.loading());
    Result<AppJsonApiModel> result = await appJsonRepo!.getLoadJsonData();
    if(result.isValue){
      if (result.asValue!.isValue) {
        emit(JsonAPIState.loaded(result.asValue!.value));
      }
    }else{
      emit(JsonAPIState.error(result.asError!.error.toString()));
    }
  }
}
