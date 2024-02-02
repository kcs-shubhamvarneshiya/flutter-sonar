// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/fancyShimmerCachedImage.dart';
import '../../model/attraction/attraction.dart';
import '../../router_page/app_router.dart';
import '../../utils/constants.dart';
import '../../utils/iconpath.dart';

class AttractionsSection extends StatelessWidget {
  AttractionsSection({super.key, this.attractionList,this.scrollController});
  List<Attraction>? attractionList;
  Widget? attractionsWidget;
  SharedPreferences? sharedPreferences;
  ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: SizedBox(
              height: 24.h,
              child: ListView.separated(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                physics:const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 2.h),
                itemCount: attractionList!.length<5? attractionList!.length:Constant.attractionItemCount,
                separatorBuilder: (context, index) => HorizontalSpace(width: 0.w),
                itemBuilder: (context, index) {
                  return attractionList![index].options!.isRecommended == true
                      ? GestureDetector(
                       onTap: () {
                         Attraction? selectedAttraction =attractionList!.firstWhere((element) => element.id == attractionList![index].id);
                         getIt<AppRouter>().push(AttractionDetailsRoute(appJsonModel: [selectedAttraction]));
                       },
                        child: Container(
                          width: 45.w,
                          margin: EdgeInsets.only(right: 1.5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: FancyShimmerCachedImage(
                                      imageUrl: attractionList![index]
                                              .thumbnail
                                              .toString() ??
                                          "",
                                      boxFit: BoxFit.cover,
                                      errorWidget: Image.asset(
                                          IconPaths.placeholderImage,fit: BoxFit.cover,),
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 7.h,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.5.h, vertical: 2.h),
                                decoration: const BoxDecoration(
                                  color: ColorPath.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: CustomText(
                                  text: attractionList![index].title,
                                  fontSize: 14.sp,
                                  underline: false,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: addingTonFont,
                                  color: ColorPath.primaryColor,
                                  maxLine: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      : Container();
                },
              ),
            ),
          ),
        ),
        VerticalSpace(height: 1.h)
      ],
    );
  }
}

/*BlocBuilder<AppJsonBloc, AppJsonState>(
      bloc: GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
      builder: (context, state) {
        state.when(
          loading: () {
            attractionsWidget = const Center(child: SizedBox());
          },
          loaded: (appJsonData) {
            // Below lines will remove the null from the attraction list and sort according to displayOrder > exploreList
            appJsonData.attractions?.removeWhere((element) => element.displayOrder?.exploreList == null);
            appJsonData.attractions!.sort((a, b) => a
                .displayOrder!.exploreList
                .toString()
                .compareTo(b.displayOrder!.exploreList.toString()));
            attractionsWidget = appJsonData.attractions!.isNotEmpty ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: SizedBox(
                      height: 28.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 2.h),
                        itemCount: appJsonData.attractions!.length,
                        separatorBuilder: (context, index) =>
                            HorizontalSpace(width: 0.w),
                        itemBuilder: (context, index) {
                          return appJsonData.attractions![index].options!.isRecommended == true
                              ? GestureDetector(
                            onTap: () {
                              List<Attraction> attractionList = [];
                              attractionList.add(appJsonData.attractions![index]);
                              getIt<AppRouter>().push(
                                AttractionDetailsRoute(
                                    appJsonModel: attractionList),
                              );
                            },
                            child: Container(
                              height: 30.h,
                              width:  50.w,
                              margin: EdgeInsets.only(right:1.5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: ClipRRect(
                                        borderRadius:
                                        const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child:FancyShimmerCachedImage(
                                          imageUrl: appJsonData
                                              .attractions![index]
                                              .thumbnail
                                              .toString() ?? "",
                                          boxFit: BoxFit.fill,
                                          errorWidget: Image.asset(IconPaths.placeholderImage),
                                          width: MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 7.h,
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1.5.h, vertical: 2.h),
                                    decoration: const BoxDecoration(
                                      color: ColorPath.whiteColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight:
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    child: CustomText(
                                      text: appJsonData
                                          .attractions![index].title,
                                      fontSize: 14.sp,
                                      underline: false,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: addingTonFont,
                                      color: ColorPath.primaryColor,
                                      maxLine: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                              : Container();
                        },
                      ),
                    ),
                  ),
                )
                */ /*Container(
                  width: MediaQuery.of(context).size.width,
                  color: ColorPath.buttonOutlineColor.withOpacity(0.1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: SizedBox(
                      height: 28.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 2.h),
                        itemCount: appJsonData.attractions!.length,
                        separatorBuilder: (context, index) =>
                            HorizontalSpace(width: 0.w),
                        itemBuilder: (context, index) {
                          return appJsonData.attractions![index].options!.isRecommended == true
                              ? GestureDetector(
                                onTap: () {
                                  List<Attraction> attractionList = [];
                                  attractionList.add(appJsonData.attractions![index]);
                                  getIt<AppRouter>().push(
                                    AttractionDetailsRoute(
                                        appJsonModel: attractionList),
                                  );
                                },
                                child: Container(
                                    height: 23.h,
                                    width: 58.w,
                                    margin: EdgeInsets.only(right:1.5.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              ),
                                              child:FancyShimmerCachedImage(
                                                imageUrl: appJsonData
                                                    .attractions![index]
                                                    .thumbnail
                                                    .toString() ?? "",
                                                boxFit: BoxFit.fill,
                                                errorWidget: Image.asset(IconPaths.placeholderImage),
                                                width: MediaQuery.of(context).size.width,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 10.h,
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.5.h, vertical: 2.h),
                                          decoration: const BoxDecoration(
                                            color: ColorPath.whiteColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                            ),
                                          ),
                                          child: CustomText(
                                            text: appJsonData
                                                .attractions![index].title,
                                            fontSize: 14.sp,
                                            underline: false,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: addingTonFont,
                                            color: ColorPath.primaryColor,
                                            maxLine: 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              )
                              : Container();
                        },
                      ),
                    ),
                  ),
                ),*/ /*
              ],
            ):Container();
          },
          error: (error) {
            attractionsWidget = CustomText(
              text: error,
              fontSize: 13.sp,
              underline: false,
              fontWeight: FontWeight.w500,
              color: ColorPath.primaryColor,
            );
          },
        );
        return attractionsWidget!;
      },
    );*/
