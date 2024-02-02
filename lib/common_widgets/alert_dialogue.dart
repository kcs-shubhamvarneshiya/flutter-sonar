// ignore_for_file: must_be_immutable
import 'dart:async';
import 'dart:io';

import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class AlertDialogWidget extends StatelessWidget {
  AlertDialogWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.index,
    required this.controller,
    required this.onYesPressed,
    required this.onNoPressed,
  }) : super(key: key);
  final String title;
  final String description;

  final int index;
  PageController controller;
  Function onYesPressed;
  Function onNoPressed;
  ValueNotifier<int> dialogTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPath.primaryColor,
      body: ValueListenableBuilder(
        valueListenable: dialogTrigger,
        builder: (ctx, value, child) {
          Future.delayed(
            const Duration(seconds: 0),
            () {
              showDialog(
                barrierDismissible: false,
                barrierColor: ColorPath.primaryColor,
                context: ctx,
                builder: (ctx) {
                  return Platform.isAndroid
                      ? AndroidAlert(
                          index: index,
                          title: title,
                          description: description,
                          controller: controller,
                          onYesPressed: () => onYesPressed(),
                          onNoPressed: () => onNoPressed(),
                        )
                      : IosAlert(
                          index: index,
                          title: title,
                          description: description,
                          controller: controller,
                          onYesPressed: () => onYesPressed(),
                          onNoPressed: () => onNoPressed(),
                        );
                },
              );
            },
          );

          return const SizedBox();
        },
      ),
    );
  }
}

class AndroidAlert extends StatelessWidget {
  AndroidAlert({
    Key? key,
    required this.index,
    required this.title,
    required this.description,
    required this.controller,
    required this.onYesPressed,
    required this.onNoPressed,
  }) : super(key: key);
  final int index;
  final String title;
  final String description;
  PageController controller = PageController(initialPage: 0);

  final Function onYesPressed;
  final Function onNoPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(
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
              fontSize: 13,
              underline: false,
              fontWeight: FontWeight.w500,
              color: ColorPath.primaryColor,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => onNoPressed(),
          child: const CustomText(
            text: noText,
            fontSize: 14,
            underline: false,
            fontWeight: FontWeight.w500,
            color: ColorPath.primaryColor,
          ),
        ),
        TextButton(
          onPressed: () => onYesPressed(),
          child: const CustomText(
            text: yesText,
            fontSize: 16,
            underline: false,
            fontWeight: FontWeight.w500,
            color: ColorPath.primaryColor,
          ),
        ),
      ],
    );
  }
}

class IosAlert extends StatelessWidget {
  IosAlert({
    Key? key,
    required this.index,
    required this.title,
    required this.description,
    required this.controller,
    required this.onYesPressed,
    required this.onNoPressed,
  }) : super(key: key);
  final int index;
  final String title;
  final String description;
  Function onYesPressed;
  Function onNoPressed;
  PageController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(description),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => onNoPressed(),
          child: const CustomText(
            text: noText,
            fontSize: 14,
            underline: false,
            fontWeight: FontWeight.w500,
            color: ColorPath.primaryColor,
          ),
        ),
        TextButton(
          onPressed: () => onYesPressed(),
          child: const CustomText(
            text: yesText,
            fontSize: 16,
            underline: false,
            fontWeight: FontWeight.w500,
            color: ColorPath.primaryColor,
          ),
        ),
      ],
    );
  }
}
