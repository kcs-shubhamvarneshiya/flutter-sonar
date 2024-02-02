import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events.g.dart';

@JsonSerializable()
class Events extends Equatable {
  String? title;
  String? description;
  List<Timings>? timings;
  String? thumbnail;
  List<String>? images;
  String? type;
  String? externalLink;
  String? eventDate;

  Events({
    this.title,
    this.description,
    this.timings,
    this.thumbnail,
    this.images,
    this.type,
    this.externalLink,
    this.eventDate
  });

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);

  @override
  List<Object?> get props => [
        title,
        description,
        timings,
        thumbnail,
        images,
        type,
        externalLink,
        eventDate
      ];
}

@JsonSerializable()
class Timings extends Equatable{
  String? name;
  String? description;
  String? type;
  List<Hours>? hours;

  Timings({
    this.name,
    this.description,
    this.type,
    this.hours,
  });

  factory Timings.fromJson(Map<String, dynamic> json) =>
      _$TimingsFromJson(json);

  Map<String, dynamic> toJson() => _$TimingsToJson(this);

  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class Hours extends Equatable{
  String? weekday;
  double? startHour;
  double? endHour;

  Hours({
    this.weekday,
    this.startHour,
    this.endHour,
  });

  factory Hours.fromJson(Map<String, dynamic> json) => _$HoursFromJson(json);

  Map<String, dynamic> toJson() => _$HoursToJson(this);
  @override
  List<Object?> get props => [];
}
