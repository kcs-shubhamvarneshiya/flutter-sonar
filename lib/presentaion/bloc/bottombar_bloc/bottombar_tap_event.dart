import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottombar_tap_event.freezed.dart';

@freezed
class ButtonTapEvent with _$ButtonTapEvent {
const factory ButtonTapEvent.tap(int index) = ButtonTapEventData;
}