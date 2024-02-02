import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/custom_text.dart';
import '../../common_widgets/swiper_widget.dart';
import '../../common_widgets/widgets.dart';
import '../utils/constants.dart';
import '../utils/iconpath.dart';
import 'fancyShimmerCachedImage.dart';


class NewsEventWidget extends StatefulWidget  {
   NewsEventWidget({
    super.key,
    required this.imageLength,
    required this.imageUrl,
    required this.title,
    required this.publishedDate,
    required this.description,
    required this.eventStatus,
    required this.eventDate,
    this.isEventContainer = false,
    required this.onNewsClick,
  });

  final int imageLength;
  final List<String> imageUrl;
  final String title;
  final String publishedDate;
  final String description;
  final String eventStatus;
  final String eventDate;
  final bool isEventContainer;
  final Function() onNewsClick;

  @override
  State<NewsEventWidget> createState() => _NewsEventWidgetState();
}

class _NewsEventWidgetState extends State<NewsEventWidget> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  Widget build(BuildContext context) {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat(reverse:false);
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn);
    return Container(
      decoration: BoxDecoration(
        color: ColorPath.activityBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 2.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (widget.imageLength > 0) ? SizedBox(
            height: 35.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child:SwiperWidget(
                isIndexPagination: false,
                itemLength: widget.imageLength,
                activeColor: ColorPath.welContainer,
                inActiveColor: ColorPath.primaryTextColor,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40.h,
                    //foreground decoration
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorPath.primaryColor,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0, 0.5],
                      ),
                    ),
                    //background decoration
                    child:FadeTransition(
                        opacity: _animation!,
                      child:  FancyShimmerCachedImage(
                        imageUrl: widget.imageUrl[index] ?? "",
                        boxFit: BoxFit.fill,
                        errorWidget: Image.asset(IconPaths.placeholderImage),
                        width: MediaQuery.of(context).size.width,
                      )
                    ),
                  );
                },
              )
            ),
          ) : Container(),
          //Announcements Date
          VerticalSpace(height: 2.5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
            child: CustomText(
              text: widget.title,
              fontSize: 16.sp,
              underline: false,
              fontFamily: addingTonFont,
              fontWeight: FontWeight.w300,
              color: ColorPath.primaryColor,
              maxLine: 3,
            ),
          ),
          VerticalSpace(height: 1.h),
          widget.isEventContainer
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                  child: IntrinsicWidth(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                      margin: EdgeInsets.only(right: 8.h),
                      decoration: BoxDecoration(
                        color: ColorPath.bottomNavSelectedItemColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(IconPaths.calendarIcon),
                          HorizontalSpace(width: 1.h),
                         /* Expanded(
                            child: CustomText(
                              text: selectedDate(widget.publishedDate.toString(),Constant.ISO_TIMEZONE,Constant.EVENT_DATE_FORMAT),
                              fontSize: 12.sp,
                              underline: false,
                              fontFamily: interFont,
                              fontWeight: FontWeight.w400,
                              color: ColorPath.whiteColor,
                              maxLine: 3,
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
          VerticalSpace(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
            child: CustomText(
              text: widget.description,
              fontSize: 12.sp,
              underline: false,
              fontFamily: interFont,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
              color: ColorPath.primaryColor,
              maxLine: 3,
            ),
          ),
          VerticalSpace(height: 1.h),
          widget.isEventContainer
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 2.h),
                        decoration: BoxDecoration(
                          color: ColorPath.redColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: CustomText(
                          text: widget.eventStatus,
                          fontSize: 10.sp,
                          underline: false,
                          fontFamily: interFont,
                          fontWeight: FontWeight.w400,
                          color: ColorPath.whiteColor,
                          maxLine: 1,
                        ),
                      ),
                      HorizontalSpace(width: 1.h),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 2.h),
                          decoration: BoxDecoration(
                            color: ColorPath.bottomNavSelectedItemColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(IconPaths.calendarIcon),
                              HorizontalSpace(width: 1.h),
                              Expanded(
                                child: CustomText(
                                  text: widget.eventDate,
                                  fontSize: 12.sp,
                                  underline: false,
                                  fontFamily: interFont,
                                  fontWeight: FontWeight.w400,
                                  color: ColorPath.whiteColor,
                                  maxLine: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          widget.isEventContainer
              ?  Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
                  child:const SizedBox()/* ButtonIcon(
                    onTap: () {},
                    buttonName: eventRegister,
                    buttonIcon: rightIcon,
                  )*/,
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
                  child: ButtonIcon(
                    onTap: widget.onNewsClick,
                    buttonName: readMore,
                    buttonIcon: IconPaths.rightIcon,
                    borderColor:ColorPath.primaryButtonColor,
                  ),
                ),
        ],
      ),
    );
  }
}
