// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationMessage _$NotificationMessageFromJson(Map<String, dynamic> json) =>
    NotificationMessage(
      body: json['body'] as String?,
      title: json['title'] as String?,
      deepLink: json['deepLink'] as String?,
    );

Map<String, dynamic> _$NotificationMessageToJson(
        NotificationMessage instance) =>
    <String, dynamic>{
      'body': instance.body,
      'title': instance.title,
      'deepLink': instance.deepLink,
    };
