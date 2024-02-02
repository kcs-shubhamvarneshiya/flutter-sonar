import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/custom_section_title.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../model/attraction/attraction.dart';
import '../../router_page/app_router.dart';
import '../../utils/colors.dart';
import '../../utils/iconpath.dart';
import '../../utils/strings.dart';
import '../bloc/visit_bloc/visit_bloc.dart';
import '../bloc/visit_bloc/visit_event.dart';
import '../bloc/visit_bloc/visit_state.dart';
import 'attractions_section.dart';

class PlanMyVisitList extends StatelessWidget {
  PlanMyVisitList({Key? key}) : super(key: key);
  Widget? planMyWidget;
  List<Attraction>? filterList = [];
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitBloc, VisitState>(
        builder: (context, state) {
          filterList = state.attractionList
              .where((element) => element.isAddedInPlan = true)
              .toList();
          return filterList != null && filterList!.length > 0
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorPath.whiteColor.withOpacity(0.10),
                    border: Border(
                      top: BorderSide(
                          color: ColorPath.secondaryBrownColor, width: 0.1.h),
                      //bottom: BorderSide(color: ColorPath.secondaryBrownColor, width: 0.1.h),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(height: 1.8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 2.h, left: 2.h),
                              child: const CustomSectionTitle(text: myPlan),
                            ),
                            GestureDetector(
                              onTap: () {
                                setAnalyticData(nameMyPlan, <String, String>{});
                                getIt<AppRouter>()
                                    .push(PlanVisitRoute())
                                    .then((value) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                  }
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.h, vertical: 2.h),
                                child: CustomText(
                                  text: viewMyPlan,
                                  fontSize: 12.sp,
                                  underline: false,
                                  fontFamily: interFont,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                  color: ColorPath.planVisitBgColor,
                                  maxLine: 5,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.h, right: 3.h),
                          child: CustomText(
                            text: dummyPlanText,
                            fontSize: 12.sp,
                            underline: false,
                            fontFamily: interFont,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: ColorPath.primaryColor,
                            maxLine: 5,
                          ),
                        ),
                        VerticalSpace(height: 2.8.h),
                        RawScrollbar(
                            controller:_scrollController,
                            thumbVisibility: true,
                            thickness: 0.5.h,
                            padding: EdgeInsets.only(bottom: 1.h),
                            child: AttractionsSection(attractionList: filterList,scrollController: _scrollController)
                        ),
                      ]),
                )
              : DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorPath.secondaryBrownColor.withOpacity(0.10),
                    border: Border(
                      top: BorderSide(
                          color: ColorPath.secondaryBrownColor, width: 0.1.h),
                      //bottom:BorderSide(color: ColorPath.secondaryBrownColor, width: 0.1.h),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.5.h, vertical: 1.5.h),
                          child: const CustomSectionTitle(text: planmyVisit),
                        ),
                        Container(
                          color: ColorPath.commonBgColor.withOpacity(0.10),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.5.h),
                            decoration: BoxDecoration(
                                color: ColorPath.bottomNavBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: ColorPath.secondaryBrownColor
                                        .withOpacity(.5))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                VerticalSpace(height: 2.5.h),
                                Center(
                                  child: SizedBox(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SvgPicture.asset(
                                          IconPaths.planvisitIcon),
                                    ),
                                  ),
                                ),
                                //Announcements Date
                                VerticalSpace(height: 1.5.h),
                                Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 2.h, right: 2.h),
                                    child: CustomText(
                                      text: planyourVisit,
                                      fontSize: 12.sp,
                                      underline: false,
                                      fontFamily: interFont,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400,
                                      color: ColorPath.primaryColor,
                                      maxLine: 5,
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 1.5.h),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  alignment: Alignment.center,
                                  child: ButtonIcon(
                                    color: ColorPath.planVisitBgColor,
                                    textColor: ColorPath.whiteColor,
                                    onTap: () {
                                      ///route the visit plan
                                      setAnalyticData(
                                          nameMyPlan, <String, String>{});
                                      getIt<AppRouter>()
                                          .push(PlanVisitRoute())
                                          .then((value) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .removeCurrentSnackBar();
                                        }
                                      });
                                    },
                                    borderColor: ColorPath.planVisitBgColor,
                                    buttonName: startvisit,
                                    buttonIcon: IconPaths.rightWhiteIcon,
                                  ),
                                ),
                                VerticalSpace(height: 2.h),
                              ],
                            ),
                          ),
                        ),
                        VerticalSpace(height: 3.h),
                      ]),
                );
        });
  }
}
