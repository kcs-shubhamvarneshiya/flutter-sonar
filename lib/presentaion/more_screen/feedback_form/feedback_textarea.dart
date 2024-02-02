// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_textfield.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FeedbackTextArea extends StatelessWidget {
  FeedbackTextArea({
    Key? key,
    this.fieldName,
    this.isRequired = false,
    this.hintText,
    required this.controller,
  }) : super(key: key);
  String? fieldName;
  String? hintText;
  bool isRequired;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              text: fieldName,
              color: ColorPath.primaryColor,
              fontFamily: interFont,
              fontSize: 11.sp,
              maxLine: 2,
              fontWeight: FontWeight.w400,
              underline: false,
            ),
            HorizontalSpace(width: .5.h),
            CustomText(
              text: isRequired ? requiredText : optionalText,
              color: isRequired ? ColorPath.notificationBadge : ColorPath.primaryColor,
              fontFamily: interFont,
              fontSize: 10.sp,
              maxLine: 2,
              fontWeight: FontWeight.w400,
              underline: false,
            ),
          ],
        ),
        VerticalSpace(height: 1.5.h),
        CustomTextField(
          controller: controller,
          label: hintText,
          isMulti: true,
          borderColor: ColorPath.primaryButtonColor.withOpacity(.5),
          enabledBorderColor: ColorPath.primaryButtonColor.withOpacity(.5),
          focusBorderColor: ColorPath.primaryButtonColor.withOpacity(.5),
          onChanged: (value) {},
          validator: (value) => isRequired
              ? value!.isEmpty
              ? requiredField
              : null
              : null,
          isTextArea: true,
        ),
        VerticalSpace(height: 1.5.h),
      ],
    );
  }
}
