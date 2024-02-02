import 'package:akdmvisitorsapp/presentaion/bloc/bottombar_bloc/bottombar_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bottombar_bloc/bottombar_state.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bottombar_bloc/bottombar_tap_event.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BottomBarBloc', () {
    blocTest<BottomBarBloc, BottomBarState>(
      'emits BottomBarState with updated currentIndex when BottomBarTapEvent is added',
      build: () => BottomBarBloc(),
      act: (bloc) {
        bloc.add(const ButtonTapEvent.tap(1)); //Actual value of current index.
      },
      expect: () => [
        const BottomBarState(currentIndex: 1) //Expected value of current index.
      ], // Replace with the expected state
    );
  });
}
