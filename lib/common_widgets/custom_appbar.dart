// ignore_for_file: must_be_immutable
import 'dart:convert';

import 'package:akdmvisitorsapp/model/user_model/user_model.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_change_event.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../dependencies.dart';
import '../presentaion/bloc/attraction_filter_bloc/attraction_filter_bloc.dart';
import '../presentaion/indoorMap/logic/MapMarkerProvider.dart';
import '../utils/iconpath.dart';
import '../utils/strings.dart';
import 'appbar_widget.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  CustomAppBar({Key? key,this.isNotification}): preferredSize = Size.fromHeight(9.5.h),super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  bool? isNotification=false;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

}

class _CustomAppBarState extends State<CustomAppBar>with AppbarNotificationButton  {
  SharedPreferences? sharedPreferences;
  String? tokenValue;
  UserModel? userModel;
  AppbarNotificationButton? notificationButtonClick;
  MapMarkerProvider? mapProviderRead;
  @override
  void initState() {
    super.initState();
    notificationButtonClick =this;
    loadSharedPreferences();
    mapProviderRead = context.read<MapMarkerProvider>();
  }

  loadSharedPreferences() async {
    sharedPreferences = getIt<SharedPreferences>();
    var key =  sharedPreferences!.getString(keySSOUserModule);
    if(key != null && key.isNotEmpty) {
      UserModel model = UserModel.fromJson(jsonDecode(key.toString()));
      setState(() {
        tokenValue = sharedPreferences!.getString(keySSOUserTokenPref);
        userModel = model;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      appBarColor: ColorPath.containerBorderColor.withOpacity(.95),//ColorPath.headerBgContainer.withOpacity(.6),
      userAppBarIcon: IconPaths.userIcon,
      appBarLogoImage: IconPaths.akdmLogo,
      notificationAppBarIcon: IconPaths.notificationIcon,
      userModel: userModel,
      tokenValue: tokenValue,
      isNotification: widget.isNotification,
      notificationButtonClick: notificationButtonClick!,
    );
  }

  @override
  void onClick() {
    mapProviderRead!.isSelectAttractionUpdate =false;
    mapProviderRead!.selectMapFilter(null);
    context.read<AttractionFilterBloc>().add(AttractionChangeEvent.tap(false,0,'',mapProviderRead!.isVisibleList!));//allText
  }
}

