// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/constants.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../router_page/app_router.dart';
import '../utils/iconpath.dart';
import 'commonDialog.dart';
import 'custom_text.dart';
import 'widgets.dart';

class PhotoContent extends StatefulWidget {
  PhotoContent({
    Key? key,
    required this.index,
    required this.imageName,
    required this.primaryText,
    required this.secondaryText,
    required this.buttonText,
    required this.controller,
  }) : super(key: key);

  final int index;
  final String imageName;
  final String primaryText;
  final String secondaryText;
  final String buttonText;

  PageController controller = PageController(initialPage: 0);

  @override
  State<PhotoContent> createState() => _PhotoContentState();
}

class _PhotoContentState extends State<PhotoContent> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            foregroundDecoration:const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorPath.primaryColor,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.5],
              ),
            ),
            decoration: BoxDecoration(
              color: ColorPath.primaryColor,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  widget.imageName,
                ),
              ),
            ),
            // child: SvgPicture.asset(introBackImage,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,)
          ),

          /*Align(
            alignment: Alignment.bottomCenter,
            child:Container(
              height: MediaQuery.of(context).size.height * .36,
              padding:EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: widget.primaryText,
                    fontSize: 26.sp,
                    underline: false,
                    fontWeight: FontWeight.w300,
                    color: ColorPath.primaryTextColor,
                    align: TextAlign.center,
                    fontFamily:addingTonFont,
                  ),
                   VerticalSpace(height: 2.h),
                  CustomText(
                    text: widget.secondaryText,
                    fontSize: 11.sp,
                    underline: false,
                    fontWeight: FontWeight.w400,
                    color: ColorPath.primaryTextColor,
                    maxLine: 5,
                    align: TextAlign.center,
                    fontFamily: interFont,
                  ),
                ],
              ),
            ),
          ),*/

          Positioned(
            bottom:16.h,
            left: 0,
            right: 0,
            child: Container(
              padding:EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: widget.primaryText,
                    fontSize: 26.sp,
                    underline: false,
                    fontWeight: FontWeight.w300,
                    color: ColorPath.primaryTextColor,
                    align: TextAlign.center,
                    fontFamily:addingTonFont,
                  ),
                  VerticalSpace(height: 2.h),
                  CustomText(
                    text: widget.secondaryText,
                    fontSize: 12.sp,
                    underline: false,
                    fontWeight: FontWeight.w400,
                    color: ColorPath.primaryTextColor,
                    maxLine: 5,
                    align: TextAlign.center,
                    fontFamily: interFont,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * .05,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              //padding: const EdgeInsets.only(bottom: 20),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: OutlinedButton.icon(
                  onPressed: widget.index == 1 ? () async {
                    widget.controller.jumpToPage(widget.index);
                  }
                  :widget.index == 4 ? () async {
                    final SharedPreferences preferences = getIt<SharedPreferences>();
                    preferences.setBool(isFirstTimeSplashPref, false);
                    getIt<AppRouter>().replace(const HeaderFooterHomeRoute());
                    /*final status = await Permission.bluetoothConnect.status;
                    if(Platform.isAndroid){
                      if(status == PermissionStatus.denied){
                        getIt<AppRouter>().replace(const HeaderFooterHomeRoute());
                        }else {
                        await Permission.bluetoothConnect.request().then((value) {
                          if (value == PermissionStatus.granted){
                            getIt<AppRouter>().replace(const HeaderFooterHomeRoute());
                          }
                      });
                    }
                    }else{
                      getIt<AppRouter>().replace(const HeaderFooterHomeRoute());
                    }*/
                  } : widget.index == 2 ? () async {
                    final SharedPreferences pref = getIt<SharedPreferences>();
                    final status = await Permission.location.status;
                    await Permission.location.request();
                    if(status == PermissionStatus.granted){
                      print("Hello Granted");
                      /*if (Platform.isAndroid) {
                          showDialog(
                            context: context,
                            builder: (_) => CommonDialog(
                              title: alertTitle,

                              description: alertDescription,
                              onTap: () async {
                                await Geolocator.openAppSettings();
                              },
                            ),
                          );
                        }*/
                      Map<String, dynamic> locationParameter = {
                        'permission': locationPermission,
                        'Status': "Allow",
                      };
                      setAnalyticData(locationAllow,locationParameter);
                      widget.controller.jumpToPage(widget.index);
                    }else if(status == PermissionStatus.denied){
                      pref.setBool(isLocationTap, true);
                      print("Hello Denied");
                      Map<String, dynamic> locationParameter = {
                        'permission': locationPermission,
                        'Status': "Disallow",
                      };
                      setAnalyticData(locationDisallow,locationParameter);
                      widget.controller.jumpToPage(widget.index);
                    }else{
                      print("Hello permanent Denied");
                      Map<String, dynamic> locationParameter = {
                        'permission': locationPermission,
                        'Status': "Disallow",
                      };
                      setAnalyticData(locationDisallow,locationParameter);
                      widget.controller.jumpToPage(widget.index);
                    }
                    pref.setBool(isLocationTap, true);
                  } : widget.index == 3 ? () async {
                    final SharedPreferences pref = getIt<SharedPreferences>();
                    final status = await Permission.notification.status;
                    await Permission.notification.request();
                    if(status == PermissionStatus.granted){
                      print("Hello Granted Noti");
                      Map<String, dynamic> notificationParameter = {
                        'permission': notificationPermission,
                        'Status': "Allow",
                      };
                      setAnalyticData(notificationAllow,notificationParameter);
                      widget.controller.jumpToPage(widget.index);
                    }else if(status == PermissionStatus.denied){
                      pref.setBool(isNotificationTap, true);
                      print("Hello Denied Noti");
                      Map<String, dynamic> notificationParameter = {
                        'permission': notificationPermission,
                        'Status': "Disallow",
                      };
                      setAnalyticData(notificationDisallow,notificationParameter);
                      widget.controller.jumpToPage(widget.index);
                    }
                    pref.setBool(isNotificationTap, true);
                  }:(){},
                  label: Padding(
                    padding: EdgeInsets.all(1.w),
                    child: CustomText(
                      text: widget.buttonText,
                      fontSize: 11.sp,
                      underline: false,
                      fontWeight: FontWeight.w700,
                      color: ColorPath.secondaryBrownColor,
                      fontFamily: interFont,
                    ),
                  ),
                  icon:Image.asset(IconPaths.arrowIcon,width: 5.w,height: 5.h),
                  style: OutlinedButton.styleFrom(
                    backgroundColor:ColorPath.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    fixedSize: const Size(double.infinity,40),
                    //side: BorderSide(color: ColorPath.buttonOutlineColor, width: 0.5.w,),
                    side: BorderSide(color: ColorPath.secondaryBrownColor, width: 0.5.w,),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
