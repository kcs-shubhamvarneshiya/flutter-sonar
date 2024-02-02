// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Galleries _$GalleriesFromJson(Map<String, dynamic> json) => Galleries(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GalleriesToJson(Galleries instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'media': instance.media,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      type: json['type'] as String?,
      name: json['name'] as String?,
      captions: json['captions'] as String?,
      src: json['src'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'captions': instance.captions,
      'src': instance.src,
      'thumbnail': instance.thumbnail,
    };
