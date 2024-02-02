// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accommodations _$AccommodationsFromJson(Map<String, dynamic> json) =>
    Accommodations(
      id: json['id'] as int?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      price: json['price'] as int?,
      link: json['link'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$AccommodationsToJson(Accommodations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'price': instance.price,
      'link': instance.link,
      'thumbnail': instance.thumbnail,
    };
