import 'package:akdmvisitorsapp/presentaion/bloc/guideline/guideline_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/guideline/guideline_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/guideline/guideline_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GuidelineBloc', () {
    blocTest<GuidelineBloc, GuidelineState>(
      'emits GuidelineState with updated currentIndex when GuidelineTapEvent is added',
      build: () => GuidelineBloc(),
      act: (bloc) {
        bloc.add(const GuidelineEvent.onItemTapEvent(1)); //Actual value of current index.
      },
      expect: () => [
        const GuidelineState(currentIndex: 1) //Expected value of current index.
      ], // Replace with the expected state
    );
  });
}
