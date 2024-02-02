// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/no_attraction.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/fancyShimmerCachedImage.dart';
import '../../utils/constants.dart';
import '../../utils/iconpath.dart';
import '../../utils/strings.dart';
import '../bloc/attraction_filter_bloc/attraction_change_event.dart';
import '../bloc/attraction_filter_bloc/attraction_filter_bloc.dart';
import '../bloc/attraction_filter_bloc/attraction_state.dart';
import '../indoorMap/logic/MapMarkerProvider.dart';

@RoutePage()
class MapAttractionListScreen extends StatelessWidget {
  MapAttractionListScreen({super.key,this.onTap});//this.attractionTypeList
  Widget? displayWidget;
  Function(Attraction)? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttractionFilterBloc, AttractionState>(
      builder: (context, state) {
        // Below lines will remove the null from the attraction list and sort according to displayOrder > exploreList
        return (state.attractionList.isNotEmpty)
            ? SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                VerticalSpace(height: 10.h),
                //Akshardham Lists
                Padding(
                  padding: EdgeInsets.only(bottom: 7.h),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                    const VerticalSpace(height: 20),
                    shrinkWrap: true,
                    itemCount:state.attractionList.length,
                    itemBuilder: (context, index) {
                      var timeDuration=state.attractionList[index].averageVisitLengthInMinutes != null ? state.attractionList[index].averageVisitLengthInMinutes!.toInt():0;
                      return GestureDetector(
                        onTap: () {
                          Map<String, dynamic> attractionParameter = {
                            'type': state.attractionList[index].id.toString(),
                            'name':state.attractionList[index].title.toString(),
                          };
                          setAnalyticData(nameAttractionDetail, attractionParameter);
                          Attraction? selectedAttraction =state.attractionList.firstWhere((element) => element.id == state.attractionList[index].id);
                          getIt<AppRouter>().push(AttractionDetailsRoute(appJsonModel: [selectedAttraction]));
                        },
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 2.h,
                                  right: 2.h,
                                  top: 2.h,
                                  bottom: 2.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorPath.containerBorderColor),
                                color: ColorPath.containerBorderColor
                                    .withOpacity(.20),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(1.h),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 11.h,
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      child: FancyShimmerCachedImage(
                                        imageUrl:state.attractionList[index].thumbnail.toString() ?? "",
                                          boxFit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        errorWidget: Image.asset(
                                            IconPaths.placeholderImage),
                                        width: 26.w,
                                      ),
                                    ),
                                  ),
                                  HorizontalSpace(width: 3.h),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: state.attractionList[index].title!.toUpperCase(),
                                          fontSize: 13.sp,
                                          underline: false,
                                          fontFamily: addingTonFont,
                                          fontWeight: FontWeight.w300,
                                          color: ColorPath.primaryColor,
                                          maxLine: 3,
                                          overflow: TextOverflow.ellipsis,
                                          letterSpacing: 1.5,
                                        ),
                                        VerticalSpace(height: 0.5.h),
                                        ElevatedButton(
                                            onPressed:() {
                                              context.read<AttractionFilterBloc>().add(AttractionChangeEventData(false,state.currentIndex!,state.value.toString(),false));
                                              onTap!(state.attractionList[index]);
                                            },//startNavigationCallback!(state.attractionList[index]),
                                            style: ElevatedButton
                                                .styleFrom(
                                                shape:RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                backgroundColor: ColorPath.secondaryButtonColor),
                                            child: CustomText(
                                              text: navigate,
                                              fontSize: 12.sp,
                                              underline: false,
                                              fontFamily: interFont,
                                              fontWeight:
                                              FontWeight.w400,
                                              color: ColorPath.whiteColor,
                                            )),
                                        VerticalSpace(height: 0.5.h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              //text: 'Duration: ${state.attractionList[index].averageVisitLengthInMinutes.toString() ?? ''} min',
                                              text:'$duration: ',
                                              fontSize: 12.sp,
                                              underline: false,
                                              fontWeight: FontWeight.normal,
                                              color: ColorPath.liteGrayColor
                                                  .withOpacity(.30),
                                              maxLine: 2,
                                              fontFamily: interFont,
                                            ),
                                            CustomText(
                                              text: timeDuration > 60 ? minutesToHoursMinutes(timeDuration):'${timeDuration.toString()} $activityTime',
                                              fontSize: 12.sp,
                                              underline: false,
                                              fontWeight: FontWeight.normal,
                                              color: ColorPath.liteGrayColor
                                                  .withOpacity(.30),
                                              maxLine: 2,
                                              fontFamily: interFont,
                                            ),
                                          ],
                                        ),

                                        VerticalSpace(height: 1.h),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
            : SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const NoAttractionScreen());
      },
    );
  }
}
