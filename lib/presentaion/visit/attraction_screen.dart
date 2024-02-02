// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/ImageSliders/visit_image_slider.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/ImageSliders/common_image_slider.dart';
import '../../common_widgets/custom_section_title.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../router_page/app_router.dart';

class AttractionsScreen extends StatelessWidget {
  AttractionsScreen({super.key,this.attractionList});
  Widget? attractionsWidget;
  List<Attraction>? attractionList = [];
  @override
  Widget build(BuildContext context) {
    PageController? controller;
    controller = PageController(initialPage: 0,viewportFraction: 0.9);
    attractionList?.removeWhere(
            (element) => (element.displayOrder?.exploreList == null || element.options!.isRecommended == false));
    attractionList!.sort((a, b) => a.displayOrder!.exploreList
        .toString()
        .compareTo(b.displayOrder!.exploreList.toString()));
    return attractionList!.isNotEmpty
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //VerticalSpace(height: 12.h),
        const Divider(color: ColorPath.secondaryBrownColor , height: 1, thickness: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomSectionTitle(text: attraction),
              GestureDetector(
                onTap: () {
                  setAnalyticData(nameMap,<String, String>{});
                  getIt<AppRouter>().push(HomeBottomNavRoute(initialIndex: 1, isListVisible: true));
                },
                child: CustomText(
                  text: viewAllSmall,
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
          padding: EdgeInsets.symmetric(horizontal: 3.5.h),
          child: CustomText(
            text: attractionDescription,
            fontSize: 12.sp,
            underline: false,
            fontFamily: interFont,
            fontWeight: FontWeight.w400,
            color: ColorPath.primaryColor,
            maxLine: 5,
          ),
        ),
        VerticalSpace(height: 2.h),
        VisitImageSlider(controller: controller, attractionList: attractionList),
        //CommonImageSlider(attractionList: attractionList,controller: controller,isVisit: true),
        VerticalSpace(height: 2.h)
      ],
    )
        : Container();
  }
}
