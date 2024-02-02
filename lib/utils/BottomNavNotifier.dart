import 'dart:convert';

import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dependencies.dart';
import '../model/notification/notification.dart';

class UpdateBottomVisibility with ChangeNotifier {
  late SharedPreferences prefs;
  ValueNotifier<bool> isHidden = ValueNotifier<bool>(false);
  late  ValueNotifier<int> countValueNotifier;

  UpdateBottomVisibility(){
    countValueNotifier = ValueNotifier<int>(0);
    initSharedPreferences();
  }

  // Initialize SharedPreferences
  Future<void> initSharedPreferences() async {
    prefs = getIt<SharedPreferences>();
    List? listString = prefs.getStringList(notificationList);
    if(listString!=null){
      List<NotificationLog> notificationData=listString.map((item) => NotificationLog.fromJson(json.decode(item))).toList();
      var notificationCount= notificationData.where((i) => i.isRead==false).toList().length;
      countValueNotifier.value=notificationCount;
    }
  }

  void setFloatingVisibility(bool? value){
    isHidden.value = value!;
    notifyListeners();
  }

}

UpdateBottomVisibility updateValue = UpdateBottomVisibility();