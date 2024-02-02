import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/feedback/feedback_form.dart';
import '../../more_screen/feedback_form/feedback_multiselect_dropdown.dart';

part 'feedback_component_event.freezed.dart';

@freezed
class FeedbackComponentEvent with _$FeedbackComponentEvent{
  const factory FeedbackComponentEvent.loadOnChangeRadioEvent(String selectedValue) = FeedbackOnChangeRadioEvent;
  const factory FeedbackComponentEvent.loadOnChangeCheckBoxEvent(bool checkValue,int index) = FeedbackOnChangeCheckBoxEvent;
  const factory FeedbackComponentEvent.loadOptionListEvent(List<Option> optionList) = FeedbackOptionListEvent;
  const factory FeedbackComponentEvent.setOptionItemEvent(List<FeedbackOptions> optionItemList) = FeedbackOptionItemEvent;
}