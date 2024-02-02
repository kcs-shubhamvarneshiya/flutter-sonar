// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
