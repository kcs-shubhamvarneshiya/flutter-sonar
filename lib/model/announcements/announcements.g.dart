// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcements _$AnnouncementsFromJson(Map<String, dynamic> json) =>
    Announcements(
      id: json['id'] as int?,
      priority: json['priority'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      details: json['details'] as String?,
      thumbnail: json['thumbnail'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$AnnouncementsToJson(Announcements instance) =>
    <String, dynamic>{
      'id': instance.id,
      'priority': instance.priority,
      'title': instance.title,
      'message': instance.message,
      'details': instance.details,
      'thumbnail': instance.thumbnail,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
