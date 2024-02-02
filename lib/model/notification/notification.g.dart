// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationLog _$NotificationLogFromJson(Map<String, dynamic> json) =>
    NotificationLog(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      date: json['date'] as String?,
      type: json['type'] as String?,
      isRead: json['isRead'] as bool?,
      isSelected: json['isSelected'] as bool,
      previewBody: json['previewBody'] as String?,
      deepLink: json['deepLink'] as String?,
    );

Map<String, dynamic> _$NotificationLogToJson(NotificationLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date,
      'type': instance.type,
      'previewBody': instance.previewBody,
      'deepLink': instance.deepLink,
      'isRead': instance.isRead,
      'isSelected': instance.isSelected,
    };
