import 'dart:convert';

import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dependencies.dart';
import '../model/notification/notification.dart';
import '../service/remote_config.dart';
import '../utils/BottomNavNotifier.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import 'bottom_nav.dart';

@RoutePage()
class HeaderFooterHome extends StatefulWidget {
  const HeaderFooterHome({Key? key}) : super(key: key);
  static const String page = "/header_footer";

  @override
  State<HeaderFooterHome> createState() => _HeaderFooterHomeState();
}

class _HeaderFooterHomeState extends State<HeaderFooterHome> with WidgetsBindingObserver {
  late RemoteConfig remoteConfig;

  @override
  initState() {
    super.initState();
    remoteConfig=getIt<RemoteConfig>();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if(state == AppLifecycleState.resumed){
      var prefs = getIt<SharedPreferences>();
      await prefs.reload();
      List? listString = prefs.getStringList(notificationList);
      if(listString!=null){
        List<NotificationLog> notificationData=listString.map((item) => NotificationLog.fromJson(json.decode(item))).toList();
        var notificationCount = notificationData.where((i) => i.isRead==false).toList().length;
        updateValue.countValueNotifier.value=notificationCount;
      }
      Constant.currentVideoUrl = getVideoUrl(remoteConfig);
    }
  }

  @override
  void dispose(){
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeBottomNav(),
    );
  }
}
