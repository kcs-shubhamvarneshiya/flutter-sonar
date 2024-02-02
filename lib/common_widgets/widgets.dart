import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../utils/iconpath.dart';
import 'custom_text.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    super.key,
    required this.onTap,
    required this.buttonName,
    required this.buttonIcon,
    this.textDirection = TextDirection.rtl,
    this.color = Colors.transparent,
    this.textColor = ColorPath.primaryButtonColor,
    required this.borderColor,
  });

  final Function() onTap;
  final String buttonName;
  final String buttonIcon;
  final TextDirection textDirection;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(color: borderColor!),
          padding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 1.5.h),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onTap,
        icon: SvgPicture.asset(buttonIcon),
        label: CustomText(
          text: buttonName,
          fontFamily: interFont,
          fontSize: 11.sp,
          underline: false,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}

class RoundedBorderButton extends StatelessWidget {
  const RoundedBorderButton(
      {Key? key,
      required this.onTap,
      required this.buttonName,
      this.buttonIcon,
      this.textDirection,
      this.color,
      this.textColor,
      this.borderColor})
      : super(key: key);
  final Function() onTap;
  final String buttonName;
  final String? buttonIcon;
  final TextDirection? textDirection;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: ColorPath.primaryButtonColor),
        fixedSize: Size(double.maxFinite, 6.h),
      ),
      onPressed: onTap,
      child: CustomText(
        align: TextAlign.center,
        text: buttonName,
        color: ColorPath.primaryButtonColor,
        fontFamily: interFont,
        fontSize: 12.sp,
        maxLine: 2,
        fontWeight: FontWeight.w600,
        underline: false,
      ),
    );
  }
}

class ButtonIconDialog extends StatelessWidget {
  const ButtonIconDialog({
    super.key,
    required this.onTap,
    required this.buttonName,
    required this.buttonIcon,
  });

  final Function() onTap;
  final String buttonName;
  final String buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: OutlinedButton.icon(
        onPressed: onTap,
        label: CustomText(
          text: buttonName,
          fontSize: 12.sp,
          underline: false,
          fontWeight: FontWeight.w500,
          color: ColorPath.commonTextColor,
          fontFamily: interFont,
        ),
        icon: SvgPicture.asset(buttonIcon),
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(double.infinity, 40),
          side: const BorderSide(color: ColorPath.primaryButtonColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.imageName,
    this.onTap,
  });

  final String imageName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorPath.primaryColor,
        ),
        child: SvgPicture.asset(imageName),
      ),
    );
  }
}

//Attraction Details screen widgets
class WidgetContainer extends StatelessWidget {
  const WidgetContainer({super.key, this.widget, this.color = ColorPath.primaryButtonColor});

  final Widget? widget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 5.5.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color!),
      ),
      child: Center(child: widget),
    );
  }
}

class DayTimeWidget extends StatelessWidget {
  const DayTimeWidget(
      {super.key,
      required this.day,
      required this.startTime,
      this.endTime,
      this.type});

  final String day;
  final String startTime;
  final String? endTime;
  final bool? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      transform: Matrix4.translationValues(0.0, -10, 0.0),
      child: Container(
        padding: EdgeInsets.all(1.5.h),
        height: 11.h,
        width: 27.w,
        decoration: BoxDecoration(
          //color: type == true ? ColorPath.hoursContainer : ColorPath.buttonOutlineColor,
          color: type == true ? ColorPath.hoursContainer : ColorPath.dayTimeBackColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: type== true ? dayText:day,
                fontSize: 10.4.sp,
                underline: false,
                fontFamily: interFont,
                fontWeight: FontWeight.w400,
                color: ColorPath.whiteColor,
                maxLine: 1,
              ),
              VerticalSpace(height: 1.h),
              type == true ? CustomText(
                text: closed,
                fontSize: 11.sp,
                underline: false,
                fontFamily: interFont,
                fontWeight: FontWeight.w600,
                color: ColorPath.whiteColor,
                maxLine: 1,
              ) :Column(
                children: [
                  CustomText(
                    text: startTime,
                    fontSize: 11.sp,
                    underline: false,
                    fontFamily: interFont,
                    fontWeight: FontWeight.w600,
                    color: ColorPath.whiteColor,
                    maxLine: 1,
                  ),
                  VerticalSpace(height: .5.h),
                  CustomText(
                    text: endTime,
                    fontSize: 11.sp,
                    underline: false,
                    fontFamily: interFont,
                    fontWeight: FontWeight.w600,
                    color: ColorPath.whiteColor,
                    maxLine: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyAartiWidget extends StatelessWidget {
  const DailyAartiWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(1.5.h),
      decoration: BoxDecoration(
        color: ColorPath.announcementContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: dailyText,
            fontSize: 12.sp,
            underline: false,
            fontFamily: interFont,
            fontWeight: FontWeight.w400,
            color: ColorPath.whiteColor,
            maxLine: 1,
          ),
          VerticalSpace(height: 1.h),
          CustomText(
            text: dailyTime,
            fontSize: 12.sp,
            underline: false,
            fontFamily: interFont,
            fontWeight: FontWeight.w600,
            color: ColorPath.whiteColor,
            maxLine: 1,
          ),
        ],
      ),
    );
  }
}

class MapTabButton extends StatelessWidget {
  const MapTabButton({
    super.key,
    required this.onTapList,
    required this.onTapMap,
    required this.isList,
    required this.isMap,
    this.color = Colors.transparent
  });

  final Function() onTapList;
  final Function() onTapMap;
  final bool isList;
  final bool isMap;
  final Color? color;

  @override
  Widget build(BuildContext context){
    return Container(
      width: 140,
      height: 50,
      decoration: BoxDecoration(
          color: ColorPath.blackColor,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(0.5.h),child:  Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            //width: 62,
            height: 40,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isList ? ColorPath.whiteColor:Colors.transparent,
            ),

              child: GestureDetector(
                onTap:onTapList,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: listTab,
                      fontSize: 11.sp,
                      underline: false,
                      fontFamily: interFont,
                      fontWeight: FontWeight.w400,
                      color: isList? ColorPath.blackColor:ColorPath.whiteColor,
                    ),
                    HorizontalSpace(width: 2.w),
                    Expanded(child: SvgPicture.asset(isList ? IconPaths.activeListIcon:IconPaths.inActiveListIcon))
                  ],
                ),
              ),
            ),
        ),

      const SizedBox(width: 5,),

       Expanded(
         flex: 5,
         child: Container(
          //width: 62,
          height: 40,
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isMap ? ColorPath.whiteColor:Colors.transparent,
          ),

           child: GestureDetector(
            onTap:onTapMap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                    text: mapTab,
                    fontSize: 11.sp,
                    underline: false,
                    fontFamily: interFont,
                    fontWeight: FontWeight.w400,
                    color: isMap ? ColorPath.blackColor:ColorPath.whiteColor
                ),
                HorizontalSpace(width: 2.w),
                Expanded(child: SvgPicture.asset(isMap ? IconPaths.activeMapIcons:IconPaths.inActiveMapIcon))
              ],
            ),
          )
    ),
       ),

      ],
    ),
    );
  }
}
