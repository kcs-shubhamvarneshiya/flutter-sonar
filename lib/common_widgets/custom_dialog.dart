import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../router_page/app_router.dart';
import '../utils/colors.dart';
import '../utils/iconpath.dart';
import '../utils/strings.dart';
import 'custom_text.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.onTapNo,
    this.isVideoPlay = false,
    this.isNotification = false,
  }) : super(key: key);

  final String title;
  final String description;
  final bool isVideoPlay;
  final Function() onTap;
  final Function() onTapNo;
  final bool isNotification;



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.5.h),
      contentPadding: EdgeInsets.zero,
      backgroundColor: ColorPath.activityBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.5.h),
          child: ListBody(
            children: [
              VerticalSpace(height: 1.h),
              Visibility(
                visible:!isNotification,
                child: CustomText(
                  text: title,
                  fontSize: 14.sp,
                  underline: false,
                  fontWeight: FontWeight.w400,
                  color: ColorPath.primaryColor,
                  align: TextAlign.center,
                  fontFamily: addingTonFont,
                ),
              ),
              const VerticalSpace(height: 10),
              CustomText(
                text: description,
                fontSize: isNotification ? 14.sp : 10.sp,
                underline: false,
                fontWeight: FontWeight.w400,
                color: ColorPath.primaryColor,
                align: TextAlign.center,
                maxLine: 4,
                fontFamily: interFont,
              ),
              VerticalSpace(height: 3.h),
              isVideoPlay
                  ? ButtonIcon(
                      onTap: () {
                        getIt<AppRouter>().pop();
                      },
                      buttonName: okText,
                      buttonIcon: IconPaths.checkWhiteCircleIcon,
                      color: ColorPath.primaryButtonColor,
                      textColor: ColorPath.whiteColor,
                      borderColor: ColorPath.primaryButtonColor,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonIcon(
                          key: const Key('isVideoNotButton'),
                          onTap:onTapNo,
                          buttonName: noText,
                          buttonIcon: IconPaths.removeCircleIcon,
                          color: ColorPath.primaryButtonColor,
                          textColor: ColorPath.whiteColor,
                          borderColor: ColorPath.primaryButtonColor,
                        ),
                        HorizontalSpace(width: 3.5.h),
                        ButtonIcon(
                          onTap: onTap,
                          buttonName: yesText,
                          buttonIcon: IconPaths.checkWhiteCircleIcon,
                          color: ColorPath.secondaryButtonColor,
                          textColor: ColorPath.whiteColor,
                          borderColor: ColorPath.secondaryButtonColor,
                        ),
                      ],
                    ),
              VerticalSpace(height: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
