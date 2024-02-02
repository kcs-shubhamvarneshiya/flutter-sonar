import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_feedback_state.freezed.dart';

//freezed annotation
//create state class for submitting feedback data
@freezed
class SubmitFeedbackState with _$SubmitFeedbackState {
  const factory SubmitFeedbackState.feedbackLoading(bool? value) = _SubmitFeedbackLoadingState;
  const factory SubmitFeedbackState.feedbackLoaded(String message) = _SubmitFeedbackLoadedState;
  const factory SubmitFeedbackState.feedbackError(String error) = _SubmitFeedbackErrorState;
  const factory SubmitFeedbackState.feedbackInternetAvailable(bool value) = _SubmitFeedbackConnectionState;

}