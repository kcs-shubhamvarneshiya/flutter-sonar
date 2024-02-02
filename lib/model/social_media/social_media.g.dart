// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMedia _$SocialMediaFromJson(Map<String, dynamic> json) => SocialMedia(
      type: json['type'] as String?,
      link: json['link'] as String?,
      handle: json['handle'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$SocialMediaToJson(SocialMedia instance) =>
    <String, dynamic>{
      'type': instance.type,
      'link': instance.link,
      'handle': instance.handle,
      'date': instance.date,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'profileImage': instance.profileImage,
    };
