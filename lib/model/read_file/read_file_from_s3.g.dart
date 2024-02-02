// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_file_from_s3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadFileFromS3 _$ReadFileFromS3FromJson(Map<String, dynamic> json) =>
    ReadFileFromS3(
      file: json['file'] == null
          ? null
          : AppJsonModel.fromJson(json['file'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ReadFileFromS3ToJson(ReadFileFromS3 instance) =>
    <String, dynamic>{
      'file': instance.file,
      'message': instance.message,
    };
