import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'guideline_event.dart';
import 'guideline_state.dart';

@injectable
class GuidelineBloc extends Bloc<GuidelineEvent, GuidelineState> {
  GuidelineBloc() : super(GuidelineState.initial()) {
    on<GuidelineTapEvent>(onItemTapEvent);
  }

  onItemTapEvent(GuidelineTapEvent event, emit) async {
    emit(state.copyWith(currentIndex: event.index));
  }
}
