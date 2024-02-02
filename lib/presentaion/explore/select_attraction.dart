// ignore_for_file: must_be_immutable
import 'dart:convert';

import 'package:akdmvisitorsapp/common_widgets/attractionType_tab.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_dialog.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../router_page/app_router.dart';
import '../../utils/functions.dart';
import '../../utils/iconpath.dart';
import '../../utils/strings.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

@RoutePage()
class SelectAttractionsScreen extends StatefulWidget {
  const SelectAttractionsScreen({Key? key}) : super(key: key);
  static const String page = '/selectAttractionScreen';

  @override
  State<SelectAttractionsScreen> createState() =>
      _SelectAttractionsScreenState();
}

class _SelectAttractionsScreenState extends State<SelectAttractionsScreen> {
  List<Attraction> selectedItems = [];
  List<Attraction> filteredList = [];
  SharedPreferences? sharedPreferences;
  Set<String?> attractionTypeList = <String?>{};
  List<Attraction>? allAttractionList = [];
  ValueNotifier<List<Attraction>?> filteredAttractionList = ValueNotifier([]);
  int selectedAttractionTypeTabIndex = 0;

  @override
  void initState() {
    setState(() {});
    loadSharedPreferences();
    super.initState();
    selectedAttractionTypeTabIndex = 0;
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
  loadSharedPreferences() async {
    sharedPreferences = getIt<SharedPreferences>();
    loadData();
  }

  Future<List<Attraction>> loadData() async {
    List? listString = sharedPreferences!.getStringList(keyAttractionListForPlanPref);
    if (listString != null) {
      setState(() {
        filteredList = listString
            .map((item) => Attraction.fromJson(json.decode(item)))
            .toList();
      });
    }
    return filteredList;
  }

  void saveData() {
    for(var i = 0; i < selectedItems.length; i++){
      saveAttractionInPlan(selectedItems[i]);
    }
    context.customSnackBar(
        context, selectedActivityAddedPlan,
        okText);
    getIt<AppRouter>().pop();
  }

  Future<void> saveAttractionInPlan(Attraction attraction) async{
    SharedPreferences? sharedPreferences = getIt<SharedPreferences>();
    List? listString = sharedPreferences!.getStringList(keyAttractionListForPlanPref);
    if (listString != null) {
      List<Attraction> savedAttractionList = listString.map((item) => Attraction.fromJson(json.decode(item))).toList();
      bool isExisted = savedAttractionList.map((item) => item.id).contains(attraction.id);
      if(!isExisted){
        savedAttractionList.add(attraction);
        List<String> updatedActivityLists =
        savedAttractionList.map((item) => jsonEncode(item.toJson())).toList();
        sharedPreferences.setStringList(keyAttractionListForPlanPref, updatedActivityLists);
      }
    }else{
      List<String> updatedPlanLists = [jsonEncode(attraction.toJson())];
      sharedPreferences!.setStringList(keyAttractionListForPlanPref, updatedPlanLists);
    }
  }

  Widget? displayWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppJsonBloc>(
      create: (context) =>
          GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
      child: BlocBuilder<AppJsonBloc, AppJsonState>(
        builder: (context, state) {
          state.when(
            //loading state
            loading: () {
              displayWidget = const Center(child: CircularProgressIndicator());
            },
            //loaded state
            loaded: (appJsonData) {
              // Below lines will remove the null from the attraction list which has null value for exploreList and visitPlanner
              // and sort according to displayOrder > exploreList
              appJsonData.attractions?.removeWhere((element) => (element.displayOrder?.exploreList == null || element.displayOrder?.visitPlanner == null));
              appJsonData.attractions?.sort((a,b){
                var aEL = a?.displayOrder?.exploreList;
                var bEL = b?.displayOrder?.exploreList;
                return (aEL ?? 0).compareTo((bEL ?? 0));
              });
              filteredAttractionList.value =
                  allAttractionList = appJsonData.attractions;
              getFilteredValuesForTab(allAttractionList);
              getAttractionListByFilter("${attractionTypeList.elementAt(selectedAttractionTypeTabIndex)}");
              displayWidget = Scaffold(
                backgroundColor: ColorPath.homeBgColor,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: Align(
                    child: SizedBox(
                      height: 20,
                      child: GestureDetector(
                        onTap: () => getIt<AppRouter>().pop(),
                        child: SvgPicture.asset(IconPaths.crossIcon),
                      ),
                    ),
                  ),
                  title: Container(
                    //transform: Matrix4.translationValues(0.0, 00, 0.0),
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: '${selectedItems.length} $selectedText',
                      fontSize: 20.sp,
                      underline: false,
                      fontFamily: addingTonFont,
                      fontWeight: FontWeight.w300,
                      color: ColorPath.primaryColor,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      VerticalSpace(height: 3.h),
                      Container(
                        padding: const EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(horizontal: 2.5.h),
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
                              fontSize: 12.sp,
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
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.5.h),
                        child: AttractionTypeTab(
                            attractionTypeList, selectedAttractionTypeTabIndex,
                                (index) {
                              //selectedAttractionType = attractionTypeList.elementAt(index);
                              selectedAttractionTypeTabIndex = index;
                              getAttractionListByFilter(
                                  "${attractionTypeList.elementAt(index)}");
                            }),
                      ),
                      VerticalSpace(height: 2.5.h),
                      //Akshardham Lists
                      Container(
                        padding: EdgeInsets.only(bottom: 1.h),
                        margin: EdgeInsets.symmetric(horizontal: 2.5.h),
                        child: ValueListenableBuilder<
                            List<Attraction>?>(
                            valueListenable: filteredAttractionList,
                            builder: (context, value, _) {
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              separatorBuilder: (context, index) =>
                                  const VerticalSpace(height: 20),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: filteredAttractionList
                                  .value!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          print("Selected Item: ${filteredAttractionList.value![index].title}");
                                          if (selectedItems.contains(filteredAttractionList.value![index])) {
                                            selectedItems.remove(filteredAttractionList.value![index]);
                                           } else {
                                            selectedItems.add(filteredAttractionList.value![index]);
                                           }
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(2.5.h),
                                        decoration: BoxDecoration(
                                          color: ColorPath.activityBgColor,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: selectedItems.contains(filteredAttractionList.value![index])
                                                  ? ColorPath.dialogTextColor
                                                  : ColorPath.activityBgColor),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                  width: double.infinity,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    child:FancyShimmerCachedImage(
                                                      imageUrl: filteredAttractionList
                                                          .value![index]
                                                          .thumbnail
                                                          .toString() ?? "",
                                                      boxFit: BoxFit.fill,
                                                      errorWidget: Image.asset(IconPaths.placeholderImage),
                                                      width: MediaQuery.of(context).size.width,
                                                    ),
                                                  ),
                                                ),
                                                selectedItems.contains(filteredAttractionList
                                                    .value![index])
                                                    ? SvgPicture.asset(
                                                    IconPaths.selectedAttractionIcon)
                                                    : const SizedBox(),
                                              ],
                                            ),
                                            VerticalSpace(height: 1.5.h),
                                            CustomText(
                                              text: filteredAttractionList
                                                  .value![index].title!
                                                  .toUpperCase(),
                                              fontSize: 13.sp,
                                              underline: false,
                                              fontFamily: addingTonFont,
                                              fontWeight: FontWeight.w300,
                                              color: ColorPath.primaryColor,
                                              maxLine: 2,
                                              letterSpacing: 1.5,
                                            ),
                                            VerticalSpace(height: 1.5.h),
                                            CustomText(
                                              text:
                                                  '${timeRemain(10)}. ${filteredAttractionList
                                                      .value![index].description ?? ''}',
                                              fontSize: 12.sp,
                                              underline: false,
                                              fontWeight: FontWeight.normal,
                                              color: ColorPath.primaryColor,
                                              maxLine: 3,
                                            ),
                                            VerticalSpace(height: 1.h),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: ColorPath.buttonOutlineColor.withOpacity(.2),
                    border: const Border.symmetric(
                      horizontal: BorderSide(color: ColorPath.buttonOutlineColor),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonIcon(
                        onTap: () {
                          setState(() {});
                          selectedItems.isEmpty
                              ? context.customSnackBar(
                              context, selectActivity, okText)
                              : showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              title: addToVisit,
                              description: addToActivityCount(
                                  selectedItems.length),
                              onTap: () {
                                saveData();
                                getIt<AppRouter>().pop();
                              },
                              onTapNo: (){
                                getIt<AppRouter>().pop();
                              },
                            ),
                          );
                        },
                        buttonName: addPlan,
                        buttonIcon: IconPaths.addIconButton,
                        color: ColorPath.bottomNavSelectedItemColor,
                        textColor: ColorPath.whiteColor,
                        borderColor: ColorPath.bottomNavSelectedItemColor,
                      ),
                    ],

                  ),
                ),
              );
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

      // bottomNavigationBar:
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
}
