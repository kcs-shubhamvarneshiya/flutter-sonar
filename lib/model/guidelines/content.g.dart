// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      order: json['order'] as int?,
      text: json['text'] as String?,
      videoUrl: json['videoUrl'] as String?,
      imageURL: (json['imageURL'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'order': instance.order,
      'text': instance.text,
      'videoUrl': instance.videoUrl,
      'imageURL': instance.imageURL,
    };
