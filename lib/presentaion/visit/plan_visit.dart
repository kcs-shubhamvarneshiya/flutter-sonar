import 'package:akdmvisitorsapp/common_widgets/activity_container.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_dialog.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_header.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_bloc.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/constants.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../router_page/app_router.dart';
import '../../utils/iconpath.dart';
import '../bloc/visit_bloc/visit_event.dart';
import '../bloc/visit_bloc/visit_state.dart';
import 'add_activity.dart';

@RoutePage()
class PlanVisit extends StatelessWidget {
  PlanVisit({Key? key}) : super(key: key);

  Widget? activityWidget;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorPath.homeBgColor,
        appBar: CustomHeader(
          title: myPlan,
          redirectToHome: false,
        ),
        body: Column(
          children: [
            BlocListener<VisitBloc, VisitState>(
              bloc: GetIt.I<VisitBloc>()
                ..add(const VisitEvent.loadVisitEvent()),
              listener: (context, state) {
                if (state.attractionList.isEmpty) {
                  addActivityBottomSheet(context);
                }
              },
              child:
                  BlocBuilder<VisitBloc, VisitState>(builder: (context, state) {
                return Expanded(
                  child: Container(
                    color: ColorPath.bottomNavBgColor,
                    child: state.attractionList.isEmpty
                        ? SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                VerticalSpace(height: 5.h),
                                Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child:
                                      Image.asset(IconPaths.noAttractionImage),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.5.h),
                                  child: CustomText(
                                    align: TextAlign.center,
                                    text: noActivity,
                                    fontSize: 21.sp,
                                    underline: false,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: addingTonFont,
                                    color: ColorPath.primaryColor,
                                    maxLine: 5,
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.5.h),
                                  width: double.infinity,
                                  child: ButtonIcon(
                                    onTap: () {
                                      addActivityBottomSheet(context);
                                    },
                                    buttonName: addActivity,
                                    buttonIcon: IconPaths.addIconButton,
                                    color: ColorPath.secondaryButtonColor,
                                    borderColor: ColorPath.secondaryButtonColor,
                                    textColor: ColorPath.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            // activityWidget =
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                VerticalSpace(height: 3.h),
                                state.attractionList.length <
                                        state.mainAttractionList.length
                                    ? Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.5.h),
                                        width: double.infinity,
                                        height: 5.h,
                                        child: ButtonIcon(
                                          onTap: () {
                                            addActivityBottomSheet(context);
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
                                VerticalSpace(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.5.h),
                                  child: ActivityList(
                                    itemBuilder: (context, index) {
                                      return ActivityContainer(
                                        title: state.attractionList[index].title
                                            .toString(),
                                        imageName: state
                                            .attractionList[index].thumbnail
                                            .toString(),
                                        time: state.attractionList[index]
                                                    .averageVisitLengthInMinutes !=
                                                null
                                            ? state.attractionList[index]
                                                .averageVisitLengthInMinutes!
                                            : 0,
                                        desc: state
                                            .attractionList[index].description
                                            .toString(),
                                        btnIcon: IconPaths.deleteCircleIcon,
                                        btnName: removeActivity,
                                        isActivityAdded: false,
                                        attraction: state.attractionList[index],
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => CustomDialog(
                                              title: activityDialogTitle,
                                              description: activityDialog,
                                              onTap: () {
                                                context.read<VisitBloc>().add(
                                                    VisitEvent
                                                        .removeVisitItemEvent(state
                                                                .attractionList[
                                                                    index]
                                                                .id ??
                                                            0));
                                                /*context.customSnackBar(context,
                                                    '${state.attractionList[index].title} $removeActivityPlan', '');*/
                                                showToast("${state.attractionList[index].title} $removeActivityPlan");
                                                getIt<AppRouter>().pop();
                                              },
                                              onTapNo: () {
                                                getIt<AppRouter>().pop();
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    indexItem: state.attractionList.length,
                                    isScroll: false,
                                  ),
                                ),
                                VerticalSpace(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.5.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                          color: ColorPath.containerBorderColor,
                                          width: 0.2.h),
                                    ),
                                    //height: 17.h,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(2.5.h),
                                              height: 11.h,
                                              width: 22.w,
                                              child: SvgPicture.asset(
                                                  IconPaths.planRestartImage),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 1.h, left: 1.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    /* CustomText(
                                                      text: activityDesc,
                                                      fontSize: 12.sp,
                                                      underline: false,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: interFont,
                                                      color: ColorPath.primaryColor,
                                                      maxLine: 5,
                                                    ),*/
                                                    CustomText(
                                                      text: visitTime,
                                                      fontSize: 11.sp,
                                                      underline: false,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: interFont,
                                                      color: ColorPath
                                                          .primaryColor,
                                                    ),
                                                    VerticalSpace(height: 1.h),
                                                    CustomText(
                                                      text: state.totalHours >
                                                              60
                                                          ? minutesToHoursMinutes(
                                                              state.totalHours)
                                                          : '${state.totalHours.toString()} $activityTime',
                                                      fontSize: 11.sp,
                                                      underline: false,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: interFont,
                                                      color: ColorPath
                                                          .primaryButtonColor,
                                                      maxLine: 2,
                                                    ),
                                                    /*  Row(
                                                      children: [
                                                        CustomText(
                                                          text: visitTime,
                                                          fontSize: 11.sp,
                                                          underline: false,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: interFont,
                                                          color: ColorPath.primaryColor,
                                                        ),
                                                        HorizontalSpace(
                                                            width: 1.w),
                                                        Expanded(
                                                          child: CustomText(
                                                            text: state.totalHours >
                                                                60 ? minutesToHoursMinutes(state.totalHours):'${state.totalHours.toString()} $activityTime',
                                                            fontSize: 10.sp,
                                                            underline: false,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontFamily: interFont,
                                                            color: ColorPath
                                                                .primaryColor,
                                                            maxLine: 2,
                                                          ),
                                                        ),
                                                      ],
                                                    ),*/
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 7.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 2.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorPath
                                                .containerBorderColor
                                                .withOpacity(.50),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              context.read<VisitBloc>().add(
                                                  const VisitEvent
                                                      .removeAllVisitEvent());
                                              /*context.customSnackBar(context,
                                                  removeActivityPlanWizard, okText);*/
                                              showToast(removeActivityPlanWizard);

                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                  text: planWizard,
                                                  fontSize: 14.sp,
                                                  underline: false,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: addingTonFont,
                                                  color: ColorPath.primaryColor,
                                                  maxLine: 5,
                                                ),
                                                //IconContainer(imageName: IconPaths.planRestartIcon),
                                                SizedBox(
                                                  height: 8.h,
                                                  child: SvgPicture.asset(
                                                      IconPaths
                                                          .planRestartIcon),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 3.h),
                              ],
                            ),
                          ),
                  ),
                );
              }),
            ),
            //),
          ],
        ),
      ),
    );
  }

  addActivityBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      useSafeArea: true,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.95,
      ),
      isDismissible: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            2.h,
          ),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      backgroundColor: ColorPath.bottomNavBgColor,
      context: context,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.78, //85
        child: AddActivity(),
      ),
    ).then((value) {
      context.read<VisitBloc>().add(const VisitEvent.loadVisitEvent());
    });
  }
}
