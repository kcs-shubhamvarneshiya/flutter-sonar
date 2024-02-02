import 'package:freezed_annotation/freezed_annotation.dart';

part 'guideline_state.freezed.dart';

@freezed
class GuidelineState with _$GuidelineState {
  const factory GuidelineState({required int currentIndex}) = _GuidelineState;

  factory GuidelineState.initial() => const GuidelineState(currentIndex: -1);
}
