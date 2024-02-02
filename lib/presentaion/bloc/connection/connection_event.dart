
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_event.freezed.dart';

@freezed
class ConnectionEvent with _$ConnectionEvent {
  const factory ConnectionEvent.connectionCheck(bool connectionStatus) = ConnectionCheck;
}