import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/swiper_widget.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/init_beacon.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/video_url/video_url.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../common_widgets/appbar_widget.dart';
import '../../common_widgets/fancyShimmerCachedImage.dart';
import '../../model/user_model/user_model.dart';
import '../../notification/fcm_notification_service.dart';
import '../../notification/notification_configuration.dart';
import '../../router_page/app_router.dart';
import '../../service/remote_config.dart';
import '../../utils/constants.dart';
import '../../utils/enums.dart';
import '../../utils/functions.dart';
import '../../utils/iconpath.dart';
import '../../utils/strings.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';
import '../indoorMap/indoor_map_screen.dart';

//HeaderSection (Carousel)
class HeaderSection extends StatefulWidget {
  HeaderSection({Key? key, this.userModel, this.tokenValue, this.model})
      : super(key: key);
  String? tokenValue;
  UserModel? userModel;
  AppJsonModel? model;

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with WidgetsBindingObserver {
  Widget? displayWidget;
  Widget? headerWidget;
  bool? value;
  var beacons = <Beacon>[];
  var channelName = const MethodChannel(Constant.channelName);
  var fcmNotificationService = getIt<FcmNotificationService>();
  late VideoPlayerController _videoController;
  late RemoteConfig remoteConfig;
  bool isVideoLoaded = false;

  Future<void> checkIfWithinArea(double latitude, double longitude) async {
    Geolocator.requestPermission();
    var currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    /*print('Latitude: ${currentPosition.latitude}');
    print('Longitude: ${currentPosition.longitude}');*/

    double distanceToGeopoint1 = calculateDistance(currentPosition.latitude,
        currentPosition.longitude, latitude, longitude);
    double maxRadius = 0.2; // Replace with the maximum radius in kilometers
    if (distanceToGeopoint1 <= maxRadius) {
      fcmNotificationService
          .subscribeForFCMTopic(GeoFenceNotifyType.ON_CAMPUS.name);
      fcmNotificationService
          .unSubscribeForFCMTopic(GeoFenceNotifyType.OFF_CAMPUS.name);
      //showToast("User is within the area.");
    } else {
      fcmNotificationService
          .unSubscribeForFCMTopic(GeoFenceNotifyType.ON_CAMPUS.name);
      fcmNotificationService
          .subscribeForFCMTopic(GeoFenceNotifyType.OFF_CAMPUS.name);
      //showToast("User is outside the area.");
    }
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Radius of the Earth in kilometers
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);
    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final double c = 2 * asin(sqrt(a));
    final double distance = earthRadius * c;
    return distance;
  }

  double _toRadians(double degrees) {
    return degrees * (pi / 180);
  }

  /*
  This method will handle the GeoFence notifications and subscribe topic for FCM
  If user enters the location, subscribe - ON_CAMPUS & unsubscribe - OFF_CAMPUS &
  If user exits the location, subscribe - OFF_CAMPUS & unsubscribe - ON_CAMPUS
  */
  void geofenceSubscription() {
    channelName.setMethodCallHandler((call) async {
      if (call.method == Constant.geofenceNotificationReceived) {
        print("Notification Received, args:  ${call.arguments}");
        if (call.arguments['deepLink'] as String ==
            NotificationTypeForRedirection.attraction.name) {
          //Attraction
          if (call.arguments['notificationId'] as String != null) {
            fcmNotificationService.redirectToAttraction(
                call.arguments['notificationId'] as String);
          }
        } else if (call.arguments['deepLink'] as String ==
            NotificationTypeForRedirection.campus.name) {
          //Campus
          if (call.arguments['notificationId'] as String ==
              Constant.campusEntryId) {
            //User enters in the campus
            fcmNotificationService
                .subscribeForFCMTopic(GeoFenceNotifyType.ON_CAMPUS.name);
            fcmNotificationService
                .unSubscribeForFCMTopic(GeoFenceNotifyType.OFF_CAMPUS.name);
          } else if (call.arguments['notificationId'] as String ==
              Constant.campusExitId) {
            //User leaves in the campus
            fcmNotificationService
                .unSubscribeForFCMTopic(GeoFenceNotifyType.ON_CAMPUS.name);
            fcmNotificationService
                .subscribeForFCMTopic(GeoFenceNotifyType.OFF_CAMPUS.name);
          }
        } else if (call.arguments['deepLink'] as String ==
                NotificationTypeForRedirection.push.name &&
            Platform.isIOS) {
          print("FLUTTER ISO DATE: ${DateTime.now().toIso8601String()}");
          print(
              "IOS ISO DATE: ${call.arguments['notificationDate'].toString()}");
          fcmNotificationService.storeLocalNotification(
              call.arguments['notificationId'].toString(),
              call.arguments['title'].toString(),
              call.arguments['body'].toString(),
              false,
              call.arguments['previewBody'].toString(),
              call.arguments['notificationDate'].toString(),
              call.arguments['screenRedirect'].toString());
          if (call.arguments['screenRedirect'].toString() != null) {
            fcmNotificationService
                .fcmRedirection(call.arguments['screenRedirect'].toString());
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    remoteConfig = getIt<RemoteConfig>();
    playVideo();
  }

  void playVideo() {
    //_videoController = VideoPlayerController.asset(videoAssetPath)
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(Constant.currentVideoUrl),
    )..initialize().then((_) {
        _videoController.setLooping(true);
        setState(() {});
        isVideoLoaded = true;
        _videoController.play();
      });
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      Constant.currentVideoUrl = getVideoUrl(remoteConfig);
      playVideo();
    } else if (state == AppLifecycleState.paused) {
      _videoController.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    /*BlocBuilder<AppJsonBloc, AppJsonState>(
      bloc: GetIt.I<AppJsonBloc>()
        ..add(const LoadAppJsonEvent()),
      builder: (context, state) {
        state.when(
          loading: () {
            displayWidget = Center(
                child: SizedBox(
                  height: 5.h,
                ));
          },
          loaded: (appJsonData) {

          },
          error: (error) {
            displayWidget = CustomText(
              text: error,
              fontSize: 13.sp,
              underline: false,
              fontWeight: FontWeight.w500,
              color: ColorPath.primaryColor,
            );
          },
        );
        return displayWidget!;
      },
    );*/

    //Below code is to call for receive method channel call from native side and redirect using deeplink for attraction as well notification subscription.  .
    geofenceSubscription();

    /*Below code is used for scan beacon and display notification on scan completed.
    InitBeacon beacon = InitBeacon();
    beacon.initScanBeacon("35eb0f3c-aa6b-4f23-bfb0-fb63d05a0536");
    beacon.initScanBeacon(appJsonData.attractions![0].beacon!.id.toString());*/

    //Below code is used for check the user current location in particular area radius or not.
    //checkIfWithinArea(double.parse(widget.model!.campus!.latitude.toString()), double.parse(widget.model!.campus!.longitude.toString()));

    //Below code is to call method channel for geofence service.
    //NotificationConfigurations().setupGeofencingNotification(widget.model!.campus!, widget.model!.attractions!);

    return Stack(
      children: [
        _videoController.value.isInitialized
            ? VisibilityDetector(
                key: UniqueKey(),
                onVisibilityChanged: (visibilityInfo) {
                  if (_videoController != null &&
                      _videoController.value.isInitialized) {
                    if (visibilityInfo.visibleFraction == 0) {
                      // Video is out of view, pause it
                      _videoController.pause();
                    } else {
                      // Video is in view, play it
                      _videoController.play();
                    }
                  }
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  ),
                ))
            : Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: AspectRatio(
                    aspectRatio:_videoController.value.aspectRatio,
                    child: Container(
                      color: Colors.grey.shade300, // Placeholder color
                    ),
                  ),
                ),
              ),

        Positioned(
            bottom: 2.h, // Adjust the position as needed
            right: 1.h,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: ColorPath.whiteColor.withOpacity(.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(color: ColorPath.whiteColor),
                  padding:
                      EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 2.h),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  getIt<AppRouter>().push(
                      HomeBottomNavRoute(initialIndex: 1, isListVisible: true));
                },
                icon: const Icon(Icons.arrow_back, color: ColorPath.whiteColor),
                label: CustomText(
                  text: exploreHome,
                  fontFamily: interFont,
                  fontSize: 11.sp,
                  underline: false,
                  fontWeight: FontWeight.w500,
                  color: ColorPath.whiteColor,
                ),
              ),
            )),

        //image slider
        /*      SwiperWidget(
                        isIndexPagination: false,
                        itemLength: appJsonData
                            .galleries![homeSliderIndex].media!.length,
                        activeColor: ColorPath.primaryColor,
                        inActiveColor: ColorPath.secondaryTextColor,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return AspectRatio(
                              aspectRatio:
                                  _videoController.value.aspectRatio,
                              child: VideoPlayer(_videoController),
                            );
                          } else {
                            return Container(
                              height: 40.h,
                              //foreground decoration
                              foregroundDecoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    ColorPath.primaryColor.withOpacity(.5),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: const [0, 0.5],
                                ),
                              ),
                              //background decoration
                              child: FancyShimmerCachedImage(
                                imageUrl: appJsonData
                                        .galleries![homeSliderIndex]
                                        .media![index]
                                        .thumbnail
                                        .toString() ??
                                    "",
                                boxFit: BoxFit.fill,
                                errorWidget:
                                    Image.asset(IconPaths.placeholderImage),
                                width: MediaQuery.of(context).size.width,
                              ),
                            );
                          }
                        }),*/
        //top container/appbar
        /*Align(
                alignment: Alignment.topCenter,
                child: AppbarWidget(
                  appBarColor: ColorPath.headerBgContainer.withOpacity(.6),
                  userAppBarIcon: IconPaths.userIcon,
                  appBarLogoImage: IconPaths.akdmLogo,
                  notificationAppBarIcon: IconPaths.notificationIcon,
                  tokenValue: widget.tokenValue,
                  userModel: widget.userModel,
                ),
                  ),*/
        /* Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.white],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                    ),*/
      ],
    );
  }

  //Dispose the VideoPlayerController
  @override
  void dispose() {
    _videoController.pause();
    _videoController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
