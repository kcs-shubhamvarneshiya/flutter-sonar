import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../hours.dart';
import 'notification_message.dart';

part 'attraction.g.dart';

@JsonSerializable()
class Attraction extends Equatable {
  int? id;
  String? title;
  String? description;
  String? thumbnail;
  String? heroImage;
  List<String>? images;
  int? radius;
  String? type;
  int? averageVisitLengthInMinutes;
  String? duration;
  Options? options;
  DisplayOrder? displayOrder;
  Beacons? beacon;
  String? longitude;
  String? latitude;
  String? mapIcon;
  String? attractionType;
  NotificationMessage? notificationMessage;
  List<Details>? content;
  List<Timings>? timings;
  bool? isAddedInPlan = false;
  Attraction({
    this.id,
    this.title,
    this.description,
    this.thumbnail,
    this.heroImage,
    this.images,
    this.radius,
    this.type,
    this.duration,
    this.averageVisitLengthInMinutes,
    this.options,
    this.displayOrder,
    this.longitude,
    this.latitude,
    this.mapIcon,
    this.attractionType,
    this.notificationMessage,
    this.beacon,
    this.content,
    this.timings,
    this.isAddedInPlan

  });

  factory Attraction.fromJson(Map<String, dynamic> json) =>
      _$AttractionFromJson(json);

  Map<String, dynamic> toJson() => _$AttractionToJson(this);

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    thumbnail,
    heroImage,
    images,
    radius,
    type,
    averageVisitLengthInMinutes,
    options,
    displayOrder,
    longitude,
    latitude,
    mapIcon,
    notificationMessage,
    attractionType,
  ];
}

@JsonSerializable()
class Options extends Equatable {
  bool? reservable;
  bool? isRecommended;
  String? externalLink;

  Options({
    this.reservable,
    this.isRecommended,
    this.externalLink,
  });

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsToJson(this);

  @override
  List<Object?> get props => [reservable, isRecommended, externalLink];
}

@JsonSerializable()
class DisplayOrder extends Equatable {
  int? exploreList;
  int? visitPlanner;

  DisplayOrder({this.exploreList, this.visitPlanner});

  factory DisplayOrder.fromJson(Map<String, dynamic> json) =>
      _$DisplayOrderFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayOrderToJson(this);

  @override
  List<Object?> get props => [exploreList, visitPlanner];
}

@JsonSerializable()
class Beacons extends Equatable {
  String? id;
  int? major;
  int? minor;

  Beacons({this.id, this.major, this.minor});

  factory Beacons.fromJson(Map<String, dynamic> json) =>
      _$BeaconsFromJson(json);

  Map<String, dynamic> toJson() => _$BeaconsToJson(this);

  @override
  List<Object?> get props => [id, major, minor];
}
@JsonSerializable()
class Details {
  int? id;
  int? order;
  String? text;
  String? videoUrl;
  List<String>? images;

  Details({this.id, this.order, this.text, this.videoUrl, this.images});


  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);

}

@JsonSerializable()
class Timings {
  int? id;
  String? name;
  String? type;
  List<Hours>? hours;
  String? description;
  int? specifiedDateTimestampInSeconds;

  Timings(
      {this.id,
        this.name,
        this.type,
        this.hours,
        this.description,
        this.specifiedDateTimestampInSeconds});


  factory Timings.fromJson(Map<String, dynamic> json) =>
      _$TimingsFromJson(json);
  Map<String, dynamic> toJson() => _$TimingsToJson(this);

}