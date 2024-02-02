// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_form.g.dart';

@JsonSerializable()
class FeedbackForm extends Equatable {
  String? submitLink;
  List<Fields>? fields;

  FeedbackForm({this.submitLink, this.fields});

  factory FeedbackForm.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFormFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackFormToJson(this);

  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class Fields extends Equatable {
  String? fieldName;
  String? fieldType;
  bool? required;
  List<FeedbackOptions>? options;
  String? answer;

  Fields({this.fieldName, this.fieldType, this.required, this.options,this.answer});

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);

  Map<String, dynamic> toJson() => _$FieldsToJson(this);

  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class FeedbackOptions extends Equatable {
  String? key;
  String? value;
  bool? isChecked=false;
  FeedbackOptions({this.key, this.value,this.isChecked});

  factory FeedbackOptions.fromJson(Map<String, dynamic> json) =>
      _$FeedbackOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackOptionsToJson(this);

  @override
  List<Object?> get props => [];
}
