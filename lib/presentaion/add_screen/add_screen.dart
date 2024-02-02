// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

@RoutePage()
class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);
  ValueNotifier<int> dialogTrigger = ValueNotifier(0);
  Widget? addScreenWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              IconPaths.addScreenImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BlocProvider(
          create: (context) =>
              GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
          child: BlocBuilder<AppJsonBloc, AppJsonState>(
            builder: (context, state) {
              state.when(
                loading: () {
                  addScreenWidget = const SizedBox();
                },
                loaded: (appJsonData) {
                  addScreenWidget = Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 1.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            //   color: Color(0xFF2D2926),
                            //color: Colors.transparent.withOpacity(.6),
                            color:ColorPath.addDialogColor,
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.h, vertical: 3.h),
                          child: ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  visualDensity: const VisualDensity(vertical: -4),
                                  leading:SvgPicture.asset(IconPaths().addSectionDataList[index]['icon']),
                                  title: CustomText(
                                    text: IconPaths().addSectionDataList[index]['title'],
                                    color: ColorPath.blackColor,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: interFont,
                                    fontSize: 11.sp,
                                    underline: false,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  onTap: () {
                                    if (index == 0) {
                                      Map<String, dynamic> shayonaParameter = {
                                        'type': webpage,
                                        'name': appJsonData.lookups!.shayonaCafe.toString(),
                                      };
                                      setAnalyticData(placeShayonaPage,shayonaParameter);
                                      getIt<AppRouter>().push(MoreDetailsRoute(
                                        url: appJsonData.lookups!.shayonaCafe
                                            .toString(),
                                        pageName: IconPaths().addSectionDataList[index]
                                            ['title'],
                                      ));
                                    }/* else if (index == 1) {
                                      Map<String, dynamic> giftShopParameter = {
                                        'type': webpage,
                                        'name': appJsonData.lookups!.giftShop.toString(),
                                      };
                                      setAnalyticData(giftShopPage,giftShopParameter);
                                      getIt<AppRouter>().push(MoreDetailsRoute(
                                        url: appJsonData.lookups!.giftShop
                                            .toString(),
                                        pageName: IconPaths().addSectionDataList[index]
                                            ['title'],
                                      ));
                                    }
                                    else if (index == 2) {
                                      getIt<AppRouter>()
                                          .push(HoursOperationScreenRoute());
                                    } else if (index == 3) {
                                      getIt<AppRouter>().push(MoreDetailsRoute(
                                        url: appJsonData.lookups!.yourTickets
                                            .toString(),
                                        pageName: IconPaths().addSectionDataList[index]
                                            ['title'],
                                      ));
                                    }
                                    if (index == 4) {
                                      getIt<AppRouter>().push(MoreDetailsRoute(
                                        url: appJsonData.lookups!.bookedTours
                                            .toString(),
                                        pageName: IconPaths().addSectionDataList[index]
                                            ['title'],
                                      ));
                                    }*/ else if (index == 1) {
                                      Map<String, dynamic> giveParameter = {
                                        'type': webpage,
                                        'name': appJsonData.lookups!.donate.toString(),
                                      };
                                      setAnalyticData(givePage,giveParameter);
                                      getIt<AppRouter>().push(MoreDetailsRoute(
                                        url: appJsonData.lookups!.donate.toString(),
                                        pageName: IconPaths().addSectionDataList[index]['title'],
                                      ));
                                    }
                                   /* if (index == 6) {
                                      getIt<AppRouter>().push(FeedbackFromHomeRoute());
                                    } else if (index == 7) {
                                      getIt<AppRouter>().push(MoreDetailsRoute(
                                        url: appJsonData
                                            .lookups!.termsConditions
                                            .toString(),
                                        pageName: IconPaths().addSectionDataList[index]
                                            ['title'],
                                      ));
                                    }*/
                                    else if (index == 2) {
                                      /*Map<String, dynamic> visitorParameter = {
                                        'type': webpage,
                                        'name': appJsonData.lookups!.visitorGuidelines.toString(),
                                      };
                                      setAnalyticData(visitorPage,visitorParameter);
                                      getIt<AppRouter>().push(MoreDetailsRoute(
                                        url: appJsonData.lookups!.visitorGuidelines
                                            .toString(),
                                        pageName:IconPaths().addSectionDataList[index]
                                            ['title'],
                                      ));*/
                                      getIt<AppRouter>().push(const GuidLinesDetailScreenRoute());
                                    }
                                  },
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(color: ColorPath.whiteColor, height: 20, thickness: 1),
                                //VerticalSpace(height: 2.h),
                            itemCount: IconPaths().addSectionDataList.length,
                          ),
                        ),
                        VerticalSpace(height: 1.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 1.h),
                          child: ElevatedButton(
                            onPressed: () => getIt<AppRouter>().pop(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPath.primaryButtonColor,
                              fixedSize: Size(double.maxFinite, 6.5.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.h),
                              ),
                            ),
                            child: CustomText(
                              text: cancelText,
                              underline: false,
                              fontFamily: interFont,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: ColorPath.whiteColor,
                            ),
                          ),
                        ),
                        VerticalSpace(height: 8.h),
                      ],
                    ),
                  );
                },
                error: (error) {
                  CustomText(
                    text: error,
                    fontSize: 16,
                    underline: false,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.primaryColor,
                  );
                },
              );

              return addScreenWidget!;
            },
          ),
        );
      },
    );
  }
}
