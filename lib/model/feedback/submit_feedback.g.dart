// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitFeedback _$SubmitFeedbackFromJson(Map<String, dynamic> json) =>
    SubmitFeedback(
      record: (json['record'] as List<dynamic>?)
          ?.map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmitFeedbackToJson(SubmitFeedback instance) =>
    <String, dynamic>{
      'record': instance.record,
    };

Record _$RecordFromJson(Map<String, dynamic> json) => Record(
      fieldName: json['fieldName'] as String?,
      fieldValue: json['fieldValue'] as String?,
    );

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'fieldName': instance.fieldName,
      'fieldValue': instance.fieldValue,
    };
