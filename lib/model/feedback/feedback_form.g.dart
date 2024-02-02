// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackForm _$FeedbackFormFromJson(Map<String, dynamic> json) => FeedbackForm(
      submitLink: json['submitLink'] as String?,
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => Fields.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedbackFormToJson(FeedbackForm instance) =>
    <String, dynamic>{
      'submitLink': instance.submitLink,
      'fields': instance.fields,
    };

Fields _$FieldsFromJson(Map<String, dynamic> json) => Fields(
      fieldName: json['fieldName'] as String?,
      fieldType: json['fieldType'] as String?,
      required: json['required'] as bool?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => FeedbackOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$FieldsToJson(Fields instance) => <String, dynamic>{
      'fieldName': instance.fieldName,
      'fieldType': instance.fieldType,
      'required': instance.required,
      'options': instance.options,
      'answer': instance.answer,
    };

FeedbackOptions _$FeedbackOptionsFromJson(Map<String, dynamic> json) =>
    FeedbackOptions(
      key: json['key'] as String?,
      value: json['value'] as String?,
      isChecked: json['isChecked'] as bool?,
    );

Map<String, dynamic> _$FeedbackOptionsToJson(FeedbackOptions instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'isChecked': instance.isChecked,
    };
