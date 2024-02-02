import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/iconpath.dart';
import '../utils/strings.dart';
import 'custom_text.dart';

class WebViewMessageScreen extends StatelessWidget {
  const WebViewMessageScreen({
    Key? key,
    required this.description,
    required this.onTap
  }) : super(key: key);

  final String description;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            IconPaths.handImage,
            height: 250.0,
            width: 250.0,
          ),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CustomText(
            text: description,
            fontSize: 18,
            underline: false,
            fontWeight: FontWeight.w500,
            color: ColorPath.primaryColor,
            fontFamily: interFont,
          ),
        ),
        ElevatedButton(
          onPressed:onTap,
          style: ElevatedButton.styleFrom(
            foregroundColor: ColorPath.primaryColor,
            backgroundColor: ColorPath.visitContainer,
            textStyle: const TextStyle(
                color: ColorPath.primaryColor, fontSize: 14, fontStyle: FontStyle.normal,),
          ),
          child: const Text(tryAgainMessage),
        ),
      ],
    );
  }
}
