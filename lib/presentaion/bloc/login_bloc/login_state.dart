import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState{
  const factory LoginState.loading() = _LoginStateLoadingState;
  const factory LoginState.loaded(bool value) = _LoginStateLoadedState;
  const factory LoginState.error(String error) = _LoginStateErrorState;
  const factory LoginState.internetAvailable(bool value) = _LoginConnectionState;
  const factory LoginState.progressUpdate(int progress) = _LoginProgress;
}