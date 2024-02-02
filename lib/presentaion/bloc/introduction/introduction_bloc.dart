import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/enums.dart';
import '../../../utils/strings.dart';
import 'introduction_event.dart';
import 'introduction_state.dart';

@injectable
class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  IntroductionBloc() : super(IntroductionState.setBackgroundState(Background.Light.name.toString())) {
    on<ScreenChangeEvent>(sendScreenIndex);
  }

  void sendScreenIndex(ScreenChangeEvent event, emit) async {
    if (event.screen == screenTwo || event.screen == screenFour) {
      emit(IntroductionState.setBackgroundState(Background.Dark.name.toString()));
    } else {
      emit(IntroductionState.setBackgroundState(Background.Light.name.toString()));
    }
  }
}
