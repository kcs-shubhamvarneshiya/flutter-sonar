import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../utils/iconpath.dart';

class MyTour extends StatelessWidget {
  const MyTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: myTour.toUpperCase(),
                  fontSize: 15.sp,
                  underline: false,
                  fontWeight: FontWeight.w400,
                  fontFamily: addingTonFont,
                  color: ColorPath.primaryColor,
                  maxLine: 5,
                  letterSpacing: 2,
                ),
                GestureDetector(
                  key: const Key('more_tours'),
                  onTap: () {},
                  child: CustomText(
                    text: viewMore,
                    fontSize: 10.sp,
                    underline: false,
                    fontFamily: interFont,
                    fontWeight: FontWeight.w400,
                    color: ColorPath.redColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(2.h),
            decoration: BoxDecoration(
              color: ColorPath.tourSubContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 24.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.h),
                      topRight: Radius.circular(2.h),
                    ),
                    child:FadeInImage(
                      image: AssetImage(IconPaths.swamiNarayanImage),
                      placeholder: AssetImage(IconPaths.swamiNarayanImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.5.h,
                    vertical: 1.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorPath.homeBgColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    border: Border.all(color: ColorPath.tourSubContainer),
                  ),
                  child: Column(
                    children: [
                      Material(
                        child: ListTile(
                          leading: SvgPicture.asset(IconPaths.watchIcon),
                          title: CustomText(
                            text: tourTime,
                            fontSize: 14.sp,
                            underline: false,
                            fontWeight: FontWeight.w300,
                            fontFamily: addingTonFont,
                            color: ColorPath.primaryColor,
                            maxLine: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      VerticalSpace(height: 2.h),
                      ButtonIcon(
                        onTap: () {},
                        buttonName: viewTour,
                        buttonIcon: IconPaths.rightWhiteIcon,
                        color: ColorPath.primaryButtonColor,
                        textColor: ColorPath.whiteColor,
                          borderColor: ColorPath.primaryButtonColor
                      ),
                      VerticalSpace(height: 1.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
