import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';
import '../utils/iconpath.dart';
import '../utils/strings.dart';
import 'custom_text.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.imageName,
    this.btnTitle = '',
    required this.description,
    required this.onTap,
    this.isNotification=false
  });

  final String imageName;
  final String btnTitle;
  final String description;
  final bool isNotification;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(imageName),
          ),
          Padding(
            padding: EdgeInsets.all(3.5.h),
            child: CustomText(
              text: description,
              fontSize: 15.sp,
              underline: false,
              fontWeight: FontWeight.w300,
              fontFamily: addingTonFont,
              color: ColorPath.primaryColor,
              maxLine: 8,
              align: TextAlign.center,
            ),
          ),
          !isNotification ? Container(
            padding: EdgeInsets.symmetric(horizontal: 3.5.h),
            width: double.infinity,
            child: RoundedBorderButton(
              onTap:onTap,
              buttonName: btnTitle,
              buttonIcon: IconPaths.addIconButton,
              color: ColorPath.bottomNavSelectedItemColor,
              borderColor: ColorPath.bottomNavSelectedItemColor,
              textColor: ColorPath.whiteColor,
            ),
          ):Container(),
          VerticalSpace(height: 10.h),
        ],
      ),
    );
  }
}
