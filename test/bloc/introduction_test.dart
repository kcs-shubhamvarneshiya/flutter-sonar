import 'package:akdmvisitorsapp/presentaion/bloc/introduction/introduction_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/introduction/introduction_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/introduction/introduction_state.dart';
import 'package:akdmvisitorsapp/utils/enums.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Splash Block Test', () {
    late IntroductionBloc introductionBloc;

    setUp(() {
      introductionBloc = IntroductionBloc();
    });

    blocTest(
      'check the Intro Screen with Passing the Event dark Background',
      build: () => IntroductionBloc(),
      act: (bloc) => bloc.add(const ScreenChangeEvent("2")),
      wait: const Duration(milliseconds: 3000),
      expect: () => [
        IntroductionState.setBackgroundState(Background.Dark.name.toString())
      ],
    );

    blocTest(
      'check the Intro Screen with Passing the Event light Background',
      build: () => IntroductionBloc(),
      act: (bloc) => bloc.add(const ScreenChangeEvent("5")),
      wait: const Duration(milliseconds: 3000),
      expect: () => [
        IntroductionState.setBackgroundState(Background.Light.name.toString())
      ],
    );
    tearDown(() {
      introductionBloc.close();
    });
  });
}
