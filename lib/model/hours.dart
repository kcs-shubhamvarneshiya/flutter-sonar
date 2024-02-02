
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hours.g.dart';

@JsonSerializable()
class Hours extends Equatable{
  String? weekday;
  double? startHour;
  double? endHour;

  Hours({this.weekday, this.startHour, this.endHour});

  factory Hours.fromJson(Map<String, dynamic> json) => _$HoursFromJson(json);

  Map<String, dynamic> toJson() => _$HoursToJson(this);

  @override
  List<Object?> get props => [weekday,startHour,endHour];

}