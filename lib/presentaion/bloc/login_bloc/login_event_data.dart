import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event_data.freezed.dart';

@freezed
class LoginEventData with _$LoginEventData{
  const factory LoginEventData.loadEvent() = LoginValidateEventData;
  const factory LoginEventData.logoutEvent() = LogoutEventData;
  const factory LoginEventData.connectionEvent() = ConnectionEventCheckData;
  const factory LoginEventData.progressEvent(int progress) = ConnectionProgressEventData;
}