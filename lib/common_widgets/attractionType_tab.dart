import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class AttractionTypeTab extends StatelessWidget {

  final Set<String?> attractionTypeList;
  final int selectedAttractionTypeTabIndex;
  final Function(int) onTap;

  const AttractionTypeTab(this.attractionTypeList, this.selectedAttractionTypeTabIndex, this.onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorPath.tourSubContainer,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(0.5.h),
      child: DefaultTabController(
        initialIndex: selectedAttractionTypeTabIndex,
        length: attractionTypeList.length,
        child: TabBar(
          isScrollable: attractionTypeList.length <= 3 ? false : true,
          labelPadding: EdgeInsets.symmetric(horizontal: 2.5.h),
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          onTap: onTap,
          labelColor: ColorPath.primaryColor,
          unselectedLabelColor: ColorPath.primaryColor,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorPath.whiteColor,
          ),
          tabs: attractionTypeList
              .map((e) =>
              Tab(
                child: SizedBox(
                  child: CustomText(
                    text: e.toString(),
                    align: TextAlign.center,
                    fontSize: 10.sp,
                    underline: false,
                    fontFamily: interFont,
                    fontWeight: FontWeight.w400,
                    color: ColorPath.primaryColor,
                  ),
                ),
              ))
              .toList(),
        ),
      ),
    );
  }
}
