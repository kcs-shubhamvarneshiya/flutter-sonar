import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_event.dart';
import 'splash_state.dart';
@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SharedPreferences sharedPreferences;
  SplashBloc(this.sharedPreferences) : super(const SplashState.splashInitial()) {
    on<SetSplash>(setSplashScreen);
  }

  void setSplashScreen(SetSplash event, emit) async {
    emit(const SplashState.splashLoading());
    await Future.delayed(const Duration(seconds: 3));

    // first check is first time
    bool isFirstTime = sharedPreferences.getBool(isFirstTimeSplashPref) ?? true;

    if (isFirstTime) {
      emit(const SplashState.redirectToIntro());
    } else {
      emit(const SplashState.redirectToDashBoard());
    }
  }
}
