// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_api_json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppJsonApiModel _$AppJsonApiModelFromJson(Map<String, dynamic> json) =>
    AppJsonApiModel(
      readFileFromS3: json['readFileFromS3'] == null
          ? null
          : ReadFileFromS3.fromJson(
              json['readFileFromS3'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppJsonApiModelToJson(AppJsonApiModel instance) =>
    <String, dynamic>{
      'readFileFromS3': instance.readFileFromS3,
    };
