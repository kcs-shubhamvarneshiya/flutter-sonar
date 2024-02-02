import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';
import '../utils/iconpath.dart';
import '../utils/strings.dart';
import 'custom_text.dart';

class NotificationContainer extends StatelessWidget{
  const NotificationContainer({Key? key,
    required this.notificationLst,
    required this.isLongPressSelected})
      : super(key: key);

  final NotificationLog notificationLst;
  final bool isLongPressSelected;

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (notificationLst.isSelected) ||(!notificationLst.isRead!)
              ? ColorPath.notificationSelectedBg
              : Colors.transparent,
          border: Border.all(color: ColorPath.secondaryBrownColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          notificationLst.isSelected
              ? Container(
            padding: EdgeInsets.only(right: 0.8.h),
            child: SvgPicture.asset(IconPaths.checkNotificationIcon),
          )
              : Container(width: (isLongPressSelected ? 3.2.h : 0)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: notificationLst.title.toString(),
                        fontSize: 13.sp,
                        underline: false,
                        fontFamily: interFont,
                        fontWeight: notificationLst.isRead!
                            ? FontWeight.w400
                            : FontWeight.w600,
                        color: ColorPath.primaryColor,
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: CustomText(
                        text: toDate(notificationLst.date.toString())
                            .getVerboseDateTimeRepresentation(),
                        fontSize: 11.sp,
                        underline: false,
                        fontFamily: interFont,
                        fontWeight: FontWeight.w300,
                        color: ColorPath.primaryColor,
                        maxLine: 1,
                      ),
                    ),
                  ],
                ),
                VerticalSpace(height: 0.5.h),
                CustomText(
                  text: '${notificationLst.body}',
                  fontSize: 11.sp,
                  underline: false,
                  fontFamily: interFont,
                  fontWeight: FontWeight.w300,
                  color: ColorPath.notificationText,
                  maxLine: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DateTime? toDate(String? stringdate) {
    DateTime dt = DateTime.parse(stringdate!);
    return dt;
  }
}
