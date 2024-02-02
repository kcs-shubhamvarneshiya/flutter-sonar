// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoConfig _$VideoConfigFromJson(Map<String, dynamic> json) => VideoConfig(
      (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VideoConfigToJson(VideoConfig instance) =>
    <String, dynamic>{
      'urls': instance.urls,
    };
