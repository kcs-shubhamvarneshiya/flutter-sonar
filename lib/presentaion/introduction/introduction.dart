import 'package:akdmvisitorsapp/common_widgets/photo_content.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/dashed_page.dart';
import '../../dependencies.dart';
import '../../utils/custome_scroll_physics.dart';
import '../../utils/enums.dart';
import '../../utils/iconpath.dart';
import '../bloc/introduction/introduction_bloc.dart';
import '../bloc/introduction/introduction_event.dart';
import '../bloc/introduction/introduction_state.dart';

//IntroductionScreen
@RoutePage()
class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);
  static const String page = "/introduction";

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController? controller;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    //initSharedPreference();
    controller = PageController(initialPage: 0);
    // Add a listener to the PageController to update the currentPageIndex
    controller!.addListener(() {
      setState(() {
        currentPageIndex = controller!.page!.round();
      });
    });
  }


  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //IntroductionScreen lists
    List<Widget> introductionScreens = [
      PhotoContent(
        index: 1,
        controller: controller!,
        imageName: IconPaths.introImageOne,
        primaryText: namasteIntroText,
        secondaryText: firstWelcomeText,
        buttonText: next,
      ),
      PhotoContent(
        index: 2,
        controller: controller!,
        imageName: IconPaths.introImageTwo,
        primaryText: sanctuaryIntroText,
        secondaryText: secondWelcomeText,
        buttonText: next,
      ),
      PhotoContent(
        controller: controller!,
        index: 3,
        imageName: IconPaths.introImageThree,
        primaryText: missThing,
        secondaryText: thirdWelcomeText,
        buttonText: next,
      ),
      PhotoContent(
        index: 4,
        controller: controller!,
        imageName: IconPaths.introImageFour,
        primaryText: journeyIntroText,
        secondaryText: fourWelcomeText,
        buttonText: getStarted,
      ),
    ];
    return BlocProvider<IntroductionBloc>(
      create: (context) => GetIt.I<IntroductionBloc>(),
      child: BlocBuilder<IntroductionBloc, IntroductionState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.when(
               setBackgroundState: (background) => background == Background.Light.name ? ColorPath.primaryColor : ColorPath.primaryColor),
            body: Stack(
              children: [
                //IntroductionScreen page view
                PageView.builder(
                  controller: controller,
                  //physics:CustomScrollPhysics(), // It will not show previous/next screen on swipe left/right (important)
                  physics: const NeverScrollableScrollPhysics(), // It will stop swipe gesture to go previous/next screen
                  onPageChanged: (int page) async {
                    BlocProvider.of<IntroductionBloc>(context).add(ScreenChangeEvent(page.toString(),),);
                    final SharedPreferences pref= getIt<SharedPreferences>();
                    if(page==2){
                      bool? isLocation=pref.getBool(isLocationTap) ?? false;
                      if(!isLocation){
                        final status = await Permission.location.status;
                        await Permission.location.request();
                        if (status == PermissionStatus.granted){
                          print("Hello Granted");
                          /*if (Platform.isAndroid) {
                          showDialog(
                            context: context,
                            builder: (_) => CommonDialog(
                              title: alertTitle,

                              description: alertDescription,
                              onTap: () async {
                                await Geolocator.openAppSettings();
                              },
                            ),
                          );
                        }*/
                          Map<String, dynamic> locationParameter = {
                            'permission': locationPermission,
                            'Status': "Allow",
                          };
                          setAnalyticData(locationAllow, locationParameter);
                        } else if (status == PermissionStatus.denied) {
                          print("Hello Denied");
                          Map<String, dynamic> locationParameter = {
                            'permission': locationPermission,
                            'Status': "Disallow",
                          };
                          setAnalyticData(locationDisallow, locationParameter);
                        } else {
                          print("Hello permanent Denied");
                          Map<String, dynamic> locationParameter = {
                            'permission': locationPermission,
                            'Status': "Disallow",
                          };
                          setAnalyticData(locationDisallow, locationParameter);
                        }
                      }
                    }else if(page == 3){
                      bool? isNotification=pref.getBool(isNotificationTap) ?? false;
                      if(!isNotification){
                      final status = await Permission.notification.status;
                      await Permission.notification.request();
                      if(status == PermissionStatus.granted) {
                        print("Hello Granted Noti intro");
                        Map<String, dynamic> notificationParameter = {
                          'permission': notificationPermission,
                          'Status': "Allow",
                        };
                        setAnalyticData(notificationAllow,notificationParameter);
                      }else if(status == PermissionStatus.denied){
                        print("Hello Denied Noti intro");
                        Map<String, dynamic> notificationParameter = {
                          'permission': notificationPermission,
                          'Status': "Disallow",
                        };
                        setAnalyticData(notificationDisallow,notificationParameter);
                      }
                    }
                    }
                    /*else if(page==3){
                    if(Platform.isAndroid){
                      await Permission.bluetoothConnect.request();
                    }
                    }*/
                  },
                  itemCount: introductionScreens.length,
                  itemBuilder: (BuildContext context, int index) {
                    return introductionScreens[
                    index % introductionScreens.length];
                  },
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 13.h,
                  child: Container(
                    alignment: Alignment.center,
                    child: DashedPageIndicator(
                      count: introductionScreens.length,
                      activeIndex:currentPageIndex,
                      dotColor: ColorPath.sliderIndicatorColor.withOpacity(.5),
                      activeDotColor: ColorPath.sliderIndicatorColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> initSharedPreference() async {
    final SharedPreferences preferences = getIt<SharedPreferences>();
    preferences.setBool(isFirstTimeSplashPref, false);
  }
}
