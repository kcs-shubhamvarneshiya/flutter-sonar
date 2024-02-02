import 'package:akdmvisitorsapp/presentaion/bloc/splash_screen/splash_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/splash_screen/splash_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/splash_screen/splash_state.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  SharedPreferences.setMockInitialValues({});
  group('Splash Block Test', () {
    late SplashBloc splashBloc;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      splashBloc = SplashBloc(mockSharedPreferences);
    });

    blocTest(
      'Initalize loading block State',
      build: () => SplashBloc(mockSharedPreferences),
      act: (bloc) => bloc.add(const SetSplash()),
      expect: () => [const SplashState.splashLoading()],
    );

    blocTest<SplashBloc, SplashState>(
      'emits RedirectToIntro when SetSplash event is added and isFirstTime is true',
      build: () {
        when(mockSharedPreferences.getBool(isFirstTimeSplashPref)).thenReturn(true);
        return splashBloc;
      },
      act: (bloc) => bloc.add(const SetSplash()),
      wait: const Duration(seconds: 3),
      expect:() =>[const SplashState.splashLoading(),
        const SplashState.redirectToIntro()],
    );

    blocTest<SplashBloc, SplashState>(
      'emits RedirectToDashboard when SetSplash event is added and isFirstTime is false',
      build: () {
        when(mockSharedPreferences.getBool(isFirstTimeSplashPref)).thenReturn(false);
        return splashBloc;
      },
      act: (bloc) => bloc.add(const SetSplash()),
      wait: const Duration(seconds: 3),
      expect:() =>[const SplashState.splashLoading(),
        const SplashState.redirectToDashBoard()],
    );


  });
}