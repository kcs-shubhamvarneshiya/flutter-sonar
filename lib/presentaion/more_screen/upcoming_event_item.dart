import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_header.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/news_event_common_widget.dart';
import '../../common_widgets/widgets.dart';
import '../../utils/constants.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

@RoutePage()
class UpcomingEventsItem extends StatelessWidget {
  UpcomingEventsItem({Key? key}) : super(key: key);
  Widget? upcomingEventsWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: upcomingEvent,
        redirectToHome: false,
      ),
      //backgroundColor: ColorPath.bottomNavBgColor,
      backgroundColor: ColorPath.whiteColor,
      body: BlocProvider<AppJsonBloc>(
        create: (context) =>
            GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*VerticalSpace(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => getIt<AppRouter>().pop();
                    child: SvgPicture.asset(backArrow),
                  ),
                  HorizontalSpace(width: 1.h),
                  CustomText(
                    text: upcomingEvent,
                    fontSize: 21.sp,
                    underline: false,
                    fontFamily: addingTonFont,
                    fontWeight: FontWeight.w300,
                    color: ColorPath.primaryColor,
                  ),
                ],
              ),
            ),
            VerticalSpace(height: 2.h),*/
            BlocBuilder<AppJsonBloc, AppJsonState>(
              builder: (context, state) {
                state.when(
                  //loading state
                  loading: () {
                    upcomingEventsWidget =
                        const Center(child: CircularProgressIndicator());
                  },
                  loaded: (appJsonData) {
                    var filteredEventList = appJsonData.events!.where((element) {
                      var endTime = DateTime.parse(element.eventDate.toString());
                      return endTime.isAfter(DateTime.now());
                    }).toList();
                    upcomingEventsWidget = Expanded(
                      child: ListView.separated(
                        //padding: EdgeInsets.only(bottom: 6.h,top: 1.h),
                        padding: EdgeInsets.only(bottom: 4.h,top: 2.h),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          //NewsEventWidget
                          return NewsEventCommonWidget(
                            imageLength: filteredEventList[index].images!.length,
                            imageUrl: filteredEventList[index].images!,
                            title: filteredEventList[index].title!,
                            publishedDate: '',
                            description:filteredEventList[index].description!,
                            eventStatus: dailyEvent,
                            eventDate:selectedDate(filteredEventList[index].eventDate.toString(),Constant.ISO_TIMEZONE,Constant.EVENT_DATE_FORMAT),
                            isEventContainer: true,
                            onNewsClick: (){
                            },
                            externalLink:filteredEventList[index].externalLink !=null ? appJsonData.events![index].externalLink!:'',
                          );
                        },
                        separatorBuilder: (context, index) =>
                            VerticalSpace(height: 2.h),
                        itemCount: filteredEventList.length,
                      ),
                    );
                  },
                  error: (error) => upcomingEventsWidget = CustomText(
                    text: error,
                    fontSize: 13.sp,
                    underline: false,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.primaryColor,
                  ),
                );
                return upcomingEventsWidget!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
