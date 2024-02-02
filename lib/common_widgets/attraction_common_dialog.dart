//custom_alert_dialog.dart
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../main.dart';
import '../model/attraction/attraction.dart';
import '../router_page/app_router.dart';
import '../utils/colors.dart';
import '../utils/enums.dart';
import '../utils/iconpath.dart';
import '../utils/strings.dart';
import 'custom_text.dart';
import 'fancyShimmerCachedImage.dart';

class AttractionTypeCommonDialog extends StatelessWidget {
  AttractionTypeCommonDialog(
      {Key? key,
      this.attraction,
      this.attractionList,
      this.startNavigationCallback,
      this.estimatedTime,
      this.buildContext})
      : super(key: key);
  Attraction? attraction;
  List<Attraction>? attractionList;
  final VoidCallback? startNavigationCallback;
  final double? estimatedTime;
  final BuildContext? buildContext;
  bool getAttractionType() {
    bool attractionType = false;
    if (attraction!.attractionType.toString().toLowerCase() ==
            UtilityAttractionType.parking.name.toLowerCase() ||
        attraction!.attractionType.toString().toLowerCase() ==
            UtilityAttractionType.facilities.name.toLowerCase()) {
      attractionType = true;
    }
    return attractionType;
  }

  @override
  Widget build(BuildContext context) {
    return getAttractionType()
        ? Container(
            margin: EdgeInsets.only(top: 2.h),
            child: AlertDialog(
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 2.h),
              contentPadding: EdgeInsets.zero,
              backgroundColor: ColorPath.bottomNavBgColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                // Align content to the left
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 80,
                    padding: EdgeInsets.all(3.h),
                    decoration: BoxDecoration(
                      color: ColorPath.demoColor.withOpacity(.20),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1.5.h),
                        topRight: Radius.circular(1.5.h),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            /*child: SvgPicture.asset(
                        attraction!.attractionType.toString().toLowerCase() == UtilityAttractionType.facilities.name.toLowerCase()
                        ?IconPaths.restRoomIcon:IconPaths.parkingIcon,
                        // fit: BoxFit.cover,
                        //  width: MediaQuery.of(context).size.width,
                      ),*/
                            child: FancyShimmerCachedImage(
                              imageUrl: attraction!.thumbnail.toString(),
                              boxFit: BoxFit.contain,
                              alignment: Alignment.center,
                              errorWidget:
                                  Image.asset(IconPaths.akshardhamMarkerIcon),
                              width: 12.h,
                            ),
                          ),
                        ),
                        VerticalSpace(height: 0.5.h),
                        //if (estimatedTime != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (estimatedTime != null) {
                                  startNavigationCallback!();
                                } else {
                                  //buildContext?.customSnackBar(context,navigationMessage,okText);
                                  EasyDebounce.debounce('navigateButton',
                                    const Duration(milliseconds: 400),
                                        () async {
                                      showToast(navigationMessage);
                                    },
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorPath.bottomSelectedItemColor),
                              child: CustomText(
                                text: navigate,
                                fontSize: 11.sp,
                                underline: false,
                                fontFamily: interFont,
                                fontWeight: FontWeight.w400,
                                color: ColorPath.whiteColor,
                              ),
                            ),
                            VerticalSpace(height: 1.5.h),
                            Container(
                              height: 5.h,
                              width: 8.w,
                              padding: EdgeInsets.all(1.h),
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              child: SvgPicture.asset(IconPaths.walkingIcon),
                            ),
                            CustomText(
                              text:
                                  '${estimatedTime != null ? (estimatedTime!.round()) : '-'} $timeMins',
                              fontSize: 12.sp,
                              underline: false,
                              fontWeight: FontWeight.normal,
                              fontFamily: interFont,
                              color: ColorPath.ViewMore,
                              maxLine: 2,
                              letterSpacing: 1.5,
                            ),
                          ],
                        ),
                        CustomText(
                          text: attraction!.title.toString(),
                          fontSize: 18.sp,
                          underline: false,
                          fontFamily: addingTonFont,
                          fontWeight: FontWeight.w300,
                          color: ColorPath.primaryColor,
                          maxLine: 2,
                          overflow: TextOverflow.ellipsis,
                          letterSpacing: 1.5,
                        ),
                        VerticalSpace(height: 0.5.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(top: 2.h),
            child: AlertDialog(
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 2.h),
              contentPadding: EdgeInsets.zero,
              backgroundColor: ColorPath.bottomNavBgColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        left: 2.3.h, right: 2.3.h, top: 2.3.h, bottom: 1.h),
                    decoration: BoxDecoration(
                      color: ColorPath.activityBgColor.withOpacity(.2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1.5.h),
                        topRight: Radius.circular(1.5.h),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FancyShimmerCachedImage(
                              imageUrl: attraction!.thumbnail.toString(),
                              boxFit: BoxFit.cover,
                              alignment: Alignment.center,
                              errorWidget:
                                  Image.asset(IconPaths.placeholderImage),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                        VerticalSpace(height: 0.2.h),
                        //if (estimatedTime != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (estimatedTime != null) {
                                  startNavigationCallback!();
                                } else {
                                  //buildContext?.customSnackBar(context,navigationMessage,okText);
                                  EasyDebounce.debounce('navigateButton',
                                    const Duration(milliseconds: 400),
                                        () async {
                                      showToast(navigationMessage);
                                    },
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorPath.bottomSelectedItemColor),
                              child: CustomText(
                                text: navigate,
                                fontSize: 11.sp,
                                underline: false,
                                fontFamily: interFont,
                                fontWeight: FontWeight.w400,
                                color: ColorPath.whiteColor,
                              ),
                            ),
                            VerticalSpace(height: 1.5.h),
                            Container(
                              height: 5.h,
                              width: 8.w,
                              padding: EdgeInsets.all(1.h),
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              child: SvgPicture.asset(IconPaths.walkingIcon),
                            ),
                            CustomText(
                              text:
                                  '${estimatedTime != null ? (estimatedTime!.round()) : '-'} $timeMins',
                              fontSize: 12.sp,
                              underline: false,
                              fontWeight: FontWeight.normal,
                              fontFamily: interFont,
                              color: ColorPath.ViewMore,
                              maxLine: 2,
                              letterSpacing: 1.5,
                            ),
                          ],
                        ),
                        CustomText(
                          text: attraction!.title.toString(),
                          fontSize: 18.sp,
                          underline: false,
                          fontFamily: addingTonFont,
                          fontWeight: FontWeight.w300,
                          color: ColorPath.primaryColor,
                          maxLine: 2,
                          letterSpacing: 1.5,
                        ),
                        VerticalSpace(height: 1.h),
                        CustomText(
                          text:
                              '$duration: ${attraction!.averageVisitLengthInMinutes.toString()} $timeMin',
                          fontSize: 10.sp,
                          underline: false,
                          fontWeight: FontWeight.normal,
                          fontFamily: interFont,
                          color: ColorPath.durationBackground.withOpacity(.6),
                          //maxLine: 3,
                        ),
                        VerticalSpace(height: 1.h),
                      ],
                    ),
                  ),
                  GestureDetector(
                    //Navigate to Details page
                    onTap: () {
                      getIt<AppRouter>().pop();
                      Attraction? selectedAttraction =
                          attractionList?.firstWhere(
                              (element) => element.id == attraction!.id);
                      if (selectedAttraction != null) {
                        getIt<AppRouter>().push(AttractionDetailsRoute(
                            appJsonModel: [selectedAttraction]));
                      }
                    },
                    child: Container(
                      height: 8.h,
                      padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                      decoration: BoxDecoration(
                        color: ColorPath.containerBorderColor.withOpacity(.60),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                getIt<AppRouter>().pop();
                                Attraction? selectedAttraction =
                                    attractionList?.firstWhere((element) =>
                                        element.id == attraction!.id);
                                if (selectedAttraction != null) {
                                  getIt<AppRouter>().push(
                                      AttractionDetailsRoute(
                                          appJsonModel: [selectedAttraction]));
                                }
                              },
                              child: CustomText(
                                text: knowMore,
                                fontSize: 16.sp,
                                underline: false,
                                fontWeight: FontWeight.w300,
                                fontFamily: addingTonFont,
                                color: ColorPath.primaryColor,
                                maxLine: 5,
                              ),
                            ),
                            Container(
                              height: 5.h,
                              width: 8.w,
                              padding: EdgeInsets.all(1.h),
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorPath.primaryColor,
                              ),
                              child:
                                  SvgPicture.asset(IconPaths.rightDoubleIcon),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
