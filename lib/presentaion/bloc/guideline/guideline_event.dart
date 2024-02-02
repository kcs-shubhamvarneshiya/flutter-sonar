import 'package:freezed_annotation/freezed_annotation.dart';

part 'guideline_event.freezed.dart';

@freezed
class GuidelineEvent with _$GuidelineEvent {
  const factory GuidelineEvent.onItemTapEvent(int index) = GuidelineTapEvent;
}
