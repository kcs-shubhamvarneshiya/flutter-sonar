// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_timing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusTimings _$CampusTimingsFromJson(Map<String, dynamic> json) =>
    CampusTimings(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => Hours.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CampusTimingsToJson(CampusTimings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'hours': instance.hours,
    };
