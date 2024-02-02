// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/campus/campus.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

//WelcomeContainer
class WelcomeContainer extends StatelessWidget {
  WelcomeContainer({Key? key,this.campus}) : super(key: key);
  Widget? welcomeWidget;
  Campus? campus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
      child: /*BlocProvider(
        create: (context) =>
        GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
        child: BlocBuilder<AppJsonBloc, AppJsonState>(
          builder: (context, state) {
            state.when(
              loading: () {
                welcomeWidget = const Center(child: SizedBox());
              },
              loaded: (appJsonData) {
                welcomeWidget = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: welcomeText,
                      fontFamily: addingTonFont,
                      fontSize: 21.sp,
                      underline: false,
                      fontWeight: FontWeight.w300,
                      color: ColorPath.primaryColor,
                    ),
                    VerticalSpace(height: 1.5.h),
                    //Carousel Description
                    CustomText(
                      text: appJsonData.campus!.description,
                      fontFamily: interFont,
                      fontSize: 11.sp,
                      underline: false,
                      fontWeight: FontWeight.w400,
                      color: ColorPath.primaryColor,
                      maxLine: 10,
                    ),
                    VerticalSpace(height: 2.h),
                  ],
                );
              },
              error: (error) {
                welcomeWidget = CustomText(
                  text: error,
                  fontSize: 13.sp,
                  underline: false,
                  fontWeight: FontWeight.w500,
                  color: ColorPath.primaryColor,
                );
              },
            );
            return welcomeWidget!;
          },
        ),
      ),*/
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: welcomeText,
            fontFamily: addingTonFont,
            fontSize: 21.sp,
            underline: false,
            fontWeight: FontWeight.w300,
            color: ColorPath.primaryColor,
          ),
          VerticalSpace(height: 1.5.h),
          //Carousel Description
          CustomText(
            text: campus!.description,
            fontFamily: interFont,
            fontSize: 11.sp,
            underline: false,
            fontWeight: FontWeight.w400,
            color: ColorPath.primaryColor,
            maxLine: 10,
          ),
          VerticalSpace(height: 2.h),
        ],
      )
    );
  }
}
