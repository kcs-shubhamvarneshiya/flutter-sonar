import 'package:freezed_annotation/freezed_annotation.dart';

part 'introduction_state.freezed.dart';

@freezed
class IntroductionState with _$IntroductionState {
  const factory IntroductionState.setBackgroundState(String background) = _SetBackgroundState;
}
