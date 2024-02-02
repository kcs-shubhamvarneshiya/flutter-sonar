import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_filter_bloc.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/widgets.dart';
import '../../utils/colors.dart';
import '../../utils/iconpath.dart';
import '../bloc/attraction_filter_bloc/attraction_change_event.dart';
import '../bloc/attraction_filter_bloc/attraction_state.dart';
import 'logic/MapMarkerProvider.dart';

class AttractionFilter extends StatelessWidget {
  AttractionFilter({super.key, required this.attractionTypeList, this.getSelectedItem,this.attractionList});

  bool? isSelectAttraction = false;
  String? selectedAttractionValue;
  List<String?> attractionTypeList = [];
  List<Attraction>? attractionList = [];
  int selectedIndex = 0;
  Function(String,int)? getSelectedItem;
  late MapMarkerProvider mapProviderRead;
  final ScrollController scrollController = ScrollController();
  Widget mainContainer(BuildContext context, String defaultAttraction) {
    return Container(
      height: 3.h,
      margin: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
      child: Row(
        children: [
          Expanded(flex:1,child: Container()),
          Expanded(
            flex: 2,
              child: GestureDetector(
                onTap: () {
                  if (!isSelectAttraction!) {
                    isSelectAttraction = true;
                    mapProviderRead.attractionValueUpdate(true);
                    context.read<AttractionFilterBloc>().add(
                        AttractionChangeEventData(isSelectAttraction!,
                            selectedIndex, selectedAttractionValue!,mapProviderRead.isVisibleList!));
                  } else {
                    isSelectAttraction = false;
                    mapProviderRead.attractionValueUpdate(false);
                    context.read<AttractionFilterBloc>().add(
                        AttractionChangeEventData(isSelectAttraction!,
                            selectedIndex, selectedAttractionValue!,mapProviderRead.isVisibleList!));
                  }
                },
                child: Center(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: selectedAttractionValue!.isNotEmpty
                              ?   selectedAttractionValue!.length > 15 ? '${selectedAttractionValue!.substring(0, 10)}...' : selectedAttractionValue : defaultAttraction,//allText
                          /*selectedAttractionValue.toString()*/
                          style: TextStyle(
                              color: ColorPath.blackprimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              fontFamily: interFont),
                        ),
                        WidgetSpan(child: HorizontalSpace(width: 1.0.h)),
                        WidgetSpan(child: ClipOval(
                          child: Material(
                            color: ColorPath.blackprimary, // Button color
                            child: InkWell(
                              onTap:(){
                                if (!isSelectAttraction!) {
                                  isSelectAttraction = true;
                                  mapProviderRead.attractionValueUpdate(true);
                                  context.read<AttractionFilterBloc>().add(
                                      AttractionChangeEventData(isSelectAttraction!,
                                          selectedIndex, selectedAttractionValue!,mapProviderRead.isVisibleList!));
                                } else {
                                  isSelectAttraction = false;
                                  mapProviderRead.attractionValueUpdate(false);
                                  context.read<AttractionFilterBloc>().add(
                                      AttractionChangeEventData(isSelectAttraction!,
                                          selectedIndex, selectedAttractionValue!,mapProviderRead.isVisibleList!));
                                }
                              },
                              child: isSelectAttraction != true
                                  ? Icon(Icons.expand_more,
                                  color: ColorPath.whiteColor, size: 2.3.h)
                                  : Icon(Icons.expand_less,
                                  color: ColorPath.whiteColor, size: 2.3.h),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap:() {
                getAttractionListByFilter(attractionTypeList[0].toString());//allText
                mapProviderRead.attractionValueUpdate(false);
                if(mapProviderRead.isVisibleList==false){
                  mapProviderRead.setMapListVisibility(true);
                  context.read<AttractionFilterBloc>().add(AttractionChangeEventData(false,0,'',mapProviderRead.isVisibleList!));//allText
                }else{
                  mapProviderRead.setMapListVisibility(false);
                  context.read<AttractionFilterBloc>().add(AttractionChangeEventData(false,0,'',mapProviderRead.isVisibleList!));//allText
                }
              },
              child: Container(
                padding: EdgeInsets.only(right: 2.h),
                width: 12.h,
                child: CustomText(
                  text:mapProviderRead.isVisibleList==false ? showList:hideList,
                  fontFamily: interFont,
                  fontSize: 11.sp,
                  underline: false,
                  align: TextAlign.end,
                  fontWeight: FontWeight.w400,
                  color: ColorPath.primaryButtonColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /*void getAttractionListByFilter(String attractionType) {
    if (attractionType == allText) {
      mapProviderRead.selectMapFilter(null);
    } else {
      mapProviderRead.selectMapFilter(attractionType);
    }
  }*/
  void getAttractionListByFilter(String attractionType) {
    mapProviderRead.selectMapFilter(attractionType);
  }

  @override
  Widget build(BuildContext context) {
    mapProviderRead = context.read<MapMarkerProvider>();
    return BlocBuilder<AttractionFilterBloc, AttractionState>(
        builder: (context, state) {
          isSelectAttraction = state.checked;
          selectedIndex = state.currentIndex!;
          selectedAttractionValue = state.value;
          return SizedBox(
            height:isSelectAttraction != true ? 6.h : 40.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mainContainer(context,state.attractionTypeList.isNotEmpty?state.attractionTypeList.first.toString():attraction),
                isSelectAttraction == true
                    ? VerticalSpace(height: 1.5.h)
                    : Container(),
                isSelectAttraction == true
                    ? Flexible(
                  child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.0.h, right: 3.0.h,bottom: 1.h),
                      child:RawScrollbar(
                        thickness:0.5.h,
                        padding: EdgeInsets.only(right: 0.5.h,top: 1.5.h),
                        thumbVisibility: true,
                        controller:scrollController,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorPath.containerBorderColor,
                                  width: 0.1.h),
                              color: ColorPath.containerBorderColor
                                  .withOpacity(0.4),
                              borderRadius:
                              BorderRadius.all(Radius.circular(1.h))),
                          child: Padding(
                              padding: EdgeInsets.all(1.0.h),
                              child: ListView.builder(
                                controller: scrollController,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: attractionTypeList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2.0,
                                        right: 2.0,
                                        top: 3.0,
                                        bottom: 3.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: selectedIndex == index
                                              ? ColorPath.primaryButtonColor
                                              : ColorPath.containerBorderColor
                                              .withOpacity(0.2),
                                          border: Border.all(
                                              color: selectedIndex == index
                                                  ? ColorPath.primaryButtonColor
                                                  : ColorPath
                                                  .containerBorderColor,
                                              width: 0.1.h),
                                          borderRadius:
                                          BorderRadius.circular(1.3.h),
                                        ),
                                        child: ListTile(
                                          selected: index == selectedIndex,
                                          onTap: () {
                                            selectedIndex = index;
                                            selectedAttractionValue =
                                                attractionTypeList[index]
                                                    .toString();
                                            getAttractionListByFilter(
                                                selectedAttractionValue
                                                    .toString());
                                            context.read<AttractionFilterBloc>()
                                                .add(AttractionChangeEventData(
                                                false,
                                                selectedIndex,
                                                selectedAttractionValue!,mapProviderRead.isVisibleList!));
                                            mapProviderRead.attractionValueUpdate(
                                                false);
                                          },
                                          title: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Expanded(
                                                child: CustomText(
                                                  text: attractionTypeList?[index]
                                                      .toString(),
                                                  fontFamily: interFont,
                                                  fontSize: 12.sp,
                                                  underline: false,
                                                  fontWeight: FontWeight.w600,
                                                  color: selectedIndex != index
                                                      ? ColorPath.blackprimary
                                                      : ColorPath.whiteColor,
                                                  maxLine: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              selectedIndex == index
                                                  ? SvgPicture.asset(IconPaths
                                                  .attractionSelected)
                                                  : Container()
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              )),
                        ),
                      ),
                    ),
                  ),
                )
                    : Container(),
              ],
            ),
          );
        }
    );
  }
}