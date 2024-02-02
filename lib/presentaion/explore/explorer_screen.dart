// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:akdmvisitorsapp/common_widgets/attractionType_tab.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_appbar.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/no_attraction.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/indoor_map_screen.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/BottomNavNotifier.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/fancyShimmerCachedImage.dart';
import '../../utils/iconpath.dart';
import '../../utils/strings.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';
import '../indoorMap/logic/MapMarkerProvider.dart';



@RoutePage()
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const String page = '/explorerScreen';

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  Set<String?> attractionTypeList = <String?>{};
  List<Attraction>? allAttractionList = [];
  ValueNotifier<List<Attraction>?> filteredAttractionList = ValueNotifier([]);
  PersistentBottomSheetController<void>? bottomSheetController;
  int pos = 0;
  ValueNotifier<int> selectedAttractionIdForNavigate = ValueNotifier(0);
  MapMarkerProvider get mapProviderRead => context.read<MapMarkerProvider>();
  MapMarkerProvider? mapProviderWatch;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController?.addListener(() {
      setState(() {
        pos = tabController!.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  void getFilteredValuesForTab(List<Attraction>? attractionList) {
    attractionTypeList.add(allText);
    if(attractionList != null){
      attractionList.sort((a, b) => a.attractionType.toString().toLowerCase().compareTo(b.attractionType.toString().toLowerCase()));
      for (var element in attractionList) {
        attractionTypeList.add(element.attractionType);
      }
      attractionTypeList.removeWhere((value) => value == null);
    }
  }

  void getAttractionListByFilter(String attractionType) {
    if (attractionType == allText) {
      filteredAttractionList.value = allAttractionList;
    } else {
      filteredAttractionList.value = allAttractionList?.where((element) {
        return element.attractionType == attractionType;
      }).toList();
      print("getAttractionListByFilter::${attractionType} (${filteredAttractionList.value?.length})");
    }
  }

  Widget? displayWidget;

  @override
  Widget build(BuildContext context) {
    mapProviderWatch = context.watch<MapMarkerProvider>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorPath.homeBgColor,
      appBar: CustomAppBar(isNotification: true),
      // widgets of screen
      body: BlocProvider<AppJsonBloc>(
    create: (context) =>
        GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
    child: BlocBuilder<AppJsonBloc, AppJsonState>(
      builder: (context, state) {
        state.when(
          //loading state
          loading: () {
            displayWidget =
                const Center(child: CircularProgressIndicator());
          },
          //loaded state
          loaded: (appJsonData) {
            // Below lines will remove the null from the attraction list and sort according to displayOrder > exploreList
            appJsonData.attractions?.removeWhere(
                (element) => element.displayOrder?.exploreList == null);
            appJsonData.attractions?.sort((a, b) {
              var aEL = a.displayOrder?.exploreList;
              var bEL = b.displayOrder?.exploreList;
              return (aEL ?? 0).compareTo((bEL ?? 0));
            });
            filteredAttractionList.value =
                allAttractionList = appJsonData.attractions;
            getFilteredValuesForTab(allAttractionList);
            displayWidget = (allAttractionList!.isNotEmpty) ? Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ValueListenableBuilder<int>(
                          valueListenable: selectedAttractionIdForNavigate,
                          builder: (context, value, _) {
                            return Container(
//                                margin: EdgeInsets.only(bottom: 8.h),
                                padding: EdgeInsets.all(2.h),
                                child: (selectedAttractionIdForNavigate.value == 0) ?
                                 IndoorMapScreen():
                                IndoorMapScreen(initialObjectId: "${selectedAttractionIdForNavigate.value}"),
                              );
                            }
                        ),
                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              VerticalSpace(height: 14.h),
                              Row(
                                children: [
                                  HorizontalSpace(width: 3.w),
                                  CustomText(
                                    text: attraction,
                                    fontSize: 20.sp,
                                    underline: false,
                                    fontFamily: addingTonFont,
                                    fontWeight: FontWeight.w300,
                                    color: ColorPath.primaryColor,
                                  ),
                                   Expanded(
                                     child: Container(
                                        alignment: Alignment.centerRight,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.h, vertical: 1.h),
                                        child: ButtonIcon(
                                          onTap: () {
                                            getIt<AppRouter>().push(
                                              const SelectAttractionsScreenRoute(),
                                            );
                                          },
                                          buttonIcon: IconPaths.checkCircleIcon,
                                          buttonName: select,
                                          textDirection: TextDirection.ltr,
                                          borderColor: ColorPath.primaryButtonColor,
                                        ),
                                      ),
                                   ),

                                ],
                              ),
                              VerticalSpace(height: 2.h),
                              //AKDM Container Details
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: ColorPath.activityBgColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: CustomText(
                                    text: akdmAttraction.toUpperCase(),
                                    fontSize: 16.sp,
                                    underline: false,
                                    fontFamily: addingTonFont,
                                    fontWeight: FontWeight.w300,
                                    color: ColorPath.primaryColor,
                                    letterSpacing: 2,
                                    maxLine: 3,
                                  ),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(top: 1.h),
                                    child: CustomText(
                                      text: dummyPlanText,
                                      fontSize: 11.sp,
                                      underline: false,
                                      fontFamily: interFont,
                                      fontWeight: FontWeight.w400,
                                      color: ColorPath.primaryColor,
                                      maxLine: 5,
                                    ),
                                  ),
                                ),
                              ),
                              VerticalSpace(height: 2.5.h),
                              //Tab bar
                            AttractionTypeTab(
                                attractionTypeList, 0,
                                    (index) {
                                  getAttractionListByFilter(
                                      "${attractionTypeList.elementAt(index)}");
                                }),
                              VerticalSpace(height: 2.5.h),
                              //Akshardham Lists
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: ValueListenableBuilder<
                                    List<Attraction>?>(
                                    valueListenable: filteredAttractionList,
                                    builder: (context, value, _) {
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        physics:
                                        const NeverScrollableScrollPhysics(),
                                        separatorBuilder: (context, index) =>
                                        const VerticalSpace(height: 20),
                                        shrinkWrap: true,
                                        itemCount: filteredAttractionList
                                            .value!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.only(
                                                    left: 2.5.h,
                                                    right: 2.5.h,
                                                    top: 2.5.h,
                                                    bottom: 1.h),
                                                decoration: BoxDecoration(
                                                  color: ColorPath.activityBgColor,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        1.5.h),
                                                    topRight: Radius.circular(
                                                        1.5.h),
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    SizedBox(
                                                      height: 20.h,
                                                      width: double.infinity,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(10),
                                                        child:FancyShimmerCachedImage(
                                                          imageUrl:filteredAttractionList
                                                              .value![index]
                                                              .thumbnail
                                                              .toString() ?? "",
                                                          boxFit: BoxFit.fill,
                                                          errorWidget: Image.asset(IconPaths.placeholderImage),
                                                          width: MediaQuery.of(context).size.width,
                                                        ),
                                                      ),
                                                    ),
                                                    VerticalSpace(
                                                        height: 1.5.h),
                                                    Align(
                                                      alignment: Alignment
                                                          .centerRight,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          updateValue.isHidden.value = true;
                                                          selectedAttractionIdForNavigate.value = (filteredAttractionList.value![index].id)!;
                                                          tabController!.index = 0;
                                                          //getIt<AppRouter>().push(IndoorMapScreenRoute(initialObjectId: filteredAttractionList.value![index].id.toString()));
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                            backgroundColor:
                                                            ColorPath.bottomNavSelectedItemColor),
                                                        child: CustomText(
                                                          text: navigate,
                                                          fontSize: 12.sp,
                                                          underline: false,
                                                          fontFamily:
                                                          interFont,
                                                          fontWeight:
                                                          FontWeight.w400,
                                                          color: ColorPath.whiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                    VerticalSpace(
                                                        height: 1.5.h),
                                                    CustomText(
                                                      text:
                                                      filteredAttractionList
                                                          .value![index]
                                                          .title!
                                                          .toUpperCase(),
                                                      fontSize: 13.sp,
                                                      underline: false,
                                                      fontFamily:
                                                      addingTonFont,
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      color: ColorPath.primaryColor,
                                                      maxLine: 2,
                                                      letterSpacing: 1.5,
                                                    ),
                                                    VerticalSpace(
                                                        height: 1.5.h),
                                                    CustomText(
                                                      text:
                                                      '${filteredAttractionList.value![index].description ?? ''}',
                                                      fontSize: 12.sp,
                                                      underline: false,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      color: ColorPath.primaryColor,
                                                      maxLine: 3,
                                                    ),
                                                    VerticalSpace(
                                                        height: 1.h),
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                //Navigate to Details page
                                                onTap: () {
                                                  getIt<AppRouter>().push(
                                                    AttractionDetailsRoute(
                                                      appJsonModel: [
                                                        filteredAttractionList
                                                            .value![index]
                                                      ],
                                                    ),
                                                  ).then((value) {
                                                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                                                  });
                                                },
                                                child: Container(
                                                  height: 7.h,
                                                  padding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 2.5.h),
                                                  decoration:
                                                  const BoxDecoration(
                                                    color: ColorPath.planSubContainer,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(10),
                                                      bottomRight:
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        CustomText(
                                                          text: knowMore,
                                                          fontSize: 14.sp,
                                                          underline: false,
                                                          fontWeight:
                                                          FontWeight.w300,
                                                          fontFamily:
                                                          addingTonFont,
                                                          color: ColorPath.primaryColor,
                                                          maxLine: 5,
                                                        ),
                                                        Container(
                                                          height: 5.h,
                                                          width: 7.w,
                                                          padding:
                                                          EdgeInsets.all(
                                                              1.h),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                              vertical:
                                                              1.h),
                                                          decoration:
                                                          const BoxDecoration(
                                                            shape: BoxShape
                                                                .circle,
                                                            color:
                                                            ColorPath.primaryColor,
                                                          ),
                                                          child: SvgPicture
                                                              .asset(IconPaths
                                                              .rightDoubleIcon),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  mapProviderWatch!.isBottomSheetSelected == true
                      ? Visibility(visible: false, child: setMapTab())
                      : Visibility(visible: true, child: setMapTab()),
                ],
              ) : const NoAttractionScreen();
            },
            //error state
            error: (error) => displayWidget = CustomText(
              text: error,
              fontSize: 13.sp,
              underline: false,
              fontWeight: FontWeight.w500,
              color: ColorPath.primaryColor,
            ),
          );
          return displayWidget!;
        },
      ),
      ),
    );

    /*Center(
      child: CustomText(
        text: exploreMenu,
        fontSize: 16.sp,
        underline: false,
        fontWeight: FontWeight.w500,
        color: ColorPath.primaryColor,
      ),
    ),
    );*/
  }

  Widget setMapTab()=>Positioned(
      bottom: (Platform.isIOS) ? 13.h : 10.h,
      left: 2.5.h,
      child:Container(
        width: 160,
        height: 50,
        decoration: BoxDecoration(
            color: ColorPath.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(.8.h),
        // margin: const EdgeInsets.only(bottom: 80, left: 20),
        child: TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.symmetric(horizontal: 0.5.h),
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          onTap: (index) {
            selectedAttractionIdForNavigate.value = 0;
            setState(() {
              tabController!.index = index;
            });
          },
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorPath.whiteColor,
          ),
          tabs: [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: mapTab,
                    fontSize: 10.sp,
                    underline: false,
                    fontFamily: interFont,
                    fontWeight: FontWeight.w400,
                    color: tabController!.index == 0
                        ? ColorPath.primaryColor
                        : ColorPath.whiteColor,
                  ),
                  HorizontalSpace(width: 2.w),
                  SvgPicture.asset(tabController!.index == 0
                      ? IconPaths.activeMapIcons
                      : IconPaths.inActiveMapIcon)
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: listTab,
                    fontSize: 10.sp,
                    underline: false,
                    fontFamily: interFont,
                    fontWeight: FontWeight.w400,
                    color: tabController!.index == 1
                        ? ColorPath.primaryColor
                        : ColorPath.whiteColor,
                  ),
                  HorizontalSpace(width: 2.w),
                  SvgPicture.asset(tabController!.index == 1
                      ? IconPaths.activeListIcon
                      : IconPaths.inActiveListIcon)
                ],
              ),
            ),

          ],
        ),
      )
  );

}
