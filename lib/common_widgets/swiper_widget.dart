// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/strings.dart';
import 'custom_text.dart';

class SwiperWidget extends StatelessWidget {
  SwiperWidget({
    Key? key,
    required this.itemLength,
    required this.itemBuilder,
    required this.activeColor,
    required this.inActiveColor,
    this.isIndexPagination = true,
    this.onIndexChanged,
  }) : super(key: key);
  final int itemLength;
  final IndexedWidgetBuilder itemBuilder;
  final Color activeColor;
  final Color inActiveColor;
  final bool isIndexPagination;
  final Function(void)? onIndexChanged;
  SwiperController controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: itemBuilder,
      itemCount: itemLength,
      onIndexChanged: onIndexChanged,
      controller: controller,
      physics: itemLength <= 1 ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
      pagination: isIndexPagination
          ? SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
                int count = config.activeIndex + 1;
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 1.5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        itemLength <= 1 ? showContainer() : GestureDetector(
                          key: const Key("previous_btn"),
                          onTap: () => controller.previous(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 2.h,
                            color: ColorPath.secondaryBrownColor,
                          ),
                        ),
                        HorizontalSpace(width: .5.h),
                        CustomText(
                          text: count.toString(),
                          fontSize: 12.sp,
                          underline: false,
                          fontFamily: interFont,
                          fontWeight: FontWeight.w400,
                          color: ColorPath.commonTextColor,
                        ),
                        HorizontalSpace(width: .5.h),
                        CustomText(
                          text: ofText,
                          fontSize: 12.sp,
                          underline: false,
                          fontFamily: interFont,
                          fontWeight: FontWeight.w400,
                          color: ColorPath.commonTextColor,
                        ),
                        HorizontalSpace(width: .5.h),
                        CustomText(
                          text: config.itemCount.toString(),
                          fontSize: 12.sp,
                          underline: false,
                          fontFamily: interFont,
                          fontWeight: FontWeight.w400,
                          color: ColorPath.commonTextColor,
                        ),
                        HorizontalSpace(width: .5.h),
                        (itemLength <= 1) ? showContainer() : GestureDetector(
                          key: const Key("next_btn"),
                          onTap: () => controller.next(),
                          child: Icon(Icons.arrow_forward_ios,
                              size: 2.h, color: ColorPath.secondaryBrownColor),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 2.h),
                    height: 1.5.h,
                    child: ListView.builder(
                      itemCount: config.itemCount,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            width: 25,
                            decoration: index == config.activeIndex
                                ? BoxDecoration(
                                    color: activeColor,
                                    borderRadius: BorderRadius.circular(15),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: inActiveColor,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      autoplay: itemLength <= 1 ? false : true,
    );
  }

  Widget showContainer(){
    return Container( height: 2.h,);
  }
}
