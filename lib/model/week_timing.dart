
import 'package:json_annotation/json_annotation.dart';

part 'week_timing.g.dart';


@JsonSerializable()
class WeekTiming {
  List<int>? days;
  String? title;
  String? Closing_time;
  String? last_entry_time;
  String? first_entry_time;

  WeekTiming({
    this.days,
    this.title,
    this.Closing_time,
    this.last_entry_time,
    this.first_entry_time,});

  factory WeekTiming.fromJson(Map<String, dynamic> json) => _$WeekTimingFromJson(json);
  Map<String, dynamic> toJson() => _$WeekTimingToJson(this);
}