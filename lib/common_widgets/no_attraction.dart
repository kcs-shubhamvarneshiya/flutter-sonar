import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../utils/iconpath.dart';

class NoAttractionScreen extends StatelessWidget {
  const NoAttractionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Image.asset(IconPaths.noAttractionImage),
        ),
        Padding(
          padding: EdgeInsets.all(3.5.h),
          child: CustomText(
            align: TextAlign.center,
            text: noAttraction,
            fontSize: 21.sp,
            underline: false,
            fontWeight: FontWeight.w300,
            fontFamily: addingTonFont,
            color: ColorPath.primaryColor,
            maxLine: 5,
          ),
        ),
      ],
    );
  }
}
