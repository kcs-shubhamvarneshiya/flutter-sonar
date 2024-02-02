import 'package:freezed_annotation/freezed_annotation.dart';
part 'common_image_slider_tap.freezed.dart';

@freezed
class CommonImageSliderTapEvent with _$CommonImageSliderTapEvent {
  const factory CommonImageSliderTapEvent.tap(int index) = CommonImageSliderTapEventData;
}