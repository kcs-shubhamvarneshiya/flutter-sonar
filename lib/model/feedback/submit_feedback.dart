import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_feedback.g.dart';
@JsonSerializable()
class SubmitFeedback {
  List<Record>? record;

  SubmitFeedback({this.record});
  factory SubmitFeedback.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitFeedbackToJson(this);

  SubmitFeedback toEntity() {
    return SubmitFeedback(record: record);
  }

}
@JsonSerializable()
class Record {
  String? fieldName;
  String? fieldValue;

  Record({this.fieldName, this.fieldValue});

  factory Record.fromJson(Map<String, dynamic> json) =>_$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);
}
