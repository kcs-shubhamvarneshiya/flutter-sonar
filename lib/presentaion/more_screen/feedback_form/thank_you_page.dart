// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../utils/iconpath.dart';
import '../../bloc/app_json/app_json_bloc.dart';
import '../../bloc/app_json/app_json_events.dart';
import '../../bloc/app_json/app_json_state.dart';

@RoutePage()
class ThankYouScreen extends StatelessWidget {
  ThankYouScreen({Key? key}) : super(key: key);
  Widget? thankYouScreenWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPath.bottomNavBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Align(
          child: SizedBox(
            height: 20,
            child: Container(),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomText(
                text: thankYou,
                fontSize: 20.sp,
                underline: false,
                fontFamily: addingTonFont,
                fontWeight: FontWeight.w300,
                color: ColorPath.primaryColor,
              ),
            ),
            SizedBox(width: 5.h,)
          ],
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
        child:
            BlocBuilder<AppJsonBloc, AppJsonState>(builder: (context, state) {
          state.when(
            loading: () {
              thankYouScreenWidget = const CircularProgressIndicator();
            },
            loaded: (appJsonData) {
              thankYouScreenWidget = Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      CustomText(
                        align: TextAlign.center,
                        text: thanksFeedback,
                        color: ColorPath.primaryColor,
                        fontFamily: addingTonFont,
                        fontSize: 22.sp,
                        maxLine: 3,
                        fontWeight: FontWeight.w300,
                        underline: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                      VerticalSpace(height: 5.h),
                      ListView.separated(
                        separatorBuilder: (context, index) =>
                            VerticalSpace(height: 3.h),
                        itemCount: IconPaths().socialMediaButtonList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 6.5.h,
                            width: double.infinity,
                            child: ButtonIcon(
                              textDirection: TextDirection.ltr,
                              onTap: () {
                                if (index == 0) {
                                  urlLaunch(appJsonData.lookups!.socialTwitterLink.toString());
                                } else if (index == 1) {
                                  urlLaunch(appJsonData.lookups!.socialInstagramLink.toString());
                                }else if(index == 2){
                                  urlLaunch(appJsonData.lookups!.socialFacebookLink.toString());
                                }else if(index == 3){
                                  urlLaunch(appJsonData.lookups!.socialYoutubeLink.toString());
                                }
                              },
                              buttonName: IconPaths()
                                  .socialMediaButtonList[index]['title'],
                              buttonIcon: IconPaths()
                                  .socialMediaButtonList[index]['icon'],
                              color: ColorPath.primaryButtonColor,
                              borderColor: ColorPath.primaryButtonColor,
                              textColor: ColorPath.whiteColor,
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          alignment: Alignment.bottomCenter,
                          child: RoundedBorderButton(
                            /*Navigator.of(context).popUntil((route) => route.isFirst)*/
                            onTap: () => getIt<AppRouter>().popUntil((route) => route.isFirst),
                            buttonName: okTextCap,
                          ),
                        ),
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
          return thankYouScreenWidget!;
        }),
      ),
    );
  }
}
