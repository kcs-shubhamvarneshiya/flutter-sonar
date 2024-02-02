import 'package:akdmvisitorsapp/common_widgets/custom_dialog.dart';
import 'package:akdmvisitorsapp/presentaion/add_screen/add_screen.dart';
import 'package:akdmvisitorsapp/presentaion/home/home_screen.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/more_screen.dart';
import 'package:akdmvisitorsapp/presentaion/visit/visit_screen.dart';
import 'package:akdmvisitorsapp/utils/BottomNavNotifier.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../model/attraction/attraction.dart';
import '../presentaion/bloc/bottombar_bloc/bottombar_bloc.dart';
import '../presentaion/bloc/bottombar_bloc/bottombar_state.dart';
import '../presentaion/bloc/bottombar_bloc/bottombar_tap_event.dart';
import '../presentaion/indoorMap/indoor_map_screen.dart';
import '../presentaion/indoorMap/logic/MapMarkerProvider.dart';
import '../router_page/app_router.dart';
import '../utils/constants.dart';
import '../utils/iconpath.dart';
import 'custom_text.dart';
import 'custome_page.dart';

@RoutePage()
class HomeBottomNav extends StatelessWidget{
  HomeBottomNav({super.key, this.initialIndex,this.attraction,this.scrollIndexValue,this.isListVisible});
  Attraction? attraction;
  int? initialIndex;
  bool? scrollIndexValue;
  bool? isListVisible;
  static const String page = "/app_screen";
  bool isExist = false;
  late AnimationController _controller;
  var selectedIndex = ValueNotifier<int>(0);
  late ValueNotifier<bool> isAddClick;
  var pref = getIt<SharedPreferences>();
  MapMarkerProvider? mapProviderRead;

  @override
  Widget build(BuildContext context) {
    mapProviderRead = context.watch<MapMarkerProvider>();
    isExist = pref.getBool(keyJSONFileDownloadPath)!;
    isAddClick = ValueNotifier<bool>(false);
    List<Widget> widgetList = [
      HomeScreen(),
      IndoorMapScreen(isLocationAttraction: attraction,isListVisible: isListVisible),
      //AddScreen(),
      VisitScreen(scrollIndexValue: scrollIndexValue),
      MoreScreen(),
    ];
    //This flag is used after redirect from visit to indoor-map set status to false not display list again.
    isListVisible=false;
    if (initialIndex != null && initialIndex! > 0) {
        selectedIndex.value = initialIndex!;
    }
    return ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, value, _) {
          return WillPopScope(
              onWillPop: () async {
                mapProviderRead!.isVisibleList = false;
                if (selectedIndex.value == 1) {
                  updateValue.isHidden.value = false;
                  selectedIndex.value = 0;
                  initialIndex = 0;
                  attraction =null;
                  scrollIndexValue =null;

                } else if (selectedIndex.value == 2) {
                  selectedIndex.value = 0;
                  attraction =null;
                  scrollIndexValue =null;

                } else if (selectedIndex.value == 3) {
                  selectedIndex.value = 0;
                  attraction =null;
                  scrollIndexValue =null;
                } else {
                  selectedIndex.value = 0;
                  _onBackPressed(context);
                }
                return false;
              },
              child: isExist
                  ? BlocBuilder<BottomBarBloc, BottomBarState>(
                      builder: (context, state) {
                        return Scaffold(
                          resizeToAvoidBottomInset: false,
                          floatingActionButton:ValueListenableBuilder<bool>(
                              valueListenable: updateValue.isHidden,
                              builder: (context, value, _) {
                              return updateValue.isHidden.value==false ? Padding(
                                      padding: EdgeInsets.only(
                                        top: 7.5.h,
                                      ),
                                      child: SizedBox(
                                        height: 45,
                                        width: 45,
                                        child: InkWell(
                                          onTap: () {
                                            isAddClick.value = true;
                                            AddScreen()
                                                .buildShowDialog(context)
                                                .then((value) {
                                              isAddClick.value = false;
                                            });
                                          },
                                          child: ValueListenableBuilder<bool>(
                                            valueListenable: isAddClick,
                                            builder: (context, value, _) {
                                              return isAddClick.value
                                                  ? SvgPicture.asset(
                                                  IconPaths.activeAddIcon)
                                                  : SvgPicture.asset(
                                                  IconPaths.addMenuIcon);
                                            },
                                          ),
                                        ),
                                      ),
                              ):Container();
                            }
                          ),
                          floatingActionButtonLocation:FloatingActionButtonLocation.miniCenterDocked,
                          extendBody: true,
                          body: isExist == true
                              ? widgetList.elementAt(selectedIndex.value)
                              : Container(),
                          bottomNavigationBar: isExist
                              ? ValueListenableBuilder<bool>(
                                  valueListenable: updateValue.isHidden,
                                  builder: (context, value, _) {
                                    return updateValue.isHidden.value == true
                                        ? Container()
                                        : Container(
                                            decoration: BoxDecoration(
                                              color: ColorPath
                                                  .containerBorderColor,
                                              border: Border(
                                                top: BorderSide(
                                                    color: ColorPath
                                                        .secondaryBrownColor,
                                                    width: 0.1.h),
                                              ),
                                            ),
                                            child: BottomAppBar(
                                              color: ColorPath.bottomNavBgColor,
                                              child: SizedBox(
                                                height: 8.h,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          IconButton(
                                                            icon: selectedIndex
                                                                        .value ==
                                                                    0
                                                                ? SvgPicture.asset(
                                                                    IconPaths
                                                                        .activeFillHomeIcon)
                                                                : SvgPicture.asset(
                                                                    IconPaths
                                                                        .homeIcon),
                                                            padding: EdgeInsets.only(bottom: 0.5.h),
                                                            constraints: const BoxConstraints(),
                                                            onPressed: () {
                                                              selectedIndex.value = 0;
                                                              pref.setString(
                                                                  keyIndex,
                                                                  selectedIndex
                                                                      .value
                                                                      .toString());
                                                              initialIndex = 0;
                                                              attraction =null ;
                                                              scrollIndexValue =null;

                                                              context
                                                                  .read<
                                                                      BottomBarBloc>()
                                                                  .add(ButtonTapEvent.tap(
                                                                      selectedIndex
                                                                          .value));
                                                             setAnalyticData(nameHome,<String, String>{});
                                                            },
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              selectedIndex.value = 0;
                                                              pref.setString(
                                                                  keyIndex,
                                                                  selectedIndex
                                                                      .value
                                                                      .toString());
                                                              initialIndex = 0;
                                                              attraction =null ;
                                                              scrollIndexValue =null;

                                                              context
                                                                  .read<
                                                                      BottomBarBloc>()
                                                                  .add(ButtonTapEvent.tap(
                                                                      selectedIndex
                                                                          .value));
                                                              setAnalyticData(nameHome,<String, String>{});

                                                            },
                                                            child: CustomText(
                                                              text: homeMenu,
                                                              fontSize: 9.0.sp,
                                                              underline: false,
                                                              fontFamily:
                                                                  interFont,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: selectedIndex
                                                                          .value ==
                                                                      0
                                                                  ? ColorPath
                                                                      .bottomNavActiveItemColor
                                                                  : ColorPath
                                                                      .primaryColor,
                                                              maxLine: 1,
                                                              align: TextAlign
                                                                  .start,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          selectedIndex.value =
                                                              1;
                                                          attraction =null ;
                                                          scrollIndexValue =null;

                                                          pref.setString(
                                                              keyIndex,
                                                              selectedIndex
                                                                  .value
                                                                  .toString());
                                                          initialIndex = 0;
                                                          context
                                                              .read<
                                                                  BottomBarBloc>()
                                                              .add(ButtonTapEvent
                                                                  .tap(selectedIndex
                                                                      .value));

                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            IconButton(
                                                              icon: selectedIndex.value == 1
                                                                  ? SvgPicture.asset(
                                                                      IconPaths
                                                                          .activeMapIcon)
                                                                  : SvgPicture.asset(
                                                                      IconPaths
                                                                          .mapIcon),
                                                              onPressed: () {
                                                                mapProviderRead!
                                                                        .isVisibleList =
                                                                    false;
                                                                selectedIndex
                                                                    .value = 1;
                                                                initialIndex =
                                                                    0;
                                                                pref.setString(
                                                                    keyIndex,
                                                                    selectedIndex
                                                                        .value
                                                                        .toString());
                                                                attraction =null ;
                                                                scrollIndexValue =null;

                                                                context
                                                                    .read<
                                                                        BottomBarBloc>()
                                                                    .add(ButtonTapEvent.tap(
                                                                        selectedIndex
                                                                            .value));
                                                                setAnalyticData(nameMap,<String, String>{});

                                                              },
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          0.5.h),
                                                              constraints:
                                                                  const BoxConstraints(),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                mapProviderRead!
                                                                        .isVisibleList =
                                                                    false;
                                                                selectedIndex
                                                                    .value = 1;
                                                                initialIndex =
                                                                    0;
                                                                pref.setString(
                                                                    keyIndex,
                                                                    selectedIndex
                                                                        .value
                                                                        .toString());
                                                                attraction =null ;
                                                                scrollIndexValue =null;

                                                                context
                                                                    .read<
                                                                        BottomBarBloc>()
                                                                    .add(ButtonTapEvent.tap(
                                                                        selectedIndex
                                                                            .value));
                                                               setAnalyticData(nameMap,<String, String>{});

                                                              },
                                                              child: CustomText(
                                                                text: mapMenu,
                                                                fontSize:
                                                                    9.0.sp,
                                                                underline:
                                                                    false,
                                                                fontFamily:
                                                                    interFont,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: selectedIndex
                                                                            .value ==
                                                                        1
                                                                    ? ColorPath
                                                                        .bottomNavActiveItemColor
                                                                    : ColorPath
                                                                        .primaryColor,
                                                                maxLine: 1,
                                                                align: TextAlign
                                                                    .start,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          IconButton(
                                                            icon: selectedIndex
                                                                        .value ==
                                                                    2
                                                                ? SvgPicture.asset(
                                                                    IconPaths
                                                                        .activeVisitIcon)
                                                                : SvgPicture.asset(
                                                                    IconPaths
                                                                        .visitIcon),
                                                            onPressed: () {
                                                              mapProviderRead!
                                                                      .isVisibleList =
                                                                  false;
                                                              attraction =null ;
                                                              scrollIndexValue =null;

                                                              selectedIndex
                                                                  .value = 2;
                                                              pref.setString(
                                                                  keyIndex,
                                                                  selectedIndex
                                                                      .value
                                                                      .toString());
                                                              initialIndex = 0;

                                                              context
                                                                  .read<
                                                                      BottomBarBloc>()
                                                                  .add(ButtonTapEvent.tap(
                                                                      selectedIndex
                                                                          .value));
                                                              setAnalyticData(nameVisit,<String, String>{});

                                                            },
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        0.5.h),
                                                            constraints:
                                                                const BoxConstraints(),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              mapProviderRead!
                                                                      .isVisibleList =
                                                                  false;
                                                              selectedIndex
                                                                  .value = 2;
                                                              attraction =null ;
                                                              scrollIndexValue =null;

                                                              pref.setString(
                                                                  keyIndex,
                                                                  selectedIndex
                                                                      .value
                                                                      .toString());
                                                              initialIndex = 0;
                                                              context
                                                                  .read<
                                                                      BottomBarBloc>()
                                                                  .add(ButtonTapEvent.tap(
                                                                      selectedIndex
                                                                          .value));
                                                              setAnalyticData(nameVisit,<String, String>{});

                                                            },
                                                            child: CustomText(
                                                              text: visitMenu,
                                                              fontSize: 9.0.sp,
                                                              underline: false,
                                                              fontFamily:
                                                                  interFont,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: selectedIndex
                                                                          .value ==
                                                                      2
                                                                  ? ColorPath
                                                                      .bottomNavActiveItemColor
                                                                  : ColorPath
                                                                      .primaryColor,
                                                              maxLine: 1,
                                                              align: TextAlign
                                                                  .start,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          IconButton(
                                                            icon: selectedIndex
                                                                        .value ==
                                                                    3
                                                                ? SvgPicture.asset(
                                                                    IconPaths
                                                                        .activeMenuIcon)
                                                                : SvgPicture.asset(
                                                                    IconPaths
                                                                        .menuIcon),
                                                            onPressed: () {
                                                              mapProviderRead!
                                                                      .isVisibleList =
                                                                  false;
                                                              selectedIndex
                                                                  .value = 3;
                                                              pref.setString(
                                                                  keyIndex,
                                                                  selectedIndex
                                                                      .value
                                                                      .toString());
                                                              initialIndex = 0;
                                                              attraction =null ;
                                                              scrollIndexValue =null;

                                                              context
                                                                  .read<
                                                                      BottomBarBloc>()
                                                                  .add(ButtonTapEvent.tap(
                                                                      selectedIndex
                                                                          .value));
                                                             setAnalyticData(nameMore,<String, String>{});

                                                            },
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        0.5.h),
                                                            constraints:
                                                                const BoxConstraints(),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              mapProviderRead!.isVisibleList =
                                                                  false;
                                                              selectedIndex
                                                                  .value = 3;
                                                              pref.setString(
                                                                  keyIndex,
                                                                  selectedIndex
                                                                      .value
                                                                      .toString());
                                                              initialIndex = 0;
                                                              attraction =null ;
                                                              scrollIndexValue =null;

                                                              context
                                                                  .read<
                                                                      BottomBarBloc>()
                                                                  .add(ButtonTapEvent.tap(
                                                                      selectedIndex
                                                                          .value));
                                                              setAnalyticData(nameMore,<String, String>{});

                                                            },
                                                            child: CustomText(
                                                              text: moreMenu,
                                                              fontSize: 9.0.sp,
                                                              underline: false,
                                                              fontFamily:
                                                                  interFont,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: selectedIndex
                                                                          .value ==
                                                                      3
                                                                  ? ColorPath
                                                                      .bottomNavActiveItemColor
                                                                  : ColorPath
                                                                      .primaryColor,
                                                              maxLine: 1,
                                                              align: TextAlign
                                                                  .start,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                  })
                              : Center(
                                  child: CustomPage(
                                    imageName: IconPaths.somethingWrongIcon,
                                    btnTitle: tryAgainMessage,
                                    description: somethingWrongMessage,
                                    onTap: () {},
                                  ),
                                ),
                        );
                      },
                    )
                  : Center(
                      child: CustomPage(
                        imageName: IconPaths.somethingWrongIcon,
                        btnTitle: tryAgainMessage,
                        description: somethingWrongMessage,
                        onTap: () {},
                      ),
                    ));
        });
  }

  Future<bool?> _onBackPressed(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => CustomDialog(
              title: "",
              description: exit,
              isNotification: true,
              onTap: () {
                SystemNavigator.pop();
              },
              onTapNo: () {
                getIt<AppRouter>().pop(false);
              },
            ));
  }
}
