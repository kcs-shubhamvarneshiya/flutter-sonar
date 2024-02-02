import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../router_page/app_router.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import 'custom_text.dart';

class CommonDialog extends StatelessWidget {
   const CommonDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap
  }) : super(key: key);
  final String title;
  final String description;
  final Function onTap;

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title:CustomText(
        text: title,
        fontSize: 16,
        underline: false,
        fontWeight: FontWeight.w500,
        color: ColorPath.primaryColor,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            CustomText(
              text: description,
              fontSize: 11.sp,
              underline: false,
              fontWeight: FontWeight.w500,
              color: ColorPath.primaryColor,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          //onPressed: () => onYesPressed(),
          onPressed: () {
            onTap ();
            getIt<AppRouter>().pop();
          },
          child: CustomText(
            text: okText,
            fontSize: 12.sp,
            underline: false,
            fontWeight: FontWeight.w500,
            color: ColorPath.primaryColor,
          ),
        ),
      ],
    );
  }
}