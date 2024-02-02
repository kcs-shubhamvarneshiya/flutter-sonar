import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../hours.dart';

part 'campus_timing.g.dart';

@JsonSerializable()
class CampusTimings extends Equatable {
  int? id;
  String? name;
  String? description;
  String? type;
  List<Hours>? hours;

  CampusTimings({this.id,this.name, this.description, this.type, this.hours});

  factory CampusTimings.fromJson(Map<String, dynamic> json) => _$CampusTimingsFromJson(json);

  Map<String, dynamic> toJson() => _$CampusTimingsToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    type,
    hours
  ];
}