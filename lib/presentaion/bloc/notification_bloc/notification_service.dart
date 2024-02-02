import 'dart:convert';

import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../utils/strings.dart';

abstract class NotificationService {
  Future<List<NotificationLog>> getFcmNotificationList();
}

@Injectable(as: NotificationService)
class NotificationServiceImpl implements NotificationService{
  SharedPreferences? sharedPreferences;
  NotificationServiceImpl():sharedPreferences=getIt<SharedPreferences>();

  @override
  Future<List<NotificationLog>> getFcmNotificationList() async {
    List<NotificationLog> notificationData=[];
    await sharedPreferences?.reload();
    List? listString = sharedPreferences?.getStringList(notificationList);
    if(listString!=null){
      List<NotificationLog> notificationData = listString
          .map((item) => NotificationLog.fromJson(json.decode(item)))
          .toList();
      notificationData.sort((a, b) => b.date!.compareTo(a.date!));
      return notificationData;
    }else{
      return notificationData;
    }
  }
}
