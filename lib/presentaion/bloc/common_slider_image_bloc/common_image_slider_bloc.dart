import 'package:akdmvisitorsapp/presentaion/bloc/common_slider_image_bloc/common_image_slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'common_image_slider_tap.dart';

@injectable
class CommonImageSliderBloc extends Bloc<CommonImageSliderTapEvent, CommonImageSliderState> {

  CommonImageSliderBloc() : super(CommonImageSliderState.initial()) {
    on<CommonImageSliderTapEvent>(onTapEvent);

  }
  onTapEvent(CommonImageSliderTapEvent event, emit) async {
    emit(state.copyWith(currentIndex: event.index));
  }
}