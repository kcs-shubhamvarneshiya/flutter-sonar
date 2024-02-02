import 'dart:convert';

import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../utils/BottomNavNotifier.dart';
import '../../../utils/strings.dart';
import 'notification_event.dart';
import 'notification_service.dart';
import 'notification_state.dart';


@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState>{
  SharedPreferences? sharedPreferences;
  final NotificationService? notificationService;

  NotificationBloc():notificationService = getIt<NotificationService>(),sharedPreferences=getIt<SharedPreferences>(),super(NotificationState.loaded()){
    on<NotificationLoadEvent>(notificationLoadEvent);
    on<NotificationRemoveItemEvent>(notificationRemoveItemEvent);
    on<NotificationRemoveSelectedEvent>(notificationRemoveSelectedEvent);
    on<NotificationSelectedEvent>(notificationSelectedEvent);
  }

  notificationLoadEvent(NotificationLoadEvent event, emit) async {
      if(!event.isLongPress){
        var notificationData = await notificationService!.getFcmNotificationList();
        var notificationCount = notificationData.where((i) => i.isRead == false).toList().length;
        updateValue.countValueNotifier.value = notificationCount;
        emit(state.copyWith(notificationList: notificationData, isLongPress: false,isFiltering: !state.isFiltering));
      }
  }

  notificationRemoveItemEvent(NotificationRemoveItemEvent event, emit) async {
    var notificationData = await notificationService!.getFcmNotificationList();
    notificationData.removeWhere((element) => element.id == event.notificationId);
    List<String> listAfterDelete=notificationData.map((item) => jsonEncode(item.toJson())).toList();
    sharedPreferences!.setStringList(notificationList, listAfterDelete);
    var updatedFcmData = await notificationService!.getFcmNotificationList();
    var notificationCount = updatedFcmData.where((i) => i.isRead == false).toList().length;
    updateValue.countValueNotifier.value = notificationCount;
    emit(state.copyWith(notificationList: updatedFcmData,isLongPress:false,isFiltering: !state.isFiltering));
    add(const NotificationEvent.loadNotificationEvent(false));
  }

  notificationRemoveSelectedEvent(NotificationRemoveSelectedEvent event, emit) async {
    var notificationData = await notificationService!.getFcmNotificationList();
    notificationData.removeWhere((element) => event.removeItemList.any((item) => element.id == item.id));
    List<String> listAfterDelete=notificationData.map((item) => jsonEncode(item.toJson())).toList();
    sharedPreferences!.setStringList(notificationList, listAfterDelete);
    var updatedFcmData = await notificationService!.getFcmNotificationList();
    var notificationCount = updatedFcmData.where((i) => i.isRead == false).toList().length;
    updateValue.countValueNotifier.value = notificationCount;
    emit(state.copyWith(notificationList: updatedFcmData,isLongPress:false,isFiltering: !state.isFiltering));
    add(const NotificationEvent.loadNotificationEvent(false));
  }

  notificationSelectedEvent(NotificationSelectedEvent event, emit) async {
    List<NotificationLog> mList = List.from(state.notificationList);
    mList[event.index] = mList[event.index].copyWith(isSelected: !mList[event.index].isSelected);
    final newState = state.copyWith(notificationList: mList, isLongPress: event.isLongPress);
    emit(newState);
  }

}
