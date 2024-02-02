// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/guidelines/guidelines.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/fancyShimmerCachedImage.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

class GuidLinesScreen extends StatelessWidget {
  GuidLinesScreen({Key? key,this.guideline}) : super(key: key);
  Widget? guidLinesWidget;
  Guidelines? guideline;
  @override
  Widget build(BuildContext context) {
    return/* FutureBuilder<bool>(
        future: Future.delayed(const Duration(milliseconds: 500), () => true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          } else if (snapshot.hasData && snapshot.data!) {
            return guideline !=null ? DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color:ColorPath.secondaryBrownColor, width: 0.1.h),
                  //bottom: BorderSide(color:ColorPath.secondaryBrownColor, width: 0.1.h),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h,bottom: 1.h,left: 2.5.h),
                      child: const CustomSectionTitle(
                          text: guidelines),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.5.h),
                      decoration: BoxDecoration(
                          color: ColorPath.bottomNavBgColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorPath.secondaryBrownColor.withOpacity(.5))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8.h,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.5.h,vertical: 2.h),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                                child: FancyShimmerCachedImage(
                                  imageUrl:guideline!.image.toString() ?? "",
                                  boxFit: BoxFit.fill,
                                  errorWidget: Image.asset(
                                      IconPaths.placeholderImage),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                ),
                              ),
                            ),
                          ),
                          //Announcements Date
                          VerticalSpace(height: 1.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                            child: CustomText(
                              text: guideline!.description,
                              fontSize: 12.sp,
                              underline: false,
                              fontFamily: interFont,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                              color: ColorPath.primaryColor,
                              maxLine: 4,
                              lineHeight: 1.4,
                            ),
                          ),
                          VerticalSpace(height: 1.h),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            alignment: Alignment.center,
                            child: ButtonIcon(
                              color: ColorPath.primaryButtonColor,
                              borderColor: ColorPath.primaryButtonColor,
                              textColor: ColorPath.whiteColor,
                              onTap: () {
                                getIt<AppRouter>().push(GuidLinesDetailScreenRoute());
                              },
                              buttonName: viewGuidelines,
                              buttonIcon: IconPaths.rightWhiteIcon,
                            ),
                          ),
                          VerticalSpace(height: 2.5.h)
                        ],
                      ),
                    ),
                    VerticalSpace(height: 3.h),
                  ]
              ),
            ) :Container();
          } else {
            return const SizedBox();
          }
        });
            return
          } else {
            return const SizedBox();
          }
        });*/
      guideline !=null ? DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color:ColorPath.secondaryBrownColor, width: 0.1.h),
            //bottom: BorderSide(color:ColorPath.secondaryBrownColor, width: 0.1.h),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.h,bottom: 1.h,left: 2.5.h),
                child: const CustomSectionTitle(
                    text: guidelines),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.5.h),
                decoration: BoxDecoration(
                    color: ColorPath.bottomNavBgColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorPath.secondaryBrownColor.withOpacity(.5))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5.h,vertical: 2.h),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          child: FancyShimmerCachedImage(
                            imageUrl:guideline!.image.toString() ?? "",
                            boxFit: BoxFit.fill,
                            errorWidget: Image.asset(
                                IconPaths.placeholderImage),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                          ),
                        ),
                      ),
                    ),
                    //Announcements Date
                    VerticalSpace(height: 1.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                      child: CustomText(
                        text: guideline!.description,
                        fontSize: 12.sp,
                        underline: false,
                        fontFamily: interFont,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: ColorPath.primaryColor,
                        maxLine: 4,
                        lineHeight: 1.4,
                      ),
                    ),
                    VerticalSpace(height: 1.h),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      alignment: Alignment.center,
                      child: ButtonIcon(
                        color: ColorPath.primaryButtonColor,
                        borderColor: ColorPath.primaryButtonColor,
                        textColor: ColorPath.whiteColor,
                        onTap: () {
                          getIt<AppRouter>().push(GuidLinesDetailScreenRoute());
                        },
                        buttonName: viewGuidelines,
                        buttonIcon: IconPaths.rightWhiteIcon,
                      ),
                    ),
                    VerticalSpace(height: 2.5.h)
                  ],
                ),
              ),
              VerticalSpace(height: 3.h),
            ]
        ),
      ) :Container();
  }
}
