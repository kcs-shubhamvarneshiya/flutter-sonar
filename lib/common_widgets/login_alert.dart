import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../router_page/app_router.dart';
import '../utils/iconpath.dart';

class LoginAlert extends StatelessWidget {
  const LoginAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.5.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () => getIt<AppRouter>().pop(),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 5.h,
                  width: 5.h,
                  padding: EdgeInsets.all(1.h),
                  margin: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorPath.primaryColor,
                  ),
                  child: SvgPicture.asset(IconPaths.removeCircleIcon),
                ),
              ),
            ),
            VerticalSpace(height: 1.5.h),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: emailHint,
                fontSize: 11.0.sp,
                underline: false,
                fontFamily: interFont,
                fontWeight: FontWeight.w300,
                color: ColorPath.primaryColor,
                maxLine: 3,
                align: TextAlign.start,
              ),
            ),
            VerticalSpace(height: 3.h),//2
            /*const CustomTextField(label: signInEmail),
                VerticalSpace(height: 1.5.h),*/
            ElevatedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: ColorPath.primaryButtonColor,
                  fixedSize: const Size(double.maxFinite, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.h))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: signInPhone,
                    fontSize: 10.sp,
                    underline: false,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.whiteColor,
                    align: TextAlign.center,
                    maxLine: 1,
                    overflow:TextOverflow.ellipsis,
                  ),
                  HorizontalSpace(width: 1.h),
                  SvgPicture.asset(IconPaths.phoneRoundedIcon),
                  //const Icon(Icons.email_rounded)
                ],
              ),
            ),
            VerticalSpace(height: 1.h),
            ElevatedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: ColorPath.primaryButtonColor,
                  fixedSize: const Size(double.maxFinite, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.h))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: signInEmail,
                    fontSize: 10.sp,
                    underline: false,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.whiteColor,
                    align: TextAlign.center,
                    maxLine: 1,
                    overflow:TextOverflow.ellipsis,
                  ),
                  HorizontalSpace(width: 1.h),
                  SvgPicture.asset(IconPaths.emailRoundedIcon),
                  //const Icon(Icons.email_rounded)
                ],
              ),
            ),
            VerticalSpace(height: 2.h),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 5.5.h,
                width: 5.5.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorPath.containerBorderColor,
                ),
                child: CustomText(
                  align: TextAlign.center,
                  text: orText,
                  fontSize: 10.sp,
                  underline: false,
                  fontWeight: FontWeight.w500,
                  color: ColorPath.blackColor,
                ),
              ),
            ),
            VerticalSpace(height: 2.5.h),
            CustomText(
              align: TextAlign.start,
              text: bapsMember,
              fontSize: 11.sp,
              underline: false,
              fontFamily: interFont,
              fontWeight: FontWeight.w300,
              color: ColorPath.primaryColor,
              maxLine: 3,
            ),
            VerticalSpace(height: 2.h),
            /*ElevatedButton(
                  onPressed: () {
                    getIt<AppRouter>().push(LoginScreenRoute());
                    getIt<AppRouter>().pop();
                  },
                  style: OutlinedButton.styleFrom(
                      fixedSize: const Size(double.maxFinite, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.h))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        align: TextAlign.center,
                        text: signInSSO,
                        fontSize: 10.sp,
                        underline: false,
                        fontWeight: FontWeight.w500,
                        color: ColorPath.whiteColor,
                      ),
                      HorizontalSpace(width: 1.h),
                      SvgPicture.asset(IconPaths.rightWhiteIcon)
                    ],
                  ),
                ),*/
            ButtonIcon(
              onTap: () {
                setAnalyticData(nameLogin,<String, String>{});
                getIt<AppRouter>().push(LoginScreenRoute());
                getIt<AppRouter>().pop();
              },
              buttonName: signInSSO,
              buttonIcon: IconPaths.rightBrownIcon,
              borderColor: ColorPath.primaryButtonColor,
            ),
            VerticalSpace(height: 1.h),
          ],
        ),
    );

    /*return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 2.h),
      contentPadding: EdgeInsets.zero,
      backgroundColor: ColorPath.bottomNavBgColor,
      content:SingleChildScrollView(
      scrollDirection: Axis.vertical,
        child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.5.h),
          child: Column(
             mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () => getIt<AppRouter>().pop(),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    padding: EdgeInsets.all(1.h),
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorPath.primaryColor,
                    ),
                    child: SvgPicture.asset(IconPaths.removeCircleIcon),
                  ),
                ),
              ),
              VerticalSpace(height: 2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: emailHint,
                  fontSize: 10.0.sp,
                  underline: false,
                  fontFamily: interFont,
                  fontWeight: FontWeight.w300,
                  color: ColorPath.primaryColor,
                  maxLine: 3,
                  align: TextAlign.start,
                ),
              ),
              VerticalSpace(height: 3.h),//2
              *//*const CustomTextField(label: signInEmail),
              VerticalSpace(height: 1.5.h),*//*
              ElevatedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    backgroundColor: ColorPath.primaryButtonColor,
                    fixedSize: const Size(double.maxFinite, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.h))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: signInPhone,
                      fontSize: 10.sp,
                      underline: false,
                      fontWeight: FontWeight.w500,
                      color: ColorPath.whiteColor,
                      align: TextAlign.center,
                      maxLine: 1,
                      overflow:TextOverflow.ellipsis,
                    ),
                    HorizontalSpace(width: 1.h),
                    SvgPicture.asset(IconPaths.phoneRoundedIcon),
                    //const Icon(Icons.email_rounded)
                  ],
                ),
              ),
              VerticalSpace(height: 1.h),
              ElevatedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    backgroundColor: ColorPath.primaryButtonColor,
                    fixedSize: const Size(double.maxFinite, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.h))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: signInEmail,
                      fontSize: 10.sp,
                      underline: false,
                      fontWeight: FontWeight.w500,
                      color: ColorPath.whiteColor,
                      align: TextAlign.center,
                      maxLine: 1,
                      overflow:TextOverflow.ellipsis,
                    ),
                    HorizontalSpace(width: 1.h),
                    SvgPicture.asset(IconPaths.emailRoundedIcon),
                    //const Icon(Icons.email_rounded)
                  ],
                ),
              ),
              VerticalSpace(height: 2.h),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 5.5.h,
                  width: 5.5.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorPath.containerBorderColor,
                  ),
                  child: CustomText(
                    align: TextAlign.center,
                    text: orText,
                    fontSize: 10.sp,
                    underline: false,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.blackColor,
                  ),
                ),
              ),
              VerticalSpace(height: 2.h),
              CustomText(
                align: TextAlign.start,
                text: bapsMember,
                fontSize: 11.sp,
                underline: false,
                fontFamily: interFont,
                fontWeight: FontWeight.w300,
                color: ColorPath.primaryColor,
                maxLine: 3,
              ),
              VerticalSpace(height: 2.h),
              *//*ElevatedButton(
                onPressed: () {
                  getIt<AppRouter>().push(LoginScreenRoute());
                  getIt<AppRouter>().pop();
                },
                style: OutlinedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.h))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      align: TextAlign.center,
                      text: signInSSO,
                      fontSize: 10.sp,
                      underline: false,
                      fontWeight: FontWeight.w500,
                      color: ColorPath.whiteColor,
                    ),
                    HorizontalSpace(width: 1.h),
                    SvgPicture.asset(IconPaths.rightWhiteIcon)
                  ],
                ),
              ),*//*
              ButtonIcon(
                onTap: () {
                  getIt<AppRouter>().push(LoginScreenRoute());
                  getIt<AppRouter>().pop();
                },
                buttonName: signInSSO,
                buttonIcon: IconPaths.rightBrownIcon,
                borderColor: ColorPath.primaryButtonColor,
              ),
              VerticalSpace(height: 1.h),
            ],
          ),
        ),
      ),
    );*/
  }
}
