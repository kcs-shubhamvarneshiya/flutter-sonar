import 'dart:io';

import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../router_page/app_router.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import 'custom_text.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget{
  CustomHeader({Key? key, required this.title, required this.redirectToHome}) : preferredSize = Size.fromHeight(Platform.isIOS ? 6.5.h:7.5.h), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  final String title;
  final bool redirectToHome;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPath.containerBorderColor.withOpacity(.95),
      foregroundColor: ColorPath.primaryColor,
      elevation: 0,
      title: Padding(
        padding:Platform.isIOS ? const EdgeInsets.all(0):EdgeInsets.only(top: 15.h,bottom: 14.h),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: CustomText(
                text: title,
                fontSize: 21.sp,
                underline: false,
                fontWeight: FontWeight.w300,
                fontFamily: addingTonFont,
                color: ColorPath.primaryColor,
                maxLine: 1,
                align: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      leading:Padding(
        padding: Platform.isIOS ? const EdgeInsets.all(0):EdgeInsets.only(top: 1.5.h,bottom: 0.5.h),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if(redirectToHome){
              getIt<AppRouter>().replace(const HeaderFooterHomeRoute());
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            }else{
              getIt<AppRouter>().pop();
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            }
          },
        ),
      ),
      centerTitle: true,
    );
    /*return SafeArea(
      bottom: false,
      child: Container(
        color: ColorPath.containerBorderColor.withOpacity(.60),//ColorPath.bottomNavBgColor,
        child: Container(
          padding: EdgeInsets.only(
            left: 2.h,
          ),
          child: GestureDetector(
            key: const Key('back_screen'),
            onTap: () {
              getIt<AppRouter>().pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpace(height: 7.h),
                HorizontalSpace(width: 1.h),
                InkWell(
                    onTap: () => getIt<AppRouter>().pop(),
                    child: SvgPicture.asset(IconPaths.leftBackArrowIcon)),
                //HorizontalSpace(width: 2.5.h),
                Expanded(
                  child: CustomText(
                    text: title,
                    fontSize: 21.sp,
                    underline: false,
                    fontWeight: FontWeight.w300,
                    fontFamily: addingTonFont,
                    color: ColorPath.primaryColor,
                    maxLine: 1,
                    align: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );*/
  }
}
