// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/constants.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../utils/enums.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';
import 'more_section.dart';

@RoutePage()
class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);

  ValueNotifier<int> dialogTrigger = ValueNotifier(0);
  String pageRoute = "";
  Widget? moreScreenWidget;
  List<String> titleList = [
    dailyTimings,
    directionCampus,
    aboutUs,
    glossary,
    referAFriend,
    submitFeedback
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(isNotification: true),
      body: BlocBuilder<AppJsonBloc, AppJsonState>(
        bloc: GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
        builder: (context, state) {
          state.when(
            loading: () {
              moreScreenWidget =
                  const Center(child: CircularProgressIndicator());
            },
            loaded: (appJsonData) {
              var telephoneIndex = appJsonData.campus!.contactInfo!.indexWhere(
                  (element) => element.type == ContactType.tel.name);
              var emailIndex = appJsonData.campus!.contactInfo!.indexWhere(
                  (element) => element.type == ContactType.email.name);
              var filteredEventList = appJsonData.events!.where((element) {
                var endTime = DateTime.parse(element.eventDate.toString());
                return endTime.isAfter(DateTime.now());
              }).toList();
              moreScreenWidget = SingleChildScrollView(
                child: Container(
                  color: ColorPath.bottomNavBgColor,
                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //VerticalSpace(height: 1.h),
                      VerticalSpace(height: 13.h),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const ScrollPhysics(),
                        itemCount: titleList.length,
                        itemBuilder: (context, index) {
                          return (filteredEventList.isEmpty &&
                                  titleList[index].toString() == upcomingEvent)
                              ? Container()
                              : MoreSections(
                                  appData: titleList[index].toString(),
                                  onTap: () {
                                    Logger().i("index $index");
                                    if (index == 0) {
                                      setAnalyticData(
                                          hoursOperation, <String, String>{});
                                      getIt<AppRouter>()
                                          .push(HoursOperationScreenRoute());
                                    } else if (index == 1) {
                                      Map<String, dynamic> visitorParameter = {
                                        'type': webpage,
                                        'name': appJsonData
                                            .lookups!.visitorGuidelines
                                            .toString(),
                                      };
                                      setAnalyticData(
                                          visitGuid, visitorParameter);
                                      getIt<AppRouter>().push(
                                          HomeBottomNavRoute(
                                              initialIndex: 2,
                                              scrollIndexValue: true));
                                    } else if (index == 2) {
                                      Map<String, dynamic> aboutParameter = {
                                        'type': webpage,
                                        'name': appJsonData.lookups!.aboutUs
                                            .toString(),
                                      };
                                      setAnalyticData(aboutUs, aboutParameter);
                                      getIt<AppRouter>().push(MoreDetailsRoute(
                                        url: appJsonData.lookups!.aboutUs
                                            .toString(),
                                        pageName: aboutUs,
                                      ));
                                    } else if (index == 3) {
                                      Map<String, dynamic> glossaryParameter = {
                                        'type': webpage,
                                        'name': appJsonData.lookups!.glossary
                                            .toString(),
                                      };
                                      setAnalyticData(
                                          glossary, glossaryParameter);
                                      getIt<AppRouter>().push(MoreDetailsRoute(
                                          url: appJsonData.lookups!.glossary
                                              .toString(),
                                          pageName: glossary));
                                    } else if (index == 4) {
                                      String androidAppUrl =
                                          Constant.androidPlayStoreURL;
                                      String iosAppUrl =
                                          Constant.iOSAppStoreURL;
                                      String message =
                                          "$referAFriendMsg\nAndroid App: $androidAppUrl\niOSApp: $iosAppUrl";
                                      EasyDebounce.debounce(
                                        'shareButton', // A unique ID for the debounce
                                        // Debounce duration
                                        const Duration(milliseconds: 400),
                                        () {
                                          Share.share(message);
                                        },
                                      );
                                    } else if (index == 5) {
                                      setAnalyticData(
                                          nameFeedback, <String, String>{});
                                      getIt<AppRouter>()
                                          .push(FeedbackFromHomeRoute());
                                    }
                                  },
                                  index: index,
                                );
                        },
                      ),
                      VerticalSpace(height: 3.h),
                      CustomText(
                        text:
                            "${appJsonData.campus!.name.toString()}\n${appJsonData.campus!.address!.street.toString()}, ${appJsonData.campus!.address!.city.toString()}\n${appJsonData.campus!.address!.state.toString()} ${appJsonData.campus!.address!.postal.toString()}"
                            "\n${appJsonData.campus!.contactInfo![telephoneIndex].value.toString()}\n\n${Constant.contactMediaTitle}\n${appJsonData.campus!.contactInfo![emailIndex].value.toString()}",
                        fontSize: 12.sp,
                        underline: false,
                        fontWeight: FontWeight.w500,
                        color: ColorPath.primaryColor,
                        maxLine: 7,
                        align: TextAlign.center,
                      ),
                      VerticalSpace(height: 2.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: followUs,
                              fontSize: 12.sp,
                              underline: false,
                              fontWeight: FontWeight.w500,
                              color: ColorPath.primaryColor,
                            ),
                            HorizontalSpace(width: 2.h),
                            socialImage(IconPaths.youtubeIcon, () {
                              Map<String, dynamic> youtubeParameter = {
                                'type': webpage,
                                'name': appJsonData.lookups!.socialYoutubeLink
                                    .toString(),
                              };
                              setAnalyticData(youtubePage, youtubeParameter);
                              urlLaunch(appJsonData.lookups!.socialYoutubeLink
                                  .toString());
                            }),
                            //SvgPicture.asset(youtubeIcon),
                            HorizontalSpace(width: 2.h),
                            socialImage(IconPaths.instagramLinkIcon, () {
                              Map<String, dynamic> instagramParameter = {
                                'type': webpage,
                                'name': appJsonData.lookups!.socialInstagramLink
                                    .toString(),
                              };
                              setAnalyticData(
                                  instagramPage, instagramParameter);
                              urlLaunch(appJsonData.lookups!.socialInstagramLink
                                  .toString());
                            }),
                            //SvgPicture.asset(instagramLinkIcon),
                            HorizontalSpace(width: 2.h),
                            socialImage(IconPaths.facebookIcon, () {
                              Map<String, dynamic> facebookParameter = {
                                'type': webpage,
                                'name': appJsonData.lookups!.socialFacebookLink
                                    .toString(),
                              };
                              setAnalyticData(facebookPage, facebookParameter);
                              urlLaunch(appJsonData.lookups!.socialFacebookLink
                                  .toString());
                            }),
                            //SvgPicture.asset(facebookIcon),
                            HorizontalSpace(width: 2.h),
                            socialImage(IconPaths.twitterIcon, () {
                              Map<String, dynamic> twitterParameter = {
                                'type': webpage,
                                'name': appJsonData.lookups!.socialTwitterLink
                                    .toString(),
                              };
                              setAnalyticData(twitterPage, twitterParameter);
                              urlLaunch(appJsonData.lookups!.socialTwitterLink
                                  .toString());
                            }),
                            //SvgPicture.asset(twitterIcon)
                          ]),
                      VerticalSpace(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonIcon(
                            onTap: () {
                              Map<String, dynamic> privacyParameter = {
                                'type': webpage,
                                'name': appJsonData.lookups!.privacyPolicy
                                    .toString(),
                              };
                              setAnalyticData(
                                  namePrivacyPolicy, privacyParameter);
                              getIt<AppRouter>().push(MoreDetailsRoute(
                                url: appJsonData.lookups!.privacyPolicy
                                    .toString(),
                                pageName: priPolicy,
                              ));
                            },
                            buttonName: priPolicy,
                            buttonIcon: IconPaths.rightIcon,
                            borderColor: ColorPath.primaryButtonColor,
                          ),
                          const HorizontalSpace(width: 1),
                          ButtonIcon(
                              onTap: () {
                                Map<String, dynamic> termsParameter = {
                                  'type': webpage,
                                  'name': appJsonData.lookups!.termsConditions
                                      .toString(),
                                };
                                setAnalyticData(
                                    nameTermsCondition, termsParameter);
                                getIt<AppRouter>().push(MoreDetailsRoute(
                                  url: appJsonData.lookups!.termsConditions
                                      .toString(),
                                  pageName: termsCond,
                                ));
                              },
                              buttonName: termsCond,
                              buttonIcon: IconPaths.rightIcon,
                              borderColor: ColorPath.primaryButtonColor),
                        ],
                      ),
                      VerticalSpace(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(IconPaths.bapsIcon),
                          HorizontalSpace(width: 2.h),
                          Container(
                              height: 8.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    IconPaths.akshardhamLogo,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      VerticalSpace(height: 5.h),
                      FutureBuilder(
                        future: appInfo(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.done:
                              return Container(
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsets.only(bottom: 16.h),
                                child: CustomText(
                                  text: '$appVersion ${snapshot.data!.version}',
                                  fontSize: 10.sp,
                                  underline: false,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: interFont,
                                  color: ColorPath.primaryColor,
                                  maxLine: 5,
                                ),
                              );
                            default:
                              return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
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

          return moreScreenWidget!;
        },
      ),
      //),
    );
  }

  Widget socialImage(String path, VoidCallback onPress) {
    return InkWell(
      onTap: onPress,
      child: SvgPicture.asset(
        path,
      ),
    );
  }
}
