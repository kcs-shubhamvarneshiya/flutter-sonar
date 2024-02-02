import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../model/attraction/attraction.dart';
import '../presentaion/bloc/visit_bloc/visit_bloc.dart';
import '../presentaion/bloc/visit_bloc/visit_event.dart';
import '../utils/constants.dart';
import 'fancyShimmerCachedImage.dart';

class ActivityList extends StatelessWidget {
  const ActivityList(
      {Key? key,
      required this.itemBuilder,
      required this.indexItem,
      this.isScroll = false})
      : super(key: key);
  final IndexedWidgetBuilder itemBuilder;
  final int indexItem;
  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) => const VerticalSpace(height: 35),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: isScroll
          ? const ClampingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: indexItem,
    );
  }
}

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({
    super.key,
    required this.title,
    required this.imageName,
    required this.desc,
    required this.time,
    required this.btnIcon,
    required this.btnName,
    required this.onTap,
    required this.isActivityAdded,
    required this.attraction
  });

  final String imageName;
  final String title;
  final String desc;
  final int time;
  final String btnName;
  final String btnIcon;
  final bool isActivityAdded;
  final Function() onTap;
  final Attraction? attraction;
  @override
  Widget build(BuildContext context) {
    var timeDuration=time != null && time!="null" ? time:0;
    return Container(
      decoration: BoxDecoration(
        color: ColorPath.whiteColor,
        border:Border.all(color:isActivityAdded?ColorPath.whiteColor:ColorPath.containerBorderColor,width:0.2.h),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isActivityAdded ?
          Container(
            padding: EdgeInsets.only(left:2.h,right: 2.h,top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonIcon(
                  onTap:onTap,
                  buttonName: addPlan,
                  buttonIcon: IconPaths.addIconButton,
                  color: ColorPath.secondaryButtonColor,
                  textColor: ColorPath.whiteColor,
                  borderColor: ColorPath.secondaryButtonColor,
                ),
              ],
            ),
          ) : Container(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
            child: SizedBox(
              height: 18.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:FancyShimmerCachedImage(
                  imageUrl: imageName ?? "",
                  boxFit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  errorWidget: Image.asset(IconPaths.placeholderImage,fit: BoxFit.cover,),
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),
          VerticalSpace(height: 1.h),
          //Announcements Date
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: CustomText(
              text: title.toUpperCase(),
              fontSize: 14.sp,
              underline: false,
              fontFamily: addingTonFont,
              fontWeight: FontWeight.w300,
              color: ColorPath.primaryColor,
              letterSpacing: 2,
              maxLine: 3,
            ),
          ),
          Visibility(
              visible:!isActivityAdded,
              child: VerticalSpace(height: 2.h)),

          Visibility(
            visible:!isActivityAdded,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(8.0)),
                  color: ColorPath.secondaryBrownColor.withOpacity(.40),
                ),
                padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.2.h),
                child: CustomText(
                  text:timeDuration > 60 ? '$duration: ${minutesToHoursMinutes(timeDuration)}':'$duration: ${timeDuration.toString()} $activityTime',
                  fontSize: 10.sp,
                  underline: false,
                  fontWeight: FontWeight.w300,
                  fontFamily: interFont,
                  color: ColorPath.primaryColor,
                  maxLine: 5,
                ),
              ),
            ),
          ),
          VerticalSpace(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: InkWell(
              onTap: () {},
              child: CustomText(
                text: desc,
                fontSize: 14,
                underline: false,
                overflow: TextOverflow.ellipsis,
                fontFamily: interFont,
                fontWeight: FontWeight.w400,
                color: ColorPath.primaryColor,
                maxLine: 3,
              ),
            ),
          ),
          VerticalSpace(height: isActivityAdded ? 2.h:4.h),
          isActivityAdded ?
          GestureDetector(
            onTap: () {
              /*if(context.mounted){
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              }*/
              getIt<AppRouter>().push(HomeBottomNavRoute(initialIndex: 1, attraction: attraction));
            },
            child: Container(
              padding: EdgeInsets.only(left:2.h,right: 2.h,bottom: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   SvgPicture.asset(IconPaths.visitLocationIcon),
                   HorizontalSpace(width: 1.h),
                   CustomText(
                    text: title,
                    fontSize: 14,
                    underline: false,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: interFont,
                    fontWeight: FontWeight.w400,
                    color: ColorPath.primaryColor,
                    maxLine: 3,
                  ),
                ],
              ),
            ),
          ) : Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: ButtonIcon(
              onTap: onTap,
              buttonName: btnName,
              buttonIcon: btnIcon,
              borderColor: ColorPath.primaryButtonColor,
            ),
          ),
          VerticalSpace(height: isActivityAdded ? 0.h : 2.5.h),
        ],
      ),
    );
  }
}
