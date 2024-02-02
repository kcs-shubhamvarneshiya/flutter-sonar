import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_textstyle.dart';

class CustomSectionTitle extends StatelessWidget {
  final String? text;
  final int? maxLines;

  const CustomSectionTitle({
    super.key,
    @required this.text,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 2.h),
      child: Text(
        text!.toUpperCase(),
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: CustomTextStyle.customTextStyle(
          FontWeight.w500,
          addingTonFont,
          15.sp,
          ColorPath.primaryColor,
          false,
          3.0,
          0.0
        ),
        maxLines: (maxLines != null) ? maxLines : 1,
      ),
    );
  }
}
