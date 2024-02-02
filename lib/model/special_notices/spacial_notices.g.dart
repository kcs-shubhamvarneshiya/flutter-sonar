// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spacial_notices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialNotices _$SpecialNoticesFromJson(Map<String, dynamic> json) =>
    SpecialNotices(
      audio: json['audio'] == null
          ? null
          : Audio.fromJson(json['audio'] as Map<String, dynamic>),
      image: json['image'] as String?,
      title: json['title'] as String?,
      video: json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Details.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$SpecialNoticesToJson(SpecialNotices instance) =>
    <String, dynamic>{
      'audio': instance.audio,
      'image': instance.image,
      'title': instance.title,
      'video': instance.video,
      'details': instance.details,
      'description': instance.description,
      'id': instance.id,
    };
