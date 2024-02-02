// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
      title: json['title'] as String?,
      description: json['description'] as String?,
      timings: (json['timings'] as List<dynamic>?)
          ?.map((e) => Timings.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      type: json['type'] as String?,
      externalLink: json['externalLink'] as String?,
      eventDate: json['eventDate'] as String?,
    );

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'timings': instance.timings,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
      'type': instance.type,
      'externalLink': instance.externalLink,
      'eventDate': instance.eventDate,
    };

Timings _$TimingsFromJson(Map<String, dynamic> json) => Timings(
      name: json['name'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => Hours.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimingsToJson(Timings instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'hours': instance.hours,
    };

Hours _$HoursFromJson(Map<String, dynamic> json) => Hours(
      weekday: json['weekday'] as String?,
      startHour: (json['startHour'] as num?)?.toDouble(),
      endHour: (json['endHour'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HoursToJson(Hours instance) => <String, dynamic>{
      'weekday': instance.weekday,
      'startHour': instance.startHour,
      'endHour': instance.endHour,
    };
