import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottombar_state.freezed.dart';

@freezed
class BottomBarState with _$BottomBarState {
  const factory BottomBarState({required int currentIndex}) = _BottomBarState;

  factory BottomBarState.initial() => const BottomBarState(currentIndex: 0);
}