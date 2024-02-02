import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
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
class LatestNewsItems extends StatelessWidget {
  LatestNewsItems({Key? key}) : super(key: key);
  Widget? newsWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: newsTitle,
        redirectToHome: false,
      ),
      backgroundColor: ColorPath.whiteColor,
      body: BlocProvider<AppJsonBloc>(
        create: (context) =>
        GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //VerticalSpace(height: 10.h),
            BlocBuilder<AppJsonBloc, AppJsonState>(
              builder: (context, state) {
                state.when(
                  //loading state
                  loading: () {
                    newsWidget = const Center(child: CircularProgressIndicator());
                  },
                  loaded: (appJsonData) {
                    newsWidget = Expanded(
                      child: ListView.separated(
                        //padding: EdgeInsets.only(bottom: 6.h, top: 1.h),
                        padding: EdgeInsets.only(bottom: 4.h,top: 1.h),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          // return NewsEventWidget(
                          return NewsEventCommonWidget(
                            imageLength: appJsonData.news![index].gallery != null ? appJsonData.news![index].gallery!.length:0,
                            imageUrl:appJsonData.news![index].gallery != null ? appJsonData.news![index].gallery!:[],
                            title: appJsonData.news![index].title!,
                            publishedDate:selectedDate(appJsonData.news![index].publishedAt!.toString(),Constant.ISO_TIMEZONE,Constant.EVENT_DATE_FORMAT),
                            description: appJsonData.news![index].description!,
                            eventStatus: '',
                            eventDate:'March 18, 2023',
                            isEventContainer: false,
                            onNewsClick: () {
                              getIt<AppRouter>().push(MoreDetailsRoute(
                                url: appJsonData.news![index].externalLink
                                    .toString(),
                                pageName: appJsonData.news![index].title!,
                              ));
                            },
                            externalLink: '',
                          );
                        },
                        separatorBuilder: (context, index) =>
                            //VerticalSpace(height: 3.h),
                            VerticalSpace(height: 2.h),
                        itemCount: appJsonData.news!.length,
                      ),
                    );
                  },
                  error: (error) =>
                  newsWidget = CustomText(
                    text: error,
                    fontSize: 13.sp,
                    underline: false,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.primaryColor,
                  ),
                );
                return newsWidget!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
