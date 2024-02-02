import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_textstyle.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextAlign? align;
  final bool? underline;
  final TextOverflow? overflow;
  final int? maxLine;
  final String? fontFamily;
  final double? letterSpacing;
  final double? lineHeight;

  const CustomText({
    super.key,
    @required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.color,
    this.align,
    this.underline,
    this.overflow,
    this.maxLine,
    this.letterSpacing,
    this.lineHeight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: align,
      overflow: overflow,
      style: CustomTextStyle.customTextStyle(
        fontWeight!,
        fontFamily,
        fontSize!,
        color!,
        underline,
        letterSpacing,
          lineHeight
      ),
      maxLines: maxLine,
    );
  }
}
