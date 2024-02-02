// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guidelines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guidelines _$GuidelinesFromJson(Map<String, dynamic> json) => Guidelines(
      image: json['image'] as String?,
      description: json['description'] as String?,
      link: json['link'] as String?,
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GuidelinesToJson(Guidelines instance) =>
    <String, dynamic>{
      'image': instance.image,
      'description': instance.description,
      'link': instance.link,
      'sections': instance.sections,
    };
