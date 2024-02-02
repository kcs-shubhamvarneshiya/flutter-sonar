import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcements.g.dart';

@JsonSerializable()
class Announcements extends Equatable {
  int? id;
  String? priority;
  String? title;
  String? message;
  String? details;
  String? thumbnail;
  String? startTime;
  String? endTime;

  Announcements({
    this.id,
    this.priority,
    this.title,
    this.message,
    this.details,
    this.thumbnail,
    this.startTime,
    this.endTime,
  });

  factory Announcements.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementsFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementsToJson(this);

  @override
  List<Object?> get props => [id,priority,title,message,details,thumbnail,startTime,endTime];
}
