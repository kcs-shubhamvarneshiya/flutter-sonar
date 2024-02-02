import 'package:akdmvisitorsapp/common_widgets/custom_textstyle.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? obSecure;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final Color borderColor;
  final Color enabledBorderColor;
  final Color focusBorderColor;
  final bool isTextArea;

  const CustomTextField({
    Key? key,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obSecure = false,
    this.onTap,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.errorText,
    this.label,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.onEditingCompleted,
    this.onChanged,
    this.borderColor = ColorPath.primaryButtonColor,
    this.enabledBorderColor = ColorPath.primaryButtonColor,
    this.focusBorderColor = ColorPath.primaryButtonColor,
    this.isTextArea=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: ColorPath.primaryButtonColor,
        onEditingComplete: onEditingCompleted,
        autofocus: autofocus,
        minLines: isMulti ? 10 : 1,
        maxLines: isMulti ? null : 1,
        onTap: onTap,
        enabled: enabled,
        readOnly: readOnly!,
        obscureText: obSecure!,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: label,
          fillColor: ColorPath.primaryButtonColor.withOpacity(.05),
          filled: true,
          hintStyle: CustomTextStyle.customTextStyle(
              FontWeight.w500, interFont, 10.sp, ColorPath.primaryColor, false, 0.0,0.0),
          contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.h),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.h),
            borderSide: BorderSide(color: enabledBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.h),
            borderSide: BorderSide(color: focusBorderColor),
          ),
        ),
        validator: validator,
          maxLength: isTextArea?2000:40
      ),
    );
  }
}
