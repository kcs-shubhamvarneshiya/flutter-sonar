import 'dart:io';
import 'dart:math';

import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_bloc.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../service/remote_config.dart';
import 'colors.dart';
import 'constants.dart';
import 'iconpath.dart';

extension ConvertDateFormat on dynamic {
  String selectedDate(String dateTimeString,String oldFormat, String newFormat) {
    try{
      DateTime time = DateFormat(oldFormat).parse(dateTimeString);
      String selectedDate = DateFormat(newFormat).format(time);
      return selectedDate.toString();
    }on Exception{
      return dateTimeString;
    }
  }
}

extension ShowToastWidget on dynamic {
  get showToast => (String message) {
        return Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: ColorPath.primaryColor,
            textColor: ColorPath.primaryTextColor,
            fontSize: 16.0);
      };
}

extension ShowToast on SubmitFeedbackBloc {
  get showToastInternet => (String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: ColorPath.primaryColor,
        textColor: ColorPath.primaryTextColor,
        fontSize: 16.0);
  };
}

extension ShowSnackBarWidget on BuildContext {
  get customSnackBar =>
      (BuildContext context, String message, String actionMsg) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            message,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: ColorPath.primaryTextColor),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: ColorPath.primaryColor,
          behavior: SnackBarBehavior.floating,
          /*action: SnackBarAction(
            textColor: ColorPath.primaryTextColor,
            onPressed: () {},
            label: actionMsg.toUpperCase(),
          ),*/
        )
        );
      };
}

extension LaunchMap on Widget {
  get launchMapsUrl => (String urlData, double lat, double lon) async {
    final url = '$urlData$lat,$lon';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  };
}

extension UrlLaunch on Widget {
  get urlLaunch=>(String path) async {
    if (await canLaunchUrlString(path)) {
      await launchUrlString(path, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $path';
    }
  };
}

extension CapitalizeLetter on BuildContext{
  String capitalizeOnlyFirstLater(String type) {
    if (type.trim().isEmpty) return "";
    return "${type[0].toUpperCase()}${type.substring(1).toLowerCase()}";
  }
}
extension CheckFilePath on State {
  Future<bool> checkPath() async {
    final directory = await getApplicationDocumentsDirectory();
    String savePath = '${directory.path}/${Constant.jsonAppContentFileName}';
    bool exist = await File(savePath).exists();
    return exist;
  }
}

extension SetFirebaseAnalytics on dynamic{
   /*setAnalytics(String name, String type, String paramName) {
    FirebaseAnalytics.instance.logEvent(
      name: name,
      parameters: {
        'type': type,
        'name': paramName,
      },
    );
  }*/
   setAnalyticData(String name, Map<String, dynamic>? paramMap) {
     FirebaseAnalytics.instance.logEvent(
       name: name,
       parameters: paramMap,
     );
   }

}

extension DateFormatter on DateTime?{
  String getVerboseDateTimeRepresentation() {
    if(this==null){
      return "Something went wrong.";
    }
    DateTime now = DateTime.now();
    DateTime justNow = now.subtract(const Duration(minutes: 1));
    DateTime localDateTime = this!.toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return "Just now";
    }

    String roughTimeString = DateFormat('jm').format(this!);

    if (localDateTime.day == now.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return roughTimeString;
    }

    DateTime yesterday = now.subtract(const Duration(days: 1));
    if (localDateTime.day == yesterday.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return "Yesterday";
    }

    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE').format(localDateTime);
      return '$weekday, $roughTimeString';
    }

    return '${DateFormat('yMd').format(this!)}, $roughTimeString';
  }
}

extension TimeFormatting on double {
  String getTimeStringFromDouble() {
    if (this < 0) return 'Invalid Value';
    int flooredValue = floor();
    double decimalValue = this - flooredValue;
    String hourValue = flooredValue.getHourString();
    String minuteString = decimalValue.getMinuteString();
    DateTime time = DateFormat(Constant.WEB_DATE_FORMAT).parse('$hourValue.$minuteString');
    String selectedDate = DateFormat(Constant.DISPLAY_POST_DATE).format(time);
    return selectedDate.toString();
  }
}

extension MinuteFormatting on double {
  String getMinuteString() {
    return '${(this * 60).toInt()}'.padLeft(2, '0');
  }
}

extension HourFormatting on int {
  String getHourString() {
    return '${this % 24}'.padLeft(2, '0');
  }
}

//Email validation
extension FiledValidation on dynamic {
  String? validateEmail(String value){
    String? msg;
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      msg = validEmailMsg;
    } else {
      msg = null;
    }
    return msg;
  }
}

extension RandomVideoUrl on dynamic {
  String getVideoUrl(RemoteConfig remoteConfig) {
    var videoUrl = remoteConfig.videoConfig.urls;
    List<String> videoList = videoUrl.map((url) => url.toString()).toList();
    //List<String> videoList = IconPaths().homeVideoUrl;
    Random random = Random();
    int randomIndex = random.nextInt(videoList.length);
    String randomVideo = videoList[randomIndex];
    print("Random String: $randomVideo");
    return randomVideo;
  }
}