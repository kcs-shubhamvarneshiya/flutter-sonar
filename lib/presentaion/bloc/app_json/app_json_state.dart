import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/app_json/new_api_json_model.dart';

part 'app_json_state.freezed.dart';

//freezed annotation
//asset json
@freezed
class AppJsonState with _$AppJsonState {
  const factory AppJsonState.loading() = _AppJsonLoadingState;
  const factory AppJsonState.loaded(AppJsonModel appJsonData) = _AppJsonLoadedState;
  const factory AppJsonState.error(String error) = _AppJsonErrorState;
}
//api json
@freezed
class JsonAPIState with _$JsonAPIState {
  const factory JsonAPIState.loading() = _JsonAPIStateLoadingState;
  const factory JsonAPIState.loaded(AppJsonApiModel appJsonAPIData) = _JsonAPIStateLoadedState;
  const factory JsonAPIState.error(String error) = _JsonAPIStateErrorState;
}