// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_state.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/constants.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../common_widgets/ImageSliders/common_image_slider.dart';
import '../../common_widgets/custom_header.dart';
import '../../model/hours.dart';
import '../../utils/iconpath.dart';
import '../bloc/visit_bloc/visit_bloc.dart';
import '../bloc/visit_bloc/visit_event.dart';
import 'attraction_page.dart';

@RoutePage()
class AttractionDetails extends StatefulWidget {
  const AttractionDetails({Key? key, this.appJsonModel, this.isDeeplink})
      : super(key: key);

  final List<Attraction>? appJsonModel;
  final bool? isDeeplink;

  static const String page = "/attraction_details";

  @override
  State<AttractionDetails> createState() => _AttractionDetailsState();
}

class _AttractionDetailsState extends State<AttractionDetails> {
  final isPressed = ValueNotifier<bool>(false);
  String recivedLink = '';
  Uri? deepLinkRecived;
  YoutubePlayerController? youtubeController;
  List<Hours> hours = <Hours>[];

  @override
  void initState() {
    super.initState();
  }

  Future<Uri> createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: Constant.dynamicLinkPrefix,
        link: Uri.parse(
            '${Constant.dynamicLink}${widget.appJsonModel![0].id.toString()}'),
        androidParameters: const AndroidParameters(
          packageName: Constant.androidPackageName,
        ),
        iosParameters: const IOSParameters(bundleId: Constant.iOSPackageName));
    var shortDynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(parameters);
    //  final ShortDynamicLink shortDynamicLink =
    //await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    // final ShortDynamicLink shortDynamicLink = await parameters.buildShortLink();
    final Uri deepLink = shortDynamicLink;
    return deepLink;
  }

  List<Hours> getTimings(String? name, List<Hours>? timingsList) {
    if (timingsList != null) {
      return timingsList;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    PageController? controller;
    controller = PageController(initialPage: 0);

    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorPath.homeBgColor,
        /*appBar:PreferredSize(
          preferredSize: Size.fromHeight(9.5.h),
        child:const CustomHeader(title: "Attraction Title"),),*/
        body: Scaffold(
          appBar: CustomHeader(
            title: widget.appJsonModel![0].title ?? '',
            redirectToHome:
                (widget.isDeeplink == null || widget.isDeeplink == false)
                    ? false
                    : true,
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(height: 1.h),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(2.5.h),
                    decoration: BoxDecoration(
                      color: ColorPath.addSectionText.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(2.h),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonImageSlider(
                          controller: controller,
                          attractionItem: widget.appJsonModel![0].images,
                          isGuideLine: false,
                        ),
                        VerticalSpace(height: 1.5.h),
                        /*CustomText(
                            text: widget.appJsonModel![0].description ?? '',
                            fontSize: 11.sp,
                            underline: false,
                            fontFamily: interFont,
                            fontWeight: FontWeight.w400,
                            color: ColorPath.primaryColor,
                            //maxLine: 4,
                            //overflow: TextOverflow.ellipsis,
                          ),*/
                        ReadMoreText(
                          widget.appJsonModel![0].description ?? '',
                          trimLines: 5,
                          preDataTextStyle:
                              const TextStyle(fontWeight: FontWeight.w400),
                          style: TextStyle(
                              color: ColorPath.primaryColor,
                              fontFamily: interFont,
                              fontSize: 11.sp),
                          colorClickableText: ColorPath.primaryColor,
                          moreStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorPath.secondaryBrownColor),
                          lessStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorPath.secondaryBrownColor),
                          trimMode: TrimMode.Length,
                          trimCollapsedText: showMoreText,
                          trimExpandedText: ' $showLessText',
                        ),
                        VerticalSpace(height: 1.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.appJsonModel![0].displayOrder
                                        ?.visitPlanner !=
                                    null
                                ? Expanded(
                                    child: ButtonIcon(
                                      onTap: () {
                                        Map<String, dynamic>
                                            attractionParameter = {
                                          'type': widget.appJsonModel![0].id
                                              .toString(),
                                          'name': widget.appJsonModel![0].title
                                              .toString(),
                                        };
                                        setAnalyticData(nameAttractionDetail,
                                            attractionParameter);
                                        context.read<VisitBloc>().add(
                                            VisitEvent.addActivityEvent(
                                                widget.appJsonModel![0],
                                                false,
                                                context));
                                      },
                                      buttonName: addPlan,
                                      buttonIcon: IconPaths.addIconButton,
                                      color: ColorPath.secondaryButtonColor,
                                      textColor: ColorPath.whiteColor,
                                      borderColor:
                                          ColorPath.secondaryButtonColor,
                                    ),
                                  )
                                : const SizedBox(),
                            HorizontalSpace(width: 2.0.h),
                            GestureDetector(
                              onTap: () async {
                                final Uri dynamicLink =
                                    await createDynamicLink();
                                var path = dynamicLink.toString();
                                // Share the dynamic link with others
                                EasyDebounce.debounce(
                                  'shareButton', // A unique ID for the debounce
                                  const Duration(
                                      milliseconds: 400), // Debounce duration
                                  () async {
                                    await Share.share(path);
                                  },
                                );
                                Map<String, dynamic> shareParameter = {
                                  'type': widget.appJsonModel![0].id.toString(),
                                  'name': path.toString(),
                                };
                                setAnalyticData(
                                    nameAttractionDetail, shareParameter);
                              },
                              child: SizedBox(
                                width: 5.5.h,
                                child: WidgetContainer(
                                  widget: SvgPicture.asset(
                                      IconPaths.shareIconButton),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                widget.appJsonModel![0].content != null
                    ? SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.white38,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.appJsonModel![0].content!.length,
                            itemBuilder: (context, index) {
                              return AttractionPage(
                                  content:
                                      widget.appJsonModel![0].content![index]);
                            },
                          ),
                        ),
                      )
                    : Container(),
                widget.appJsonModel![0].timings != null
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.h, vertical: 1.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListView.separated(
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount:
                                    widget.appJsonModel![0].timings!.length,
                                separatorBuilder: (context, index) =>
                                    VerticalSpace(height: 2.5.h),
                                itemBuilder: (context, index) {
                                  var timingList = getTimings(
                                      widget.appJsonModel![0].timings![index]
                                          .name,
                                      widget.appJsonModel![0].timings![index]
                                          .hours);
                                  return Container(
                                    padding: EdgeInsets.all(2.5.h),
                                    decoration: BoxDecoration(
                                      color: ColorPath.commonBgColor
                                          .withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: widget.appJsonModel![0]
                                              .timings![index].name,
                                          fontSize: 16.sp,
                                          underline: false,
                                          fontFamily: addingTonFont,
                                          fontWeight: FontWeight.w300,
                                          color: ColorPath.primaryColor,
                                          maxLine: 2,
                                        ),
                                        VerticalSpace(height: 0.5.h),
                                        SizedBox(
                                          height: 14.h,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount: timingList.length,
                                            separatorBuilder:
                                                (context, index) =>
                                                    HorizontalSpace(width: 2.w),
                                            itemBuilder:
                                                (context, indexNested) {
                                              return DayTimeWidget(
                                                  day: timingList[indexNested]
                                                      .weekday
                                                      .toString(),
                                                  startTime: double.parse(
                                                          timingList[
                                                                  indexNested]
                                                              .startHour
                                                              .toString())
                                                      .getTimeStringFromDouble(),
                                                  endTime: double.parse(
                                                          timingList[
                                                                  indexNested]
                                                              .endHour
                                                              .toString())
                                                      .getTimeStringFromDouble(),
                                                  type: widget
                                                              .appJsonModel![0]
                                                              .timings![index]
                                                              .type ==
                                                          campusType
                                                      ? false
                                                      : true);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      )
                    : Container(),

                /*widget.appJsonModel![0].timings != null ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: widget.appJsonModel![0].timings!.length,
                            separatorBuilder: (context, index) =>
                                VerticalSpace(height: 2.5.h),
                            itemBuilder: (context, index) {
                              var timingList = getTimings(widget.appJsonModel![0].timings![index].name, widget.appJsonModel![0].timings![index].hours);
                              return Container(
                                padding: EdgeInsets.all(2.5.h),
                                decoration: BoxDecoration(
                                  color: ColorPath.commonBgColor.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                 CustomText(
                                        text: widget.appJsonModel![0]
                                            .timings![index].name,
                                        fontSize: 16.sp,
                                        underline: false,
                                        fontFamily: addingTonFont,
                                        fontWeight: FontWeight.w300,
                                        color: ColorPath.primaryColor,
                                        maxLine: 2,
                                      ),
                                    VerticalSpace(height: 1.0.h),
                                    SizedBox(
                                      child: ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount:timingList.length,
                                        separatorBuilder: (context,index) =>
                                            HorizontalSpace(width: 2.w),
                                        itemBuilder: (context, indexNested) {
                                          return
                                            Container(
                                              margin: EdgeInsets.only(top: 2.h),
                                              decoration: BoxDecoration(
                                                color: ColorPath.hoursContainer,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:  EdgeInsets.all(2.h),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
*/ /*
                                                        Text(hours[indexNested].weekday.toString(),style: TextStyle(color: ColorPath.whiteColor,fontSize: 14.sp),),
*/ /*
                                                    CustomText(
                                                      text:timingList[indexNested].weekday.toString()  ?? '',
                                                      fontSize: 12.sp,
                                                      underline: false,
                                                      fontFamily: interFont,
                                                      fontWeight: FontWeight.w400,
                                                      color: ColorPath.whiteColor,
                                                      maxLine: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: 1.h,),
                                                    Row(
                                                      children: [
                                                        CustomText(
                                                          text: "${double.parse(timingList[indexNested].startHour.toString()).getTimeStringFromDouble()}| ${double.parse(timingList[indexNested].endHour.toString()).getTimeStringFromDouble()}",
                                                          fontSize: 14.sp,
                                                          underline: false,
                                                          fontFamily: interFont,
                                                          fontWeight: FontWeight.w500,
                                                          color: ColorPath.whiteColor,
                                                          maxLine: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ],
                                                    )

                                                  ],
                                                ),
                                              ),
                                            );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ):Container()*/
              ],
            ),
          ),
        ),
        //),
      ),
    );
  }
}
