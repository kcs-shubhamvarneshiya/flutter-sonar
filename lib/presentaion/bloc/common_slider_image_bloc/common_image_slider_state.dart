import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_image_slider_state.freezed.dart';

@freezed
class CommonImageSliderState with _$CommonImageSliderState {
  const factory CommonImageSliderState({required int currentIndex}) = _CommonImageSliderState;

  factory CommonImageSliderState.initial() => const CommonImageSliderState(currentIndex: 0);
}