// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/feedback/feedback_form.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_widgets/custom_textstyle.dart';

class FeedbackDropdown extends StatelessWidget {
  FeedbackDropdown({Key? key, this.press, required this.fields}) : super(key: key);
  final Function? press;
  final Fields fields;

  Widget? dropdownWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              text: fields.fieldName,
              color: ColorPath.primaryColor,
              fontFamily: interFont,
              fontSize: 11.sp,
              maxLine: 2,
              fontWeight: FontWeight.w400,
              underline: false,
            ),
            HorizontalSpace(width: .5.h),
            CustomText(
              text: fields.required! ? requiredText : optionalText,
              color: fields.required! ? ColorPath.notificationBadge : ColorPath.primaryColor,
              fontFamily: interFont,
              fontSize: 10.sp,
              maxLine: 2,
              fontWeight: FontWeight.w400,
              underline: false,
            ),
          ],
        ),
        VerticalSpace(height: 1.5.h),
        DropdownButtonFormField(
          //dropdownColor: ColorPath.redColor50,
          dropdownColor: ColorPath.containerBorderColor,
          hint: CustomText(
            text: select,
            color: ColorPath.primaryColor,
            fontFamily: interFont,
            fontSize: 11.sp,
            maxLine: 2,
            fontWeight: FontWeight.w400,
            underline: false,
          ),
          validator: (value) {
            if (fields.required!) {
              if (value == null) {
                return requiredField;
              }
              return null;
            } else {
              return null;
            }
          },
          //icon: SvgPicture.asset(IconPaths.dropdownIcon),
          icon:const Icon(Icons.arrow_drop_down_circle_outlined,color: ColorPath.primaryButtonColor,),
          decoration: InputDecoration(
            fillColor: ColorPath.primaryButtonColor.withOpacity(.05),
            filled: true,
            hintStyle: CustomTextStyle.customTextStyle(
                FontWeight.w500, interFont, 13.sp, ColorPath.primaryColor, false, 0.0,0.0),
            contentPadding: EdgeInsets.symmetric(horizontal: 1.3.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.h),
              borderSide: BorderSide(color: ColorPath.primaryButtonColor.withOpacity(.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.h),
              borderSide: BorderSide(color: ColorPath.primaryButtonColor.withOpacity(.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.h),
              borderSide: BorderSide(color: ColorPath.primaryButtonColor.withOpacity(.5)),
            ),
          ),
          onChanged: (value) {
            press!(value);
          },
          items: fields.options!.map((item) {
            return DropdownMenuItem(
              value: item.value.toString(),
              child: CustomText(
                text: item.value.toString(),
                color: ColorPath.primaryColor,
                fontFamily: interFont,
                fontSize: 11.sp,
                maxLine: 2,
                fontWeight: FontWeight.w400,
                underline: false,
              ),
            );
          }).toList(),
        ),
        VerticalSpace(height: 2.h),
      ],
    );
  }
}
