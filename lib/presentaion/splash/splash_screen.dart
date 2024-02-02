import 'dart:io';

import 'package:akdmvisitorsapp/model/gallery/gallery.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pod_player/pod_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../notification/fcm_notification_service.dart';
import '../../utils/strings.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_state.dart';

// Splash Screen
@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String page = "/splashScreen";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late FcmNotificationService fcmNotificationService;
  late VideoPlayerController _controller;
  bool hasVideoPlayed = false;
  bool hasApiDataLoaded = false;

  @override
  void initState() {
    super.initState();

    fcmNotificationService = getIt<FcmNotificationService>();
    fcmNotificationService.configureFCMNotifications();
    _controller =
        VideoPlayerController.asset('assets/files/AkshardhamSplash.mov')
          ..initialize().then((_) {
            Logger().i(_controller.value.duration);
            setState(() {});
            _controller.play();

            Future.delayed(const Duration(seconds: 3), () {
              _onVideoFinished();
            });
          });
  }

  void _onVideoFinished() {
    setState(() {
      hasVideoPlayed = true;
    });

    if (hasApiDataLoaded) {
      _moveToNextScreen();
    }
  }

  void _onApiDataLoaded() {
    setState(() {
      hasApiDataLoaded = true;
    });

    if (hasVideoPlayed) {
      _moveToNextScreen();
    }
  }

  void _moveToNextScreen() {
    // first check is first time
    final preferences = getIt<SharedPreferences>();
    bool isFirstTime = preferences.getBool(isFirstTimeSplashPref) ?? true;
    if (isFirstTime) {
      getIt<AppRouter>().replace(const IntroductionScreenRoute());
    } else {
      if (!FcmNotificationService.initialRedirection) {
        fcmNotificationService.fcmRedirection("");
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppJsonAPIBloc, JsonAPIState>(
      listener: (context, state) {
        state.when(
            loading: () {},
            loaded: (data) {
              _onApiDataLoaded();
            },
            error: (error) {});
      },
      child: Scaffold(
        body: Container(
          color: const Color.fromRGBO(4, 5, 96, 1),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : Image.asset(
                      "assets/files/AkshardhamSplashFrame.png",
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
