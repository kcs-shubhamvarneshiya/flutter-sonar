// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/news/news.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../router_page/app_router.dart';
import '../../utils/constants.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

//Latest news section
class LatestNews extends StatelessWidget {
  LatestNews({Key? key,this.news}) : super(key: key);
  Widget? announcementWidget;
  List<News>? news;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    if(news!.isNotEmpty){
      news?.sort((a, b) {
        return b.publishedAt!.compareTo(a.publishedAt.toString());
      });
    }
    return news!.isNotEmpty ?
    DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: ColorPath.secondaryBrownColor, width: 0.1.h),
                //bottom: BorderSide(color:ColorPath.secondaryBrownColor, width: 0.1.h),
              ),
            ),
            child:RawScrollbar(
              controller:scrollController,
              thumbVisibility: true,
              thickness: 0.5.h,
              padding: EdgeInsets.only(bottom: 2.h),
              child: Container(
                color: ColorPath.whiteColor.withOpacity(0.1),
                padding:EdgeInsets.only(top: 1.5.h, bottom: 2.h ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomSectionTitle(text: newsTitle),
                          GestureDetector(
                            onTap: () {
                              setAnalyticData(latestNews,<String, String>{});
                              getIt<AppRouter>().push(LatestNewsItemsRoute());
                            },
                            child: CustomText(
                              text: viewMore,
                              fontSize: 10.sp,
                              underline: false,
                              fontFamily: interFont,
                              fontWeight: FontWeight.w400,
                              color: ColorPath.commonTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalSpace(height: 1.5.h),
                    //News Lists
                    Container(
                      margin: EdgeInsets.zero,
                      height: MediaQuery.of(context).size.height *.28,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: news!.length<5? news!.length:Constant.attractionItemCount,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                          left: 2.h,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics:const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 1.5.h),
                            child: GestureDetector(
                              onTap: (){
                                getIt<AppRouter>().push(MoreDetailsRoute(
                                    url:news![index].externalLink !=null ? news![index].externalLink!:'',
                                    // pageName:appJsonData.news![index].title!,
                                    pageName: newsdetail
                                ));
                              },
                              child: Container(
                                width: 45.w,
                                padding: EdgeInsets.only(bottom:1.h),
                                decoration: BoxDecoration(
                                    color: ColorPath.whiteColor,
                                    borderRadius: BorderRadius.circular(1.h),
                                    border: Border.all(color:ColorPath.containerBorderColor)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(1.h),
                                          topRight: Radius.circular(1.h),
                                        ),
                                        child:FancyShimmerCachedImage(
                                          imageUrl:news![index].thumbnail
                                              .toString() ?? "",
                                          boxFit: BoxFit.cover,
                                          errorWidget: Image.asset(IconPaths.placeholderImage),
                                          width: MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                    ),
                                    VerticalSpace(height: 1.h),
                                    //News Date
                                    Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 1.5.h),
                                      child: CustomText(
                                        text:selectedDate(news![index].publishedAt.toString(),Constant.ISO_TIMEZONE,Constant.EVENT_DATE_FORMAT),
                                        fontSize: 12.sp,
                                        underline: false,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: addingTonFont,
                                        fontWeight: FontWeight.normal,
                                        color: ColorPath.blackColor,
                                        maxLine: 1,
                                        align: TextAlign.start,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                    VerticalSpace(height: 1.h),
                                    //Announcements Title
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 1.5.h),
                                        child: CustomText(
                                          text: news![index].title,
                                          fontSize: 14.sp,
                                          underline: false,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: interFont,
                                          fontWeight: FontWeight.w300,
                                          color: ColorPath.blackColor,
                                          maxLine: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
          ):Container();
  }
}
