import 'package:akdmvisitorsapp/model/feedback/submit_feedback.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_feedback_events.freezed.dart';

@freezed
class SubmitFeedbackEvent with _$SubmitFeedbackEvent{
  const factory SubmitFeedbackEvent.loadUserEvent(List<Record> record) = SubmitFeedbackData;
}

