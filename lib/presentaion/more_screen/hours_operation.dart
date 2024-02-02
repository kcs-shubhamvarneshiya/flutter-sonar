import 'package:akdmvisitorsapp/model/hours.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_header.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/widgets.dart';
import '../../utils/colors.dart';
import '../../utils/functions.dart';
import '../../utils/strings.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

@RoutePage()
class HoursOperationScreen extends StatelessWidget {
  HoursOperationScreen({Key? key}) : super(key: key);
  Widget? hoursScreenWidget;
  List<Hours> getTimings(List<Hours>? timingsList){
    if(timingsList != null){
      return timingsList;
      //final uniqueDays = ["MONDAY","TUESDAY","WEDNESDAY","THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"];
      /*var uniqueFetchedDays = <String>{};
      var uniqueFetchedStartingHours = <double?>{};
      var uniqueFetchedEndingHours = <double?>{};
      for (var element in timingsList) {
        uniqueFetchedDays.add(element.weekday.toString());
        uniqueFetchedStartingHours.add(element.startHour);
        uniqueFetchedEndingHours.add(element.endHour);
      }

      if(timingsList.length == uniqueFetchedDays.length && uniqueFetchedStartingHours.length == 1 && uniqueFetchedEndingHours.length == 1){
        //All values are unique as per days & it has ony 7 values
        List<Hours> finalArray = <Hours>[];
        finalArray.add(Hours(weekday:dailyText, startHour: uniqueFetchedStartingHours.first, endHour: uniqueFetchedEndingHours.first));
        return finalArray;
      }else{
        return timingsList;
      }*/
    }else{
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: dailyTimings,//hoursOperation
        redirectToHome: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocProvider(
              create: (context) =>
                  GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
              child: BlocBuilder<AppJsonBloc, AppJsonState>(
                builder: (context, state) {
                  state.when(
                    loading: () {
                      hoursScreenWidget = const CircularProgressIndicator();
                    },
                    loaded: (appJsonData) {
                      hoursScreenWidget = Container(
                        color: ColorPath.bottomNavBgColor,
                        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.separated(
                                  physics: const ClampingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: appJsonData.campusTimings!.length,
                                  separatorBuilder: (context, index) =>
                                      VerticalSpace(height: 2.5.h),
                                  itemBuilder: (context, index) {
                                    final ScrollController scrollController = ScrollController();
                                    var timingList = getTimings(appJsonData.campusTimings![index].hours);
                                    return RawScrollbar(
                                      controller:scrollController,
                                      thumbVisibility: true,
                                      thickness: 0.5.h,
                                      padding: EdgeInsets.only(bottom:2.h,left: 2.h),
                                      child: Container(
                                        padding: EdgeInsets.all(2.5.h),
                                        decoration: BoxDecoration(
                                          color: ColorPath.addSectionText.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: appJsonData
                                                  .campusTimings![index].name,
                                              fontSize: 16.sp,
                                              underline: false,
                                              fontFamily: interFont,
                                              fontWeight: FontWeight.w300,
                                              color: ColorPath.primaryColor,
                                              maxLine: 2,
                                            ),
                                            VerticalSpace(height: 0.5.h),
                                            SizedBox(
                                              height: 14.h,
                                              child: ListView.separated(
                                                controller: scrollController,
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                physics: const BouncingScrollPhysics(),
                                                itemCount:timingList.length,
                                                separatorBuilder: (context,index) =>
                                                    HorizontalSpace(width: 2.w),
                                                itemBuilder: (context, indexNested) {
                                                  return DayTimeWidget(
                                                      day:timingList[indexNested].weekday.toString(),
                                                      startTime:double.parse(timingList[indexNested].startHour.toString()).getTimeStringFromDouble(),
                                                      endTime:double.parse(timingList[indexNested].endHour.toString()).getTimeStringFromDouble(),
                                                      type:appJsonData.campusTimings![index].type==campusType ? false:true);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            VerticalSpace(height: 1.h),
                          ],
                        ),
                      );
                    },
                    error: (error) {
                      CustomText(
                        text: error,
                        fontSize: 13.sp,
                        underline: false,
                        fontWeight: FontWeight.w500,
                        color: ColorPath.primaryColor,
                      );
                    },
                  );

                  return hoursScreenWidget!;
                },
              ),
            ),
          ),
        ],
      ),
      //),
    );
  }
}
