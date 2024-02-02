// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddActivityRoute.name: (routeData) {
      final args = routeData.argsAs<AddActivityRouteArgs>(
          orElse: () => const AddActivityRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddActivity(key: args.key),
      );
    },
    AddScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AddScreenRouteArgs>(
          orElse: () => const AddScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddScreen(key: args.key),
      );
    },
    AttractionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AttractionDetailsRouteArgs>(
          orElse: () => const AttractionDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AttractionDetails(
          key: args.key,
          appJsonModel: args.appJsonModel,
          isDeeplink: args.isDeeplink,
        ),
      );
    },
    ExploreScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExploreScreen(),
      );
    },
    FeedbackFromHomeRoute.name: (routeData) {
      final args = routeData.argsAs<FeedbackFromHomeRouteArgs>(
          orElse: () => const FeedbackFromHomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FeedbackFromHome(key: args.key),
      );
    },
    GuidLinesDetailScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GuidLinesDetailScreen(),
      );
    },
    HeaderFooterHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HeaderFooterHome(),
      );
    },
    HomeBottomNavRoute.name: (routeData) {
      final args = routeData.argsAs<HomeBottomNavRouteArgs>(
          orElse: () => const HomeBottomNavRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeBottomNav(
          key: args.key,
          initialIndex: args.initialIndex,
          attraction: args.attraction,
          scrollIndexValue: args.scrollIndexValue,
          isListVisible: args.isListVisible,
        ),
      );
    },
    HoursOperationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HoursOperationScreenRouteArgs>(
          orElse: () => const HoursOperationScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HoursOperationScreen(key: args.key),
      );
    },
    IndoorMapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<IndoorMapScreenRouteArgs>(
          orElse: () => const IndoorMapScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IndoorMapScreen(
          key: args.key,
          initialObjectId: args.initialObjectId,
          isLocationAttraction: args.isLocationAttraction,
          isListVisible: args.isListVisible,
        ),
      );
    },
    IntroductionScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IntroductionScreen(),
      );
    },
    LatestNewsItemsRoute.name: (routeData) {
      final args = routeData.argsAs<LatestNewsItemsRouteArgs>(
          orElse: () => const LatestNewsItemsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LatestNewsItems(key: args.key),
      );
    },
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    MapAttractionListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapAttractionListScreenRouteArgs>(
          orElse: () => const MapAttractionListScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapAttractionListScreen(
          key: args.key,
          onTap: args.onTap,
        ),
      );
    },
    MoreDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MoreDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MoreDetails(
          key: args.key,
          url: args.url,
          pageName: args.pageName,
        ),
      );
    },
    MoreScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MoreScreenRouteArgs>(
          orElse: () => const MoreScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MoreScreen(key: args.key),
      );
    },
    NotificationDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationDetail(
          key: args.key,
          notificationData: args.notificationData,
        ),
      );
    },
    NotificationScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationScreen(),
      );
    },
    PlanVisitRoute.name: (routeData) {
      final args = routeData.argsAs<PlanVisitRouteArgs>(
          orElse: () => const PlanVisitRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlanVisit(key: args.key),
      );
    },
    PlayVideoScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PlayVideoScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlayVideoScreen(
          key: args.key,
          videoUrl: args.videoUrl,
          isVimeo: args.isVimeo,
        ),
      );
    },
    SelectAttractionsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectAttractionsScreen(),
      );
    },
    SplashPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    ThankYouScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ThankYouScreenRouteArgs>(
          orElse: () => const ThankYouScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ThankYouScreen(key: args.key),
      );
    },
    UpcomingEventsItemRoute.name: (routeData) {
      final args = routeData.argsAs<UpcomingEventsItemRouteArgs>(
          orElse: () => const UpcomingEventsItemRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpcomingEventsItem(key: args.key),
      );
    },
    VisitScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VisitScreenRouteArgs>(
          orElse: () => const VisitScreenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VisitScreen(
          key: args.key,
          scrollIndexValue: args.scrollIndexValue,
        ),
      );
    },
  };
}

/// generated route for
/// [AddActivity]
class AddActivityRoute extends PageRouteInfo<AddActivityRouteArgs> {
  AddActivityRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddActivityRoute.name,
          args: AddActivityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddActivityRoute';

  static const PageInfo<AddActivityRouteArgs> page =
      PageInfo<AddActivityRouteArgs>(name);
}

class AddActivityRouteArgs {
  const AddActivityRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddActivityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AddScreen]
class AddScreenRoute extends PageRouteInfo<AddScreenRouteArgs> {
  AddScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddScreenRoute.name,
          args: AddScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddScreenRoute';

  static const PageInfo<AddScreenRouteArgs> page =
      PageInfo<AddScreenRouteArgs>(name);
}

class AddScreenRouteArgs {
  const AddScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AttractionDetails]
class AttractionDetailsRoute extends PageRouteInfo<AttractionDetailsRouteArgs> {
  AttractionDetailsRoute({
    Key? key,
    List<Attraction>? appJsonModel,
    bool? isDeeplink,
    List<PageRouteInfo>? children,
  }) : super(
          AttractionDetailsRoute.name,
          args: AttractionDetailsRouteArgs(
            key: key,
            appJsonModel: appJsonModel,
            isDeeplink: isDeeplink,
          ),
          initialChildren: children,
        );

  static const String name = 'AttractionDetailsRoute';

  static const PageInfo<AttractionDetailsRouteArgs> page =
      PageInfo<AttractionDetailsRouteArgs>(name);
}

class AttractionDetailsRouteArgs {
  const AttractionDetailsRouteArgs({
    this.key,
    this.appJsonModel,
    this.isDeeplink,
  });

  final Key? key;

  final List<Attraction>? appJsonModel;

  final bool? isDeeplink;

  @override
  String toString() {
    return 'AttractionDetailsRouteArgs{key: $key, appJsonModel: $appJsonModel, isDeeplink: $isDeeplink}';
  }
}

/// generated route for
/// [ExploreScreen]
class ExploreScreenRoute extends PageRouteInfo<void> {
  const ExploreScreenRoute({List<PageRouteInfo>? children})
      : super(
          ExploreScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExploreScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeedbackFromHome]
class FeedbackFromHomeRoute extends PageRouteInfo<FeedbackFromHomeRouteArgs> {
  FeedbackFromHomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FeedbackFromHomeRoute.name,
          args: FeedbackFromHomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FeedbackFromHomeRoute';

  static const PageInfo<FeedbackFromHomeRouteArgs> page =
      PageInfo<FeedbackFromHomeRouteArgs>(name);
}

class FeedbackFromHomeRouteArgs {
  const FeedbackFromHomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FeedbackFromHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [GuidLinesDetailScreen]
class GuidLinesDetailScreenRoute extends PageRouteInfo<void> {
  const GuidLinesDetailScreenRoute({List<PageRouteInfo>? children})
      : super(
          GuidLinesDetailScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuidLinesDetailScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HeaderFooterHome]
class HeaderFooterHomeRoute extends PageRouteInfo<void> {
  const HeaderFooterHomeRoute({List<PageRouteInfo>? children})
      : super(
          HeaderFooterHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HeaderFooterHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeBottomNav]
class HomeBottomNavRoute extends PageRouteInfo<HomeBottomNavRouteArgs> {
  HomeBottomNavRoute({
    Key? key,
    int? initialIndex,
    Attraction? attraction,
    bool? scrollIndexValue,
    bool? isListVisible,
    List<PageRouteInfo>? children,
  }) : super(
          HomeBottomNavRoute.name,
          args: HomeBottomNavRouteArgs(
            key: key,
            initialIndex: initialIndex,
            attraction: attraction,
            scrollIndexValue: scrollIndexValue,
            isListVisible: isListVisible,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeBottomNavRoute';

  static const PageInfo<HomeBottomNavRouteArgs> page =
      PageInfo<HomeBottomNavRouteArgs>(name);
}

class HomeBottomNavRouteArgs {
  const HomeBottomNavRouteArgs({
    this.key,
    this.initialIndex,
    this.attraction,
    this.scrollIndexValue,
    this.isListVisible,
  });

  final Key? key;

  final int? initialIndex;

  final Attraction? attraction;

  final bool? scrollIndexValue;

  final bool? isListVisible;

  @override
  String toString() {
    return 'HomeBottomNavRouteArgs{key: $key, initialIndex: $initialIndex, attraction: $attraction, scrollIndexValue: $scrollIndexValue, isListVisible: $isListVisible}';
  }
}

/// generated route for
/// [HoursOperationScreen]
class HoursOperationScreenRoute
    extends PageRouteInfo<HoursOperationScreenRouteArgs> {
  HoursOperationScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HoursOperationScreenRoute.name,
          args: HoursOperationScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HoursOperationScreenRoute';

  static const PageInfo<HoursOperationScreenRouteArgs> page =
      PageInfo<HoursOperationScreenRouteArgs>(name);
}

class HoursOperationScreenRouteArgs {
  const HoursOperationScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HoursOperationScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [IndoorMapScreen]
class IndoorMapScreenRoute extends PageRouteInfo<IndoorMapScreenRouteArgs> {
  IndoorMapScreenRoute({
    Key? key,
    String? initialObjectId,
    Attraction? isLocationAttraction,
    bool? isListVisible,
    List<PageRouteInfo>? children,
  }) : super(
          IndoorMapScreenRoute.name,
          args: IndoorMapScreenRouteArgs(
            key: key,
            initialObjectId: initialObjectId,
            isLocationAttraction: isLocationAttraction,
            isListVisible: isListVisible,
          ),
          initialChildren: children,
        );

  static const String name = 'IndoorMapScreenRoute';

  static const PageInfo<IndoorMapScreenRouteArgs> page =
      PageInfo<IndoorMapScreenRouteArgs>(name);
}

class IndoorMapScreenRouteArgs {
  const IndoorMapScreenRouteArgs({
    this.key,
    this.initialObjectId,
    this.isLocationAttraction,
    this.isListVisible,
  });

  final Key? key;

  final String? initialObjectId;

  final Attraction? isLocationAttraction;

  final bool? isListVisible;

  @override
  String toString() {
    return 'IndoorMapScreenRouteArgs{key: $key, initialObjectId: $initialObjectId, isLocationAttraction: $isLocationAttraction, isListVisible: $isListVisible}';
  }
}

/// generated route for
/// [IntroductionScreen]
class IntroductionScreenRoute extends PageRouteInfo<void> {
  const IntroductionScreenRoute({List<PageRouteInfo>? children})
      : super(
          IntroductionScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LatestNewsItems]
class LatestNewsItemsRoute extends PageRouteInfo<LatestNewsItemsRouteArgs> {
  LatestNewsItemsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LatestNewsItemsRoute.name,
          args: LatestNewsItemsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LatestNewsItemsRoute';

  static const PageInfo<LatestNewsItemsRouteArgs> page =
      PageInfo<LatestNewsItemsRouteArgs>(name);
}

class LatestNewsItemsRouteArgs {
  const LatestNewsItemsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LatestNewsItemsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginScreenRoute.name,
          args: LoginScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static const PageInfo<LoginScreenRouteArgs> page =
      PageInfo<LoginScreenRouteArgs>(name);
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MapAttractionListScreen]
class MapAttractionListScreenRoute
    extends PageRouteInfo<MapAttractionListScreenRouteArgs> {
  MapAttractionListScreenRoute({
    Key? key,
    dynamic Function(Attraction)? onTap,
    List<PageRouteInfo>? children,
  }) : super(
          MapAttractionListScreenRoute.name,
          args: MapAttractionListScreenRouteArgs(
            key: key,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'MapAttractionListScreenRoute';

  static const PageInfo<MapAttractionListScreenRouteArgs> page =
      PageInfo<MapAttractionListScreenRouteArgs>(name);
}

class MapAttractionListScreenRouteArgs {
  const MapAttractionListScreenRouteArgs({
    this.key,
    this.onTap,
  });

  final Key? key;

  final dynamic Function(Attraction)? onTap;

  @override
  String toString() {
    return 'MapAttractionListScreenRouteArgs{key: $key, onTap: $onTap}';
  }
}

/// generated route for
/// [MoreDetails]
class MoreDetailsRoute extends PageRouteInfo<MoreDetailsRouteArgs> {
  MoreDetailsRoute({
    Key? key,
    required String url,
    required String pageName,
    List<PageRouteInfo>? children,
  }) : super(
          MoreDetailsRoute.name,
          args: MoreDetailsRouteArgs(
            key: key,
            url: url,
            pageName: pageName,
          ),
          initialChildren: children,
        );

  static const String name = 'MoreDetailsRoute';

  static const PageInfo<MoreDetailsRouteArgs> page =
      PageInfo<MoreDetailsRouteArgs>(name);
}

class MoreDetailsRouteArgs {
  const MoreDetailsRouteArgs({
    this.key,
    required this.url,
    required this.pageName,
  });

  final Key? key;

  final String url;

  final String pageName;

  @override
  String toString() {
    return 'MoreDetailsRouteArgs{key: $key, url: $url, pageName: $pageName}';
  }
}

/// generated route for
/// [MoreScreen]
class MoreScreenRoute extends PageRouteInfo<MoreScreenRouteArgs> {
  MoreScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MoreScreenRoute.name,
          args: MoreScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MoreScreenRoute';

  static const PageInfo<MoreScreenRouteArgs> page =
      PageInfo<MoreScreenRouteArgs>(name);
}

class MoreScreenRouteArgs {
  const MoreScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MoreScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NotificationDetail]
class NotificationDetailRoute
    extends PageRouteInfo<NotificationDetailRouteArgs> {
  NotificationDetailRoute({
    Key? key,
    required NotificationLog notificationData,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationDetailRoute.name,
          args: NotificationDetailRouteArgs(
            key: key,
            notificationData: notificationData,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationDetailRoute';

  static const PageInfo<NotificationDetailRouteArgs> page =
      PageInfo<NotificationDetailRouteArgs>(name);
}

class NotificationDetailRouteArgs {
  const NotificationDetailRouteArgs({
    this.key,
    required this.notificationData,
  });

  final Key? key;

  final NotificationLog notificationData;

  @override
  String toString() {
    return 'NotificationDetailRouteArgs{key: $key, notificationData: $notificationData}';
  }
}

/// generated route for
/// [NotificationScreen]
class NotificationScreenRoute extends PageRouteInfo<void> {
  const NotificationScreenRoute({List<PageRouteInfo>? children})
      : super(
          NotificationScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlanVisit]
class PlanVisitRoute extends PageRouteInfo<PlanVisitRouteArgs> {
  PlanVisitRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PlanVisitRoute.name,
          args: PlanVisitRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PlanVisitRoute';

  static const PageInfo<PlanVisitRouteArgs> page =
      PageInfo<PlanVisitRouteArgs>(name);
}

class PlanVisitRouteArgs {
  const PlanVisitRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'PlanVisitRouteArgs{key: $key}';
  }
}

/// generated route for
/// [PlayVideoScreen]
class PlayVideoScreenRoute extends PageRouteInfo<PlayVideoScreenRouteArgs> {
  PlayVideoScreenRoute({
    Key? key,
    required String? videoUrl,
    required bool? isVimeo,
    List<PageRouteInfo>? children,
  }) : super(
          PlayVideoScreenRoute.name,
          args: PlayVideoScreenRouteArgs(
            key: key,
            videoUrl: videoUrl,
            isVimeo: isVimeo,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayVideoScreenRoute';

  static const PageInfo<PlayVideoScreenRouteArgs> page =
      PageInfo<PlayVideoScreenRouteArgs>(name);
}

class PlayVideoScreenRouteArgs {
  const PlayVideoScreenRouteArgs({
    this.key,
    required this.videoUrl,
    required this.isVimeo,
  });

  final Key? key;

  final String? videoUrl;

  final bool? isVimeo;

  @override
  String toString() {
    return 'PlayVideoScreenRouteArgs{key: $key, videoUrl: $videoUrl, isVimeo: $isVimeo}';
  }
}

/// generated route for
/// [SelectAttractionsScreen]
class SelectAttractionsScreenRoute extends PageRouteInfo<void> {
  const SelectAttractionsScreenRoute({List<PageRouteInfo>? children})
      : super(
          SelectAttractionsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectAttractionsScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashPageRoute extends PageRouteInfo<void> {
  const SplashPageRoute({List<PageRouteInfo>? children})
      : super(
          SplashPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ThankYouScreen]
class ThankYouScreenRoute extends PageRouteInfo<ThankYouScreenRouteArgs> {
  ThankYouScreenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ThankYouScreenRoute.name,
          args: ThankYouScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ThankYouScreenRoute';

  static const PageInfo<ThankYouScreenRouteArgs> page =
      PageInfo<ThankYouScreenRouteArgs>(name);
}

class ThankYouScreenRouteArgs {
  const ThankYouScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ThankYouScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [UpcomingEventsItem]
class UpcomingEventsItemRoute
    extends PageRouteInfo<UpcomingEventsItemRouteArgs> {
  UpcomingEventsItemRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UpcomingEventsItemRoute.name,
          args: UpcomingEventsItemRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UpcomingEventsItemRoute';

  static const PageInfo<UpcomingEventsItemRouteArgs> page =
      PageInfo<UpcomingEventsItemRouteArgs>(name);
}

class UpcomingEventsItemRouteArgs {
  const UpcomingEventsItemRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UpcomingEventsItemRouteArgs{key: $key}';
  }
}

/// generated route for
/// [VisitScreen]
class VisitScreenRoute extends PageRouteInfo<VisitScreenRouteArgs> {
  VisitScreenRoute({
    Key? key,
    bool? scrollIndexValue,
    List<PageRouteInfo>? children,
  }) : super(
          VisitScreenRoute.name,
          args: VisitScreenRouteArgs(
            key: key,
            scrollIndexValue: scrollIndexValue,
          ),
          initialChildren: children,
        );

  static const String name = 'VisitScreenRoute';

  static const PageInfo<VisitScreenRouteArgs> page =
      PageInfo<VisitScreenRouteArgs>(name);
}

class VisitScreenRouteArgs {
  const VisitScreenRouteArgs({
    this.key,
    this.scrollIndexValue,
  });

  final Key? key;

  final bool? scrollIndexValue;

  @override
  String toString() {
    return 'VisitScreenRouteArgs{key: $key, scrollIndexValue: $scrollIndexValue}';
  }
}
