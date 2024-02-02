import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/widgets.dart';
import '../utils/constants.dart';
import '../utils/iconpath.dart';
import 'ImageSliders/common_image_slider.dart';

class NewsEventCommonWidget extends StatefulWidget {
  const NewsEventCommonWidget({
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
    required this.externalLink,
  });

  final int imageLength;
  final List<String> imageUrl;
  final String title;
  final String publishedDate;
  final String description;
  final String eventStatus;
  final String? eventDate;
  final bool isEventContainer;
  final Function() onNewsClick;
  final String externalLink;

  @override
  State<NewsEventCommonWidget> createState() => NewsEventCommonWidgetState();
}

class NewsEventCommonWidgetState extends State<NewsEventCommonWidget>{
  Animation<double>? _animation;
  PageController? controller;

  @override
  Widget build(BuildContext context) {
    controller = PageController(initialPage: 0);
    return Container(
      color: ColorPath.whiteColor,
      margin: EdgeInsets.symmetric(horizontal: 2.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (widget.imageLength > 0)
              ? Container(
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
                          attractionItem: widget.imageUrl, isGuideLine: false),
                      VerticalSpace(height: 2.h),
                      CustomText(
                        text: widget.title,
                        fontSize: 14.sp,
                        underline: false,
                        fontFamily: interFont,
                        fontWeight: FontWeight.w500,
                        color: ColorPath.primaryColor,
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      VerticalSpace(height: 1.5.h),
                      CustomText(
                        text:widget.isEventContainer ? widget.eventDate:widget.publishedDate,
                        fontSize: 11.sp,
                        underline: false,
                        fontFamily: interFont,
                        fontWeight: FontWeight.w600,
                        color: ColorPath.primaryColor,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      VerticalSpace(height: 1.5.h),
                      CustomText(
                        text: widget.description,
                        fontSize: 12.sp,
                        underline: false,
                        fontFamily: addingTonFont,
                        fontWeight: FontWeight.w300,
                        color: ColorPath.primaryColor,
                        maxLine: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      widget.isEventContainer
                          ? GestureDetector(
                        onTap: () async {
                          //Share the externalLink with others app.
                          EasyDebounce.debounce('shareButton', const Duration(milliseconds: 400),() async {
                            if(widget.externalLink!=null && widget.externalLink.isNotEmpty){
                              await Share.share(widget.externalLink.toString());
                            }else{
                              showToast(invalidEvent);
                            }
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 1.5.h),
                          child: SizedBox(
                            width: 6.h,
                            child: WidgetContainer(
                              widget: SvgPicture.asset(IconPaths.shareIconButton),
                            ),
                          ),
                        ),
                      ) : Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: ButtonIcon(
                              onTap: widget.onNewsClick,
                              buttonName: readMore,
                              buttonIcon: IconPaths.rightIcon,
                              borderColor: ColorPath.primaryButtonColor,
                            ),
                          ),
                    ],
                  ),
                )
              : Container(),

          //Announcements Date
          /*VerticalSpace(height: 2.5.h),
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
          ): const SizedBox(),*/

          /*  widget.isEventContainer
              ?  Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
            child:const SizedBox()*/ /* ButtonIcon(
                    onTap: () {},
                    buttonName: eventRegister,
                    buttonIcon: rightIcon,
                  )*/ /*,
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
          ),*/
        ],
      ),
    );
  }
}
