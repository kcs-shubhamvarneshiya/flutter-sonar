// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      title: json['title'] as String?,
      publishedAt: json['publishedAt'] as String?,
      author: json['author'] as String?,
      thumbnail: json['thumbnail'] as String?,
      heroImage: json['heroImage'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
      file: json['file'] as String?,
      description: json['description'] as String?,
      extraText: json['extraText'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      externalLink: json['externalLink'] as String?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'title': instance.title,
      'publishedAt': instance.publishedAt,
      'author': instance.author,
      'thumbnail': instance.thumbnail,
      'heroImage': instance.heroImage,
      'gallery': instance.gallery,
      'file': instance.file,
      'description': instance.description,
      'extraText': instance.extraText,
      'tags': instance.tags,
      'categories': instance.categories,
      'externalLink': instance.externalLink,
    };
