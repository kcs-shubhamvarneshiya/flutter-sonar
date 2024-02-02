import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/notification/notification.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    required List<NotificationLog> notificationList,
    required bool isLongPress,
    required bool isFiltering}) = _NotificationState;

  factory NotificationState.loaded() => const NotificationState(
      isLongPress: false,
      notificationList: [],
      isFiltering: false);
}
