import 'dart:convert';

import 'package:akdmvisitorsapp/common_widgets/sign_out_alert.dart';
import 'package:akdmvisitorsapp/model/user_model/user_model.dart';
import 'package:akdmvisitorsapp/utils/BottomNavNotifier.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../model/notification/notification.dart';
import '../presentaion/indoorMap/logic/MapMarkerProvider.dart';
import '../router_page/app_router.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import 'custom_text.dart';
import 'login_alert.dart';

abstract class AppbarNotificationButton {
  void onClick();
}

class AppbarWidget extends StatefulWidget {
  AppbarWidget(
      {Key? key,
      this.appBarColor,
      this.userAppBarIcon,
      this.appBarLogoImage,
      this.notificationAppBarIcon,
      this.tokenValue,
      this.userModel,
      this.isNotification,this.notificationButtonClick})
      : super(key: key);
  final Color? appBarColor;
  final String? userAppBarIcon;
  final String? appBarLogoImage;
  final String? notificationAppBarIcon;
  bool? isNotification = false;
  String? tokenValue;
  UserModel? userModel;
  AppbarNotificationButton? notificationButtonClick;

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.appBarColor),
      height: 12.h,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*Visibility(
            visible: true,
            child: GestureDetector(
              onTap: () async {
                final RenderBox? appBarRenderBox =
                    context.findRenderObject() as RenderBox?;
                final double? appBarHeight = appBarRenderBox?.size.height;
                //Adjust this value to set the desired offset
                const double appBarOffset = 15.0;
                final double dialogTopOffset =
                    (appBarHeight ?? 0.0) - appBarOffset;
                if (widget.tokenValue != null && widget.tokenValue!.isNotEmpty) {
                  *//*showGeneralDialog(
                    barrierColor: Colors.transparent.withOpacity(.8),
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    context: context,
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return Stack(
                        children: [
                          Positioned(
                            top: dialogTopOffset,
                            left: 0,
                            right: 0,
                            child: SignOutAlert(model: widget.userModel),
                          ),
                        ],
                      );
                    },
                  );*//*
                  loginBottomSheet(context,SignOutAlert(model: widget.userModel));
                } else {
                  *//*showGeneralDialog(
                    barrierColor: Colors.transparent.withOpacity(.8),
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    context: context,
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return Stack(
                        children: [
                          Positioned(
                            top: dialogTopOffset,
                            left: 0,
                            right: 0,
                            child:const LoginAlert(),
                          ),
                        ],
                      );
                    },
                  );*//*
                  loginBottomSheet(context,const LoginAlert());
                }
              },
              child: SvgPicture.asset(widget.userAppBarIcon!),
            ),
          ),*/
         Container(width: 18,),

          Image.asset(
            widget.appBarLogoImage!,
            height: 5.h,
            width: 30.w,
          ),
          !widget.isNotification!
              ? InkWell(
                  onTap: () {
                    //getIt<AppRouter>().pop();
                  },
                  child: ValueListenableBuilder<int>(
                      valueListenable: updateValue.countValueNotifier,
                      builder: (context, value, _) {
                        return Stack(
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(top: 5, right: 5),
                                child: Icon(Icons.notifications)),
                            updateValue.countValueNotifier.value > 0
                                ? Positioned(
                                    left: 10,
                                    bottom: 9.5,
                                    child: Container(
                                      alignment: Alignment.center,
                                      //padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                        color: ColorPath.notificationBadge,
                                        shape: BoxShape.circle,
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 18,
                                        minHeight: 17,
                                      ),
                                      child: CustomText(
                                        text: updateValue.countValueNotifier.value <= 99
                                            ? updateValue
                                                .countValueNotifier.value
                                                .toString()
                                            : "99",
                                        fontSize: 8.sp,
                                        underline: false,
                                        fontFamily: interFont,
                                        fontWeight: FontWeight.w300,
                                        color: ColorPath.whiteColor,
                                        maxLine: 1,
                                        align: TextAlign.center,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        );
                      }),
                )
              : InkWell(
                  onTap: () {
                    setAnalyticData(nameNotification,<String, String>{});
                    getIt<AppRouter>().push(const NotificationScreenRoute()).then((value) async {
                      var prefs = getIt<SharedPreferences>();
                      List? listString = prefs.getStringList(notificationList);
                      if (listString != null) {
                        List<NotificationLog> notificationData = listString
                            .map((item) => NotificationLog.fromJson(json.decode(item))).toList();
                        var notificationCount = notificationData
                            .where((i) => i.isRead == false)
                            .toList()
                            .length;
                        updateValue.countValueNotifier.value = notificationCount;
                      }
                      if(widget.notificationButtonClick !=null) {
                        widget.notificationButtonClick!.onClick();
                      }
                    });
                  },
                  child: Visibility(
                    visible: widget.isNotification!,
                    child: ValueListenableBuilder<int>(
                        valueListenable: updateValue.countValueNotifier,
                        builder: (context, value, _) {
                          return Stack(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 5),
                                  child: SvgPicture.asset(
                                      widget.notificationAppBarIcon!)),
                              updateValue.countValueNotifier.value > 0
                                  ? Positioned(
                                      left: 10,
                                      bottom: 9.5,
                                      child: Container(
                                        alignment: Alignment.center,
                                        //padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                          color: ColorPath.notificationBadge,
                                          shape: BoxShape.circle,
                                        ),
                                        constraints: const BoxConstraints(
                                          minWidth: 18,
                                          minHeight: 17,
                                        ),
                                        child: CustomText(
                                          text: updateValue.countValueNotifier
                                                      .value <=
                                                  99
                                              ? updateValue
                                                  .countValueNotifier.value
                                                  .toString()
                                              : "99",
                                          fontSize: 8.sp,
                                          underline: false,
                                          fontFamily: interFont,
                                          fontWeight: FontWeight.w300,
                                          color: ColorPath.whiteColor,
                                          maxLine: 1,
                                          align: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          );
                        }),
                  ),
                ),
        ],
      ),
    );
  }

  /*loginBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      useSafeArea: true,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      isDismissible: false,
      useRootNavigator: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      backgroundColor: ColorPath.bottomNavBgColor,
      context: context,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.88,
        child: const LoginAlert(),
      ),
    );
  }*/
  loginBottomSheet(BuildContext context,Widget widgetType){
    showModalBottomSheet(
      isDismissible: false,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context){
        return Stack(
          children: [
            Positioned(
              bottom: 33.h,//8
              left:0,
              right:0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,//80
                decoration: const BoxDecoration(
                  color: ColorPath.bottomNavBgColor,
                ),
                child:widgetType,
              ),
            ),
          ],
        );
      },
    );
  }
}
