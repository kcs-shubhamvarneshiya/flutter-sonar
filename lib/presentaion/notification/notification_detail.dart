import 'dart:convert';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../model/notification/notification.dart';
import '../../router_page/app_router.dart';
import '../../utils/colors.dart';
import '../../utils/iconpath.dart';
import '../../utils/strings.dart';

@RoutePage()
class NotificationDetail extends StatefulWidget {
  NotificationDetail({Key? key, required this.notificationData})
      : super(key: key);
  NotificationLog notificationData;

  @override
  State<NotificationDetail> createState() => _NotificationDetail();
}

class _NotificationDetail extends State<NotificationDetail> {
  late InAppWebViewController _webViewController;

  @override
  initState(){
    super.initState();
    updateNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(isNotification: false),
        backgroundColor: ColorPath.bottomNavBgColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              VerticalSpace(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () => getIt<AppRouter>().pop(),
                      child: SvgPicture.asset(IconPaths.leftBackArrowIcon)),
                  HorizontalSpace(width: 1.5.h),
                  CustomText(
                    text: notificationBackTitle,
                    fontSize: 20.sp,
                    underline: false,
                    fontFamily: addingTonFont,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.primaryColor,
                    maxLine: 1,
                    overflow: TextOverflow.ellipsis,
                    align: TextAlign.center,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: CustomText(
                        text:toDate(widget.notificationData.date.toString()).getVerboseDateTimeRepresentation(),
                        fontSize: 11.sp,
                        underline: false,
                        fontFamily: interFont,
                        fontWeight: FontWeight.w300,
                        color: ColorPath.primaryColor,
                        maxLine: 1,
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSpace(height: 4.h),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .76,
                padding: EdgeInsets.only(left: 0.5.h, right: 0.5.h, top: 1.5.h, bottom: 1.5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorPath.secondaryBrownColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1.h, right: 1.h),
                      child: CustomText(
                        text: widget.notificationData.title,
                        fontSize: 14.sp,
                        underline: false,
                        fontFamily: interFont,
                        fontWeight: FontWeight.w600,
                        color: ColorPath.primaryColor,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    VerticalSpace(height: 1.h),
                    /*CustomText(
                      text: '${widget.notificationData.body}',
                      fontSize: 11.sp,
                      underline: false,
                      fontFamily: addingTonFont,
                      fontWeight: FontWeight.w300,
                      color: ColorPath.notificationText,
                    ),*/
                    /*Expanded(
                      child: Html(
                        data:widget.notificationData.previewBody,
                       */ /* style:{
                          'h1': Style(fontSize: FontSize.large),
                          'strong': Style(fontWeight: FontWeight.bold),
                        },*/ /*
                        onLinkTap: (url, attributes, element) async {
                          if(await canLaunchUrlString(url!)) {
                          await launchUrlString(url, mode: LaunchMode.externalApplication);
                          } else {
                          throw 'Could not launch $url';
                          }
                        },
                      ),
                    ),*/

                    Expanded(
                      child: InAppWebView(
                        initialUrlRequest: URLRequest(
                            url: Uri.parse(Uri.dataFromString(
                          widget.notificationData.previewBody.toString(),
                          mimeType: 'text/html',
                          encoding: Encoding.getByName('utf-8'),
                        ).toString())),
                        initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                            useShouldOverrideUrlLoading: true,
                            transparentBackground: true,
                            supportZoom: true,
                            verticalScrollBarEnabled: false,
                          ),
                        ),
                        onWebViewCreated: (InAppWebViewController controller) {
                          _webViewController = controller;
                        },
                        androidOnPermissionRequest:
                            (controller, origin, resources) async {
                          return PermissionRequestResponse(
                              resources: resources,
                              action: PermissionRequestResponseAction.GRANT);
                        },
                        shouldOverrideUrlLoading:
                            (controller, navigationAction) async {
                          var uri = navigationAction.request.url!;
                          if (["http",
                            "https",
                            "file",
                            "chrome",
                            "data",
                            "javascript",
                            "about"
                          ].contains(uri.scheme)) {
                            if (await canLaunchUrlString(
                                navigationAction.request.url.toString())) {
                              await launchUrlString(
                                  navigationAction.request.url.toString(),
                                  mode: LaunchMode.externalApplication);
                              return NavigationActionPolicy.CANCEL;
                            } else {
                              throw 'Could not launch';
                            }
                          }
                          return NavigationActionPolicy.ALLOW;
                        },
                        onLoadStop: (controller, url) {
                          setState(() {});
                        },
                        onLoadError: (controller, url, code, message) {
                          print("code ${code}: ${url}:${message}");
                        },
                        onLoadHttpError:
                            (controller, url, statusCode, description) {},
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpace(height: 1.h),
            ],
          ),
        ));
  }

  DateTime? toDate(String? stringdate) {
    DateTime dt = DateTime.parse(stringdate!);
    return dt;
  }

  Future<void> updateNotification() async {
    SharedPreferences? sharedPreferences = getIt<SharedPreferences>();
    List? listString = sharedPreferences.getStringList(notificationList);
    List<NotificationLog> oldList = listString!
        .map((item) => NotificationLog.fromJson(json.decode(item)))
        .toList();
    int index = oldList.indexWhere(
        (element) => element.id == widget.notificationData.id.toString());
    oldList[index].isRead = true;
    List<String> updatedList =
        oldList.map((item) => jsonEncode(item.toJson())).toList();
    sharedPreferences.setStringList(notificationList, updatedList);
  }
}
