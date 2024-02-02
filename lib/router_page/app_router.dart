import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/gallery/gallery.dart';
import 'package:akdmvisitorsapp/presentaion/explore/select_attraction.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/indoor_map_screen.dart';
import 'package:akdmvisitorsapp/presentaion/visit/play_video.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../common_widgets/bottom_nav.dart';
import '../common_widgets/header_footer_home.dart';
import '../model/notification/notification.dart';
import '../presentaion/add_screen/add_screen.dart';
import '../presentaion/explore/attraction_details.dart';
import '../presentaion/explore/explorer_screen.dart';
import '../presentaion/explore/map_attraction_screen.dart';
import '../presentaion/guidelines/guideline_detail_screen.dart';
import '../presentaion/introduction/introduction.dart';
import '../presentaion/login/login_screen.dart';
import '../presentaion/more_screen/feedback_form/feedback_form_home.dart';
import '../presentaion/more_screen/feedback_form/thank_you_page.dart';
import '../presentaion/more_screen/hours_operation.dart';
import '../presentaion/more_screen/latest_news_item.dart';
import '../presentaion/more_screen/more_details.dart';
import '../presentaion/more_screen/more_screen.dart';
import '../presentaion/more_screen/upcoming_event_item.dart';
import '../presentaion/notification/notification_detail.dart';
import '../presentaion/notification/notification_screen.dart';
import '../presentaion/splash/splash_screen.dart';
import '../presentaion/visit/add_activity.dart';
import '../presentaion/visit/plan_visit.dart';
import '../presentaion/visit/visit_screen.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashPageRoute.page,  path: "/"),
        AutoRoute(page: HomeBottomNavRoute.page),
        AutoRoute(page: IntroductionScreenRoute.page),
        AutoRoute(page: HeaderFooterHomeRoute.page),
        AutoRoute(page: MoreDetailsRoute.page),
        AutoRoute(page: AttractionDetailsRoute.page),
        AutoRoute(page: IndoorMapScreenRoute.page),
        AutoRoute(page: PlanVisitRoute.page,),
        AutoRoute(page: AddActivityRoute.page,),
        AutoRoute(page: AttractionDetailsRoute.page,),
        AutoRoute(page: HoursOperationScreenRoute.page,),
        AutoRoute(page: UpcomingEventsItemRoute.page,),
        AutoRoute(page: LatestNewsItemsRoute.page,),
        AutoRoute(page: SelectAttractionsScreenRoute.page,),
        AutoRoute(page: FeedbackFromHomeRoute.page,),
        AutoRoute(page: LoginScreenRoute.page,),
        AutoRoute(page: NotificationScreenRoute.page,),
        AutoRoute(page: ThankYouScreenRoute.page,),
        AutoRoute(page: PlayVideoScreenRoute.page,),
        AutoRoute(page: NotificationDetailRoute.page,),
        AutoRoute(page: MapAttractionListScreenRoute.page,),
        AutoRoute(page: GuidLinesDetailScreenRoute.page,),

  ];
}
