// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attraction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attraction _$AttractionFromJson(Map<String, dynamic> json) => Attraction(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      heroImage: json['heroImage'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      radius: json['radius'] as int?,
      type: json['type'] as String?,
      duration: json['duration'] as String?,
      averageVisitLengthInMinutes: json['averageVisitLengthInMinutes'] as int?,
      options: json['options'] == null
          ? null
          : Options.fromJson(json['options'] as Map<String, dynamic>),
      displayOrder: json['displayOrder'] == null
          ? null
          : DisplayOrder.fromJson(json['displayOrder'] as Map<String, dynamic>),
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      mapIcon: json['mapIcon'] as String?,
      attractionType: json['attractionType'] as String?,
      notificationMessage: json['notificationMessage'] == null
          ? null
          : NotificationMessage.fromJson(
              json['notificationMessage'] as Map<String, dynamic>),
      beacon: json['beacon'] == null
          ? null
          : Beacons.fromJson(json['beacon'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Details.fromJson(e as Map<String, dynamic>))
          .toList(),
      timings: (json['timings'] as List<dynamic>?)
          ?.map((e) => Timings.fromJson(e as Map<String, dynamic>))
          .toList(),
      isAddedInPlan: json['isAddedInPlan'] as bool?,
    );

Map<String, dynamic> _$AttractionToJson(Attraction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'heroImage': instance.heroImage,
      'images': instance.images,
      'radius': instance.radius,
      'type': instance.type,
      'averageVisitLengthInMinutes': instance.averageVisitLengthInMinutes,
      'duration': instance.duration,
      'options': instance.options,
      'displayOrder': instance.displayOrder,
      'beacon': instance.beacon,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'mapIcon': instance.mapIcon,
      'attractionType': instance.attractionType,
      'notificationMessage': instance.notificationMessage,
      'content': instance.content,
      'timings': instance.timings,
      'isAddedInPlan': instance.isAddedInPlan,
    };

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      reservable: json['reservable'] as bool?,
      isRecommended: json['isRecommended'] as bool?,
      externalLink: json['externalLink'] as String?,
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'reservable': instance.reservable,
      'isRecommended': instance.isRecommended,
      'externalLink': instance.externalLink,
    };

DisplayOrder _$DisplayOrderFromJson(Map<String, dynamic> json) => DisplayOrder(
      exploreList: json['exploreList'] as int?,
      visitPlanner: json['visitPlanner'] as int?,
    );

Map<String, dynamic> _$DisplayOrderToJson(DisplayOrder instance) =>
    <String, dynamic>{
      'exploreList': instance.exploreList,
      'visitPlanner': instance.visitPlanner,
    };

Beacons _$BeaconsFromJson(Map<String, dynamic> json) => Beacons(
      id: json['id'] as String?,
      major: json['major'] as int?,
      minor: json['minor'] as int?,
    );

Map<String, dynamic> _$BeaconsToJson(Beacons instance) => <String, dynamic>{
      'id': instance.id,
      'major': instance.major,
      'minor': instance.minor,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      id: json['id'] as int?,
      order: json['order'] as int?,
      text: json['text'] as String?,
      videoUrl: json['videoUrl'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'text': instance.text,
      'videoUrl': instance.videoUrl,
      'images': instance.images,
    };

Timings _$TimingsFromJson(Map<String, dynamic> json) => Timings(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => Hours.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      specifiedDateTimestampInSeconds:
          json['specifiedDateTimestampInSeconds'] as int?,
    );

Map<String, dynamic> _$TimingsToJson(Timings instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'hours': instance.hours,
      'description': instance.description,
      'specifiedDateTimestampInSeconds':
          instance.specifiedDateTimestampInSeconds,
    };
