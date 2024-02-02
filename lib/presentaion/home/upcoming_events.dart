import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
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
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../model/event/events.dart';
import '../../router_page/app_router.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';
import '../bloc/common_slider_image_bloc/common_image_slider_bloc.dart';
import '../bloc/common_slider_image_bloc/common_image_slider_state.dart';
import '../bloc/common_slider_image_bloc/common_image_slider_tap.dart';

//Image Slider
class UpcomingEvents extends StatelessWidget {
  UpcomingEvents({Key? key, this.events}) : super(key: key);

  Widget? eventsWidget;
  PageController? controller;
  List<Events>?events;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    controller = PageController(initialPage: 0, viewportFraction: 0.9);
    int? _currentPage = 0;

    var filteredEventList = events!.where((element) {
      var endTime = DateTime.parse(element.eventDate.toString());
      return endTime.isAfter(DateTime.now());
    }).toList();
    return eventsWidget = filteredEventList.isNotEmpty
        ? DecoratedBox(
      decoration: BoxDecoration(
        color: ColorPath.containerBorderColor.withOpacity(.30),
        border: Border(
          top: BorderSide(color: ColorPath.secondaryBrownColor, width: 0.1.h),
          //bottom: BorderSide(color: ColorPath.secondaryBrownColor, width: 0.1.h),
        ),
      ),
      child:RawScrollbar(
        controller:scrollController,
        thumbVisibility: true,
        thickness: 0.5.h,
        padding: EdgeInsets.only(bottom: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(height: 1.5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomSectionTitle(text: upcomingEvent),
                  GestureDetector(
                    onTap: () {
                      setAnalyticData(upcomingEvent, <String, String>{});
                      getIt<AppRouter>().push(UpcomingEventsItemRoute());
                    },
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
            Padding(
              /*padding: EdgeInsets.symmetric(horizontal: 3.2.h),*/
              padding: EdgeInsets.only(left: 3.2.h, right: 3.2.h),
              child: CustomText(
                text: upcomingDescription,
                fontSize: 12.sp,
                underline: false,
                fontFamily: interFont,
                fontWeight: FontWeight.w400,
                color: ColorPath.blackColor,
              ),
            ),
            VerticalSpace(height: 5.h),
            //Upcoming  Lists
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                itemCount:filteredEventList.length < 5 ? filteredEventList
                    .length : Constant
                    .attractionItemCount,
                shrinkWrap: true,
                controller: scrollController,
                padding: EdgeInsets.only(left: 3.2.h),
                scrollDirection: Axis.horizontal,
                physics:const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      getIt<AppRouter>().push(MoreDetailsRoute(
                          url: filteredEventList[index].externalLink != null
                              ? filteredEventList[index].externalLink!
                              : '',
                          //  pageName: appJsonData.events![index].title!,
                          pageName: eventdetail
                      ));
                    },
                    child: Container(
                      width: 86.w,
                      //padding: EdgeInsets.all(1.h),
                      margin: EdgeInsets.only(right: 1.5.h),
                      decoration: BoxDecoration(
                        color: ColorPath.bottomNavBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 19.h,
                            //width: 50.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(1.h),
                                topRight: Radius.circular(1.h),
                              ),
                              child: FancyShimmerCachedImage(
                                imageUrl: filteredEventList[index].thumbnail
                                    .toString() ??
                                    "",
                                boxFit: BoxFit.fitWidth,
                                errorWidget: Image.asset(
                                    IconPaths.placeholderImage),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                              ),
                            ),
                          ),
                          VerticalSpace(height: 2.h),
                          //News Date
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.h),
                            /*child: CustomText(
                              text: '12 JAN 2023 THURSDAY',
                              fontSize: 12.sp,
                              underline: false,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: addingTonFont,
                              fontWeight: FontWeight.normal,
                              color: ColorPath.primaryColor,
                              maxLine: 2,
                              align: TextAlign.start,
                              letterSpacing: 2.0,
                            ),*/
                            child: CustomText(
                              text:selectedDate(
                                  filteredEventList[index].eventDate.toString(),
                                  Constant.ISO_TIMEZONE,
                                  Constant.EVENT_DATE_FORMAT),
                              fontSize: 12.sp,
                              underline: false,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: interFont,
                              fontWeight: FontWeight.normal,
                              color: ColorPath.primaryColor,
                              maxLine: 2,
                              align: TextAlign.start,
                            ),
                          ),
                          VerticalSpace(height: 1.5.h),
                          //Announcements Title
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.h),
                            child: CustomText(
                              text: filteredEventList[index].title,
                              fontSize: 14.sp,
                              underline: false,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: interFont,
                              fontWeight: FontWeight.w600,
                              color: ColorPath.blackColor,
                              maxLine: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),


            /*SizedBox(
                        height: 30.h,
                        child: PageView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemCount:appJsonData.events!.length < 5? appJsonData.events!.length:Constant.attractionItemCount,
                          onPageChanged: (int page) {
                            _currentPage = page;
                            context.read<CommonImageSliderBloc>().add(CommonImageSliderTapEvent.tap(_currentPage!));
                          },
                          itemBuilder: (context, index) {
                            return Card(
                                  shadowColor:ColorPath.bottomNavBgColor,
                                  elevation: 2,
                                  color: ColorPath.bottomNavBgColor,
                                  margin: EdgeInsets.only(right: 1.h,left:0.5.h),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 19.h,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: FancyShimmerCachedImage(
                                            imageUrl: appJsonData
                                              .events![index].thumbnail
                                              .toString() ??
                                          "",boxFit: BoxFit.fitWidth,
                                            errorWidget: Image.asset(
                                              IconPaths.placeholderImage,fit: BoxFit.fitWidth,),
                                            width: MediaQuery.of(context).size.width,
                                          ),
                                        ),
                                      ),
                                      VerticalSpace(height: 2.h),
                                      //News Date
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.h),
                                        child: CustomText(
                                          text: '12 JAN 2023 THURSDAY',
                                          fontSize: 12.sp,
                                          underline: false,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: addingTonFont,
                                          fontWeight: FontWeight.normal,
                                          color: ColorPath.primaryColor,
                                          maxLine: 2,
                                          align: TextAlign.start,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                      VerticalSpace(height: 1.5.h),
                                      //Announcements Title
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 3.h),
                                        child:CustomText(
                                          text:appJsonData.events![index].title,
                                          fontSize: 14.sp,
                                          underline: false,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: interFont,
                                          fontWeight: FontWeight.w600,
                                          color: ColorPath.blackColor,
                                          maxLine: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                          },
                        ),
                      ),

                      BlocBuilder<CommonImageSliderBloc, CommonImageSliderState>(
                          builder: (context, state) {
                            _currentPage = state.currentIndex;
                            return Container(
                              margin: EdgeInsets.only(top: 2.5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  HorizontalSpace(width: 1.h),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<CommonImageSliderBloc>().add(CommonImageSliderTapEvent.tap(_currentPage!));
                                      if (controller!.page! > 0) {
                                        controller!.previousPage(
                                            duration: const Duration(milliseconds: 500),
                                            curve: Curves.ease);
                                      }
                                    },
                                    child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 2.h,
                                        color: _currentPage == 0 ? ColorPath
                                            .secondaryBrownColor
                                            .withOpacity(0.30) : ColorPath.secondaryBrownColor
                                    ),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    child: SmoothPageIndicator(
                                      controller: controller!,
                                      count: appJsonData.events!.length<5 ?appJsonData.events!.length:Constant.attractionItemCount,
                                      effect: SlideEffect(
                                        radius: 8,
                                        spacing: 5,
                                        dotHeight: 10,
                                        dotWidth: 10,
                                        dotColor: ColorPath.secondaryBrownColor.withOpacity(
                                            .40),
                                        activeDotColor: ColorPath.secondaryBrownColor,
                                      ),
                                    ),
                                  ),

                                  HorizontalSpace(width: 1.h),
                                  GestureDetector(
                                      onTap: () {
                                        if (controller!.page! < (appJsonData.events!.length < 5 ? appJsonData.events!.length - 1 :Constant.attractionItemCount.toInt() - 1)) {
                                          context.read<CommonImageSliderBloc>().add(CommonImageSliderTapEvent.tap(_currentPage!));
                                          controller!.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                                        }
                                      },
                                      child: Icon(Icons.arrow_forward_ios,
                                          size: 2.h,
                                          color: appJsonData.events!.length < 5 ?
                                          _currentPage == appJsonData.events!.length - 1
                                              ? ColorPath.secondaryBrownColor.withOpacity(.30)
                                              : ColorPath.secondaryBrownColor : _currentPage == Constant.attractionItemCount.toInt() -1
                                              ? ColorPath.secondaryBrownColor.withOpacity(.30) : ColorPath.secondaryBrownColor)
                                  ),
                                ],
                              ),
                            );
                          }
                      ),
                      VerticalSpace(height: 2.h),*/

            VerticalSpace(height: 3.h),
          ],
        ),
      ),
    ):Container();
  }
}
