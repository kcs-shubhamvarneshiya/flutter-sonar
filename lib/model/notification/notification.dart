import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class NotificationLog extends Equatable {
  String? id;
  String? title;
  String? body;
  String? date;
  String? type;
  String? previewBody;
  String? deepLink;
  bool? isRead;
  bool isSelected;

  NotificationLog(
      {this.id,
      this.title,
      this.body,
      this.date,
      this.type,
      required this.isRead,
      required this.isSelected,
      this.previewBody,
      this.deepLink});

  NotificationLog copyWith(
      {String? id,
      String? title,
      String? body,
      String? date,
      String? type,
      String? previewBody,
      String? deepLink,
      bool? isRead,
      bool? isSelected}) {
    return NotificationLog(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      date: date ?? this.date,
      type: type ?? this.type,
      previewBody: previewBody ?? this.previewBody,
      deepLink: deepLink ?? this.deepLink,
      isRead: isRead ?? this.isRead,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory NotificationLog.fromJson(Map<String, dynamic> json) =>
      _$NotificationLogFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationLogToJson(this);

  @override
  List<Object?> get props =>
      [id, title, body, date, type, previewBody, deepLink, isRead, isSelected];
}
