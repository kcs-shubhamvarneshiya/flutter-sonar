import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle customTextStyle(
    FontWeight weight,
    String? fontFamily,
    double fontSize,
    Color color,
    bool? underLine,
    double? letterSpacing,
    double? height,
  ) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontFamily: fontFamily,
      fontWeight: weight,
      fontSize: fontSize,
      decoration:underLine == false ? TextDecoration.none : TextDecoration.underline,
      color: color,
      letterSpacing: letterSpacing,
      height: height != 0.0 ? height : 0.0
    );
  }
}
