
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_message.g.dart';

@JsonSerializable()
class NotificationMessage extends Equatable{
  String? body;
  String? title;
  String? deepLink;

  NotificationMessage({
    this.body,
    this.title,
    this.deepLink,
  });

  factory NotificationMessage.fromJson(Map<String, dynamic> json) => _$NotificationMessageFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationMessageToJson(this);

  @override
  List<Object?> get props => [body,title,deepLink];
}