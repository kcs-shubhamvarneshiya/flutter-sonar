import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.splashInitial() = _SplashInitial;

  const factory SplashState.splashLoading() = _SplashLoadingl;

  const factory SplashState.redirectToIntro() = _RedirectToIntro;

  const factory SplashState.redirectToDashBoard() = _RedirectToDashBoard;
}
