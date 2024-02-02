import 'dart:async';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_change_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_filter_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bottombar_bloc/bottombar_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/guideline/guideline_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/login_bloc/login_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/webView/webPageErrorBloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/webView/webView_event.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/map_routing_provider.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/service/connectivity_service.dart';
import 'package:akdmvisitorsapp/service/remote_config.dart';
import 'package:akdmvisitorsapp/utils/constants.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dependencies.dart';
import 'model/app_json/app_json.dart';
import 'model/attraction/attraction.dart';
import 'notification/fcm_notification_service.dart';
import 'service/connection_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //await fcmNotificationService.setupFlutterNotifications();
  await configureDependencies(Environment.dev);
  var fcmNotificationService = getIt<FcmNotificationService>();
  //fcmNotificationService.showFCMFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // print('Handling a background message ${message.messageId}');
  fcmNotificationService.storeLocalNotification(
      message.notification.hashCode.toString(),
      message.notification!.title.toString(),
      message.notification!.body.toString(),
      false,
      message.data["previewBody"].toString(),
      DateTime.now().toIso8601String(),
      message.data["deepLink"].toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(Environment.dev);

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  var fcmNotificationService = getIt<FcmNotificationService>();

  if (!kIsWeb) {
    await fcmNotificationService.setupFlutterNotifications();
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light),
  );
  //Portrait Orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  getReceivedDynamicLinks();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MapMarkerProvider()),
    ChangeNotifierProvider(create: (_) => getIt<MapRoutingProvider>())
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final appRouter = getIt<AppRouter>();
  late StreamSubscription _connectionChangeStream;
  ValueNotifier<bool> hasConnection = ValueNotifier(false);
  Uri? deepLink;
  late RemoteConfig remoteConfig;

  @override
  void initState() {
    super.initState();
    connectivityConfiguration();
    remoteConfig=getIt<RemoteConfig>();
    Constant.currentVideoUrl = getVideoUrl(remoteConfig);
  }

  @override
  void dispose() {
    _connectionChangeStream.cancel();
    super.dispose();
  }

  void connectivityConfiguration() {
    ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
    connectionStatus.initialize();
    var connection = getIt<IConnectionStatus>();
    //Listen for connection change
    _connectionChangeStream = connectionStatus.connectionChange.listen((event) {
      hasConnection.value = event;
      connection.setStatus(hasConnection.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GetIt.I<BluetoothHeadsetBloc>()
                ..add(const LoadBluetoothHeadsetEvents())),
          BlocProvider(create: (context) => GetIt.I<LoginBloc>()),
          BlocProvider(
              create: (context) => GetIt.I<NotificationBloc>()
                ..add(const NotificationEvent.loadNotificationEvent(false))),
          BlocProvider(create: (context) => GetIt.I<SubmitFeedbackBloc>()),
          BlocProvider(create: (context) => GetIt.I<WebViewErrorBloc>()),
          BlocProvider(
              create: (context) =>
                  GetIt.I<VisitBloc>()..add(const VisitEvent.loadVisitEvent())),
          BlocProvider(create: (context) => GetIt.I<BottomBarBloc>()),
          BlocProvider(create: (context) => GetIt.I<GuidelineBloc>()),
          BlocProvider(
              create: (context) =>
                  GetIt.I<AppJsonAPIBloc>()..add(const LoadAppJsonEvent())),
          BlocProvider(
              create: (context) => GetIt.I<AttractionFilterBloc>()
                ..add(AttractionChangeEvent.tap(false, 0, '',false))), //allText
        ],
        child: ValueListenableBuilder(
            valueListenable: hasConnection,
            builder: (context, value, _) {
              return Sizer(builder: (context, orientation, deviceType) {
                BlocProvider.of<WebViewErrorBloc>(context)
                    .add(WebViewClickEvent(hasConnection.value, ""));
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: appName,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  routerConfig: appRouter.config(),
                );
              });
            }));
  }
}

Future<void> getReceivedDynamicLinks() async {
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();
  if (initialLink != null) {
    var deepLink = initialLink.link;
    print("link received:${deepLink}");
    String path = deepLink.path;
    String id = path.substring(path.lastIndexOf('/') + 1);
    List<Attraction> temp = [];

    AppJsonModel jsonDataRepo =
        await getIt<AppJsonRepository>().loadJsonAssetData();
    var attractionData = jsonDataRepo.attractions
        ?.firstWhere((element) => element.id == int.parse(id));
    if (attractionData != null) {
      temp.add(attractionData);
    }
    getIt<AppRouter>().push(
      AttractionDetailsRoute(appJsonModel: temp, isDeeplink: true),
    );
  }

  FirebaseDynamicLinks.instance.onLink.listen((pendingDynamicLinkData) async {
    // Set up the `onLink` event listener next as it may be received here
    if (pendingDynamicLinkData != null) {
      var deepLink = pendingDynamicLinkData.link;
      String path = deepLink.path;
      String id = path.substring(path.lastIndexOf('/') + 1);

      List<Attraction> temp = [];
      print("link received:${deepLink}");
      AppJsonModel jsonDataRepo =
          await getIt<AppJsonRepository>().loadJsonAssetData();
      var attractionData = jsonDataRepo.attractions
          ?.firstWhere((element) => element.id == int.parse(id));
      if (attractionData != null) {
        temp.add(attractionData);
      }
      getIt<AppRouter>().push(
        AttractionDetailsRoute(appJsonModel: temp, isDeeplink: false),
      );
    }
  });
}
