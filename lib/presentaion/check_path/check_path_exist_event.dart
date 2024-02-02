import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_path_exist_event.freezed.dart';

@freezed
class CheckPathExistEvent with _$CheckPathExistEvent{
  const factory CheckPathExistEvent.exist() = CheckPathExistEventData;

}