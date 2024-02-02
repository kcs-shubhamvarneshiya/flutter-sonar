import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/presentaion/home/announcement.dart';
import 'package:akdmvisitorsapp/presentaion/home/header_section.dart';
import 'package:akdmvisitorsapp/presentaion/home/latest_news.dart';
import 'package:akdmvisitorsapp/presentaion/home/plan_my_visit.dart';
import 'package:akdmvisitorsapp/presentaion/home/visit_plan_list.dart';
import 'package:akdmvisitorsapp/presentaion/home/welcome_container.dart';
import 'package:akdmvisitorsapp/presentaion/visit/guidlines.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../model/user_model/user_model.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';
import '../visit/visit_plan.dart';
import 'social_media_post.dart';
import 'upcoming_events.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  Widget? homeWidget;

  @override
  Widget build(BuildContext context) {
    String? tokenValue;
    UserModel? userModel;

    return Scaffold(
        backgroundColor: ColorPath.homeBgColor,
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          isNotification: true,
        ),
        body: SingleChildScrollView(
            //physics: const ClampingScrollPhysics(),
            child: BlocBuilder<AppJsonBloc, AppJsonState>(
                bloc: GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
                builder: (context, state) {
                  state.when(
                    loading: () {
                      homeWidget = const Center(child: SizedBox());
                    },
                    loaded: (appJsonData) {
                      homeWidget = FutureBuilder<bool>(
                          future: Future.delayed(const Duration(milliseconds: 300), () => true),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const SizedBox();
                            } else if (snapshot.hasData && snapshot.data!) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  VerticalSpace(height: 12.h),
                                  //Announcement Section Class
                                  AnnouncementsWidget(announcements: appJsonData.announcements),
                                  //Header Section Class
                                  HeaderSection(tokenValue: tokenValue,
                                      userModel: userModel,model: appJsonData),
                                  //Welcome Section Class
                                  WelcomeContainer(campus: appJsonData.campus),
                                //  PlanMyVisit(),
                                 PlanMyVisitList(),
                                  //Guidelines section
                                  GuidLinesScreen(guideline: appJsonData.guidelines),
                                  //VerticalSpace(height: 2.8.h),
                                  //attraction section
                                  //AttractionsSection(),
                                  // Visit plan Section Class
                                  //  VisitPlan(),
                                  //Image Slider Section Class
                                  UpcomingEvents(events: appJsonData.events),
                                  //news section
                                  LatestNews(news: appJsonData.news),
                                  //posts images
                                  SocialMediaPosts(socialMedia: appJsonData.socialMedia),
                                  VerticalSpace(height: (Platform.isIOS) ? 12.h : 8.h),
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          }
                      );
                    },
                    error: (error) {},
                  );
                  return homeWidget!;
                })
        )
    );
  }
}
