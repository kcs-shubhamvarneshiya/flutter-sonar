import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_json_events.freezed.dart';

@freezed
 class AppJsonEvent with _$AppJsonEvent{
  const factory AppJsonEvent.loadUserEvent() = LoadAppJsonEvent;
}

