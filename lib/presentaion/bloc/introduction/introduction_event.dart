import 'package:freezed_annotation/freezed_annotation.dart';

part 'introduction_event.freezed.dart';

@freezed
class IntroductionEvent with _$IntroductionEvent {
  const factory IntroductionEvent.screenChangeEvent(String screen) =
      ScreenChangeEvent;
}
