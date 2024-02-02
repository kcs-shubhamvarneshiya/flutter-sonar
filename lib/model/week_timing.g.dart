// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_timing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeekTiming _$WeekTimingFromJson(Map<String, dynamic> json) => WeekTiming(
      days: (json['days'] as List<dynamic>?)?.map((e) => e as int).toList(),
      title: json['title'] as String?,
      Closing_time: json['Closing_time'] as String?,
      last_entry_time: json['last_entry_time'] as String?,
      first_entry_time: json['first_entry_time'] as String?,
    );

Map<String, dynamic> _$WeekTimingToJson(WeekTiming instance) =>
    <String, dynamic>{
      'days': instance.days,
      'title': instance.title,
      'Closing_time': instance.Closing_time,
      'last_entry_time': instance.last_entry_time,
      'first_entry_time': instance.first_entry_time,
    };
