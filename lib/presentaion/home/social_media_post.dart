// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/social_media/social_media.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/fancyShimmerCachedImage.dart';
import '../../utils/constants.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

class SocialMediaPosts extends StatelessWidget {
  SocialMediaPosts({super.key, this.socialMedia});

  Widget? galleriesWidget;
  List<SocialMedia>? socialMedia;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    if (socialMedia!.isNotEmpty) {
      socialMedia?.sort((a, b) {
        return b.date!.compareTo(a.date.toString());
      });
    }
    return socialMedia!.isNotEmpty
        ? RawScrollbar(
            controller: scrollController,
            thumbVisibility: true,
            thickness: 0.5.h,
            padding: EdgeInsets.only(bottom: 1.h),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorPath.containerBorderColor.withOpacity(.30),
                  border: Border(
                    top: BorderSide(
                        color: ColorPath.secondaryBrownColor, width: 0.1.h),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: const CustomSectionTitle(text: connectWithUs),
                      ),
                      VerticalSpace(height: 1.5.h),
                      //Announcements Lists
                      SizedBox(
                        height: 44.h,
                        child: ListView.builder(
                          itemCount: socialMedia!.length,
                          shrinkWrap: true,
                          controller: scrollController,
                          padding: EdgeInsets.only(left: 2.h),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            String socialMediaIcon =
                                "$iconsPath/${socialMedia![index].type?.toLowerCase()}_logo1.svg";

                            return GestureDetector(
                              onTap: () {
                                urlLaunch(socialMedia![index].link.toString());
                              },
                              child: Container(
                                width: 60.w,
                                padding: EdgeInsets.all(1.h),
                                margin: EdgeInsets.only(right: 1.5.h),
                                decoration: BoxDecoration(
                                  color: ColorPath.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      //contentPadding: EdgeInsets.all(1.h),
                                      leading: Container(
                                        height: 5.h,
                                        width: 5.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorPath
                                                  .profilePicContainer),
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.h),
                                          child: FancyShimmerCachedImage(
                                            imageUrl: socialMedia![index]
                                                    .profileImage
                                                    .toString() ??
                                                "",
                                            boxFit: BoxFit.cover,
                                            errorWidget: Image.asset(
                                                IconPaths.placeholderImage),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                      ),
                                      title: CustomText(
                                        text: socialMedia![index].handle,
                                        fontSize: 12.sp,
                                        underline: false,
                                        fontFamily: interFont,
                                        fontWeight: FontWeight.normal,
                                        color: ColorPath.primaryColor,
                                        overflow: TextOverflow.ellipsis,
                                        maxLine: 1,
                                      ),
                                      subtitle: CustomText(
                                        text: selectedDate(
                                            socialMedia![index].date.toString(),
                                            Constant.ISO_TIMEZONE,
                                            Constant.NEW_DATE_FORMAT),
                                        fontSize: 10.sp,
                                        underline: false,
                                        fontFamily: interFont,
                                        fontWeight: FontWeight.normal,
                                        color: ColorPath.primaryColor,
                                      ),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          /*getIt<AppRouter>().push(MoreDetailsRoute(
                                              url: appJsonData
                                                  .socialMedia![index].link
                                                  .toString(),
                                              pageName: appJsonData
                                                  .socialMedia![index].type
                                                  .toString(),
                                            ));*/
                                          urlLaunch(socialMedia![index]
                                              .link
                                              .toString());
                                        },
                                        child: SizedBox(
                                          height: 7.h,
                                          width: 7.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: SvgPicture.asset(
                                                socialMediaIcon),
                                          ),
                                        ),
                                      ),
                                    ),
                                    (socialMedia![index].thumbnail != null)
                                        ? Container(
                                            height: 20.h,
                                            width: 50.w,
                                            margin: EdgeInsets.fromLTRB(
                                                1.5.h, 1.0.h, 1.5.h, 1.0.h),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: FancyShimmerCachedImage(
                                                imageUrl: socialMedia![index]
                                                        .thumbnail
                                                        .toString() ??
                                                    "",
                                                boxFit: BoxFit.cover,
                                                errorWidget: Image.asset(
                                                    IconPaths.placeholderImage),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              ),
                                            ),
                                          )
                                        : const Center(child: SizedBox()),
                                    VerticalSpace(height: 1.h),
                                    //Social Media Title
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.5.h),
                                        child: CustomText(
                                          text: socialMedia![index].description,
                                          fontSize: 12.sp,
                                          underline: false,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: interFont,
                                          fontWeight: FontWeight.normal,
                                          color: ColorPath.blackColor,
                                          maxLine:
                                              (socialMedia![index].thumbnail !=
                                                      null)
                                                  ? 3
                                                  : 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      VerticalSpace(height: 2.h),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
