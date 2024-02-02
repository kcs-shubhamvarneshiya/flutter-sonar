import 'package:akdmvisitorsapp/presentaion/bloc/common_slider_image_bloc/common_image_slider_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/common_slider_image_bloc/common_image_slider_state.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/common_slider_image_bloc/common_image_slider_tap.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommonImageSliderBloc', () {
    blocTest<CommonImageSliderBloc, CommonImageSliderState>(
      'emits CommonImageSliderState with updated currentIndex when CommonImageSliderTapEvent is added',
      build: () => CommonImageSliderBloc(),
      act: (bloc) {
        bloc.add(const CommonImageSliderTapEvent.tap(5)); //Actual value of current index.
      },
      expect: () => [
        const CommonImageSliderState(currentIndex: 1) //Expected value of current index.
      ], // Replace with the expected state
    );
  });
}
