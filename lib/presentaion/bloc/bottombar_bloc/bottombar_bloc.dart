import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'bottombar_state.dart';
import 'bottombar_tap_event.dart';

@injectable
class BottomBarBloc extends Bloc<ButtonTapEvent, BottomBarState> {

  BottomBarBloc() : super(BottomBarState.initial()) {
    on<ButtonTapEvent>(onTapEvent);

  }
  onTapEvent(ButtonTapEvent event, emit) async {
    emit(state.copyWith(currentIndex: event.index));
  }
}
