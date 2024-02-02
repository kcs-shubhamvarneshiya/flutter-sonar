import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.freezed.dart';

@freezed
class NotificationEvent with _$NotificationEvent{
  const factory NotificationEvent.loadNotificationEvent(bool isLongPress) = NotificationLoadEvent;
  const factory NotificationEvent.removeNotificationItemEvent(String notificationId) = NotificationRemoveItemEvent;
  const factory NotificationEvent.removeSelectedNotificationEvent(List<NotificationLog> removeItemList) = NotificationRemoveSelectedEvent;
  const factory NotificationEvent.selectedNotificationEvent(List<NotificationLog> selectedItemList,bool isLongPress,int index) = NotificationSelectedEvent;
}
