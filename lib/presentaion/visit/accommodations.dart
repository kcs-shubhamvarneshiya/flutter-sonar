import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/constants.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_section_title.dart';
import '../../common_widgets/fancyShimmerCachedImage.dart';
import '../../model/accommodations/accommodations.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

class Accommodation extends StatelessWidget {
  Accommodation({Key? key, this.accommodation}) : super(key: key);
  Widget? accommodationWidget;
  List<Accommodations>? accommodation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        accommodation!.isNotEmpty ?
            DecoratedBox(
          decoration: BoxDecoration(
            color: ColorPath.whiteColor.withOpacity(0.10),
            border: Border(
              top: BorderSide(
                  color: ColorPath.secondaryBrownColor, width: 0.1.h),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomSectionTitle(text: accommodations),
                    GestureDetector(
                      onTap: () {},
                      child: CustomText(
                        text: viewMore,
                        fontSize: 10.sp,
                        underline: false,
                        fontFamily: interFont,
                        fontWeight: FontWeight.w400,
                        color: ColorPath.commonTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                //height: MediaQuery.of(context).size.height * .35,
                height: (Platform.isIOS) ? 30.h : 35.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  //itemCount: appJsonData.accommodations!.length,
                  itemCount: accommodation!.length < 5
                      ? accommodation!.length
                      : Constant.attractionItemCount,
                  padding: EdgeInsets.only(left: 2.h),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Map<String, dynamic> loginParameter = {
                          'type': webpage,
                          'name': accommodation![index].link.toString(),
                        };
                        setAnalyticData(accommodations, loginParameter);
                        urlLaunch(accommodation![index].link.toString());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 1.5.h),
                        child: Container(
                          width: 45.w,
                          padding: EdgeInsets.only(bottom: 1.h),
                          decoration: BoxDecoration(
                              color: ColorPath.whiteColor,
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(
                                  color: ColorPath.containerBorderColor)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.h,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(1.h),
                                      topRight: Radius.circular(1.h)),
                                  child: FancyShimmerCachedImage(
                                    imageUrl: accommodation![index]
                                            .thumbnail
                                            .toString() ??
                                        "",
                                    boxFit: BoxFit.fill,
                                    errorWidget:
                                        Image.asset(IconPaths.placeholderImage),
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                              VerticalSpace(height: 1.h),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 1.5.h),
                                child: CustomText(
                                  text: accommodation![index]
                                      .location!
                                      .toUpperCase(),
                                  fontSize: 12.sp,
                                  underline: false,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: addingTonFont,
                                  fontWeight: FontWeight.w300,
                                  color: ColorPath.blackColor,
                                  letterSpacing: 2,
                                  maxLine: 1,
                                ),
                              ),
                              VerticalSpace(height: 1.h),
                              //Announcements Title
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 1.5.h),
                                child: CustomText(
                                  text: accommodation![index].name,
                                  fontSize: 13.sp,
                                  underline: false,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: interFont,
                                  fontWeight: FontWeight.w400,
                                  color: ColorPath.blackColor,
                                  maxLine: 2,
                                ),
                              ),
                              VerticalSpace(height: 1.h),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.5.h),
                                  child: CustomText(
                                    text: nightRate(
                                        accommodation![index].price!.toInt()),
                                    fontSize: 14.sp,
                                    underline: false,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: addingTonFont,
                                    fontWeight: FontWeight.w400,
                                    color: ColorPath.blackColor,
                                    maxLine: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              VerticalSpace(height: (Platform.isIOS) ? 4.h : 2.h),
            ],
          ),
        ):Container()

        /*BlocBuilder<AppJsonBloc, AppJsonState>(
          bloc: GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
          builder: (context, state) {
            state.when(
              loading: () {
                accommodationWidget = const Center(child: SizedBox());
              },
              loaded: (appJsonData) {
                accommodationWidget = appJsonData.accommodations!.isNotEmpty
                    ? DecoratedBox(
                        decoration: BoxDecoration(
                          color: ColorPath.whiteColor.withOpacity(0.10),
                          border: Border(
                            top: BorderSide(
                                color: ColorPath.secondaryBrownColor,
                                width: 0.1.h),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.h, vertical: 2.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomSectionTitle(
                                      text: accommodations),
                                  GestureDetector(
                                    onTap: () {},
                                    child: CustomText(
                                      text: viewMore,
                                      fontSize: 10.sp,
                                      underline: false,
                                      fontFamily: interFont,
                                      fontWeight: FontWeight.w400,
                                      color: ColorPath.commonTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              //height: MediaQuery.of(context).size.height * .35,
                              height: (Platform.isIOS) ? 30.h : 33.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(),
                                //itemCount: appJsonData.accommodations!.length,
                                itemCount:
                                    appJsonData.accommodations!.length < 3
                                        ? appJsonData.accommodations!.length
                                        : Constant.itemCount,
                                padding: EdgeInsets.only(left: 2.h),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Map<String, dynamic> loginParameter = {
                                        'type': webpage,
                                        'name': appJsonData
                                            .accommodations![index].link
                                            .toString(),
                                      };
                                      setAnalyticData(
                                          accommodations, loginParameter);
                                      urlLaunch(appJsonData
                                          .accommodations![index].link
                                          .toString());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 1.5.h),
                                      child: Container(
                                        width: 45.w,
                                        padding: EdgeInsets.only(bottom: 1.h),
                                        decoration: BoxDecoration(
                                            color: ColorPath.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(1.h),
                                            border: Border.all(
                                                color: ColorPath
                                                    .containerBorderColor)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 15.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(1.h),
                                                    topRight:
                                                        Radius.circular(1.h)),
                                                child: FancyShimmerCachedImage(
                                                  imageUrl: appJsonData
                                                          .accommodations![
                                                              index]
                                                          .thumbnail
                                                          .toString() ??
                                                      "",
                                                  boxFit: BoxFit.fill,
                                                  errorWidget: Image.asset(
                                                      IconPaths
                                                          .placeholderImage,fit: BoxFit.cover,),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                ),
                                              ),
                                            ),
                                            VerticalSpace(height: 1.h),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.5.h),
                                              child: CustomText(
                                                text: appJsonData
                                                    .accommodations![index]
                                                    .location!
                                                    .toUpperCase(),
                                                fontSize: 12.sp,
                                                underline: false,
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily: addingTonFont,
                                                fontWeight: FontWeight.w300,
                                                color: ColorPath.blackColor,
                                                letterSpacing: 2,
                                                maxLine: 1,
                                              ),
                                            ),
                                            VerticalSpace(height: 1.h),
                                            //Announcements Title
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.5.h),
                                              child: CustomText(
                                                text: appJsonData
                                                    .accommodations![index]
                                                    .name,
                                                fontSize: 13.sp,
                                                underline: false,
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily: interFont,
                                                fontWeight: FontWeight.w400,
                                                color: ColorPath.blackColor,
                                                maxLine: 2,
                                              ),
                                            ),
                                            VerticalSpace(height: 1.h),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 1.5.h),
                                                child: CustomText(
                                                  text: nightRate(appJsonData
                                                      .accommodations![index]
                                                      .price!
                                                      .toInt()),
                                                  fontSize: 14.sp,
                                                  underline: false,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontFamily: addingTonFont,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorPath.blackColor,
                                                  maxLine: 2,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            VerticalSpace(height: (Platform.isIOS) ? 4.h : 2.h),
                          ],
                        ),
                      )
                    : Container();
              },
              error: (error) {
                accommodationWidget = CustomText(
                  text: error,
                  fontSize: 13.sp,
                  underline: false,
                  fontWeight: FontWeight.w500,
                  color: ColorPath.primaryColor,
                );
              },
            );
            return accommodationWidget!;
          },
        ),*/
      ],
    );
  }
}
