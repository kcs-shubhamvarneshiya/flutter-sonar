import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/visits_container.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/iconpath.dart';

class RequestGroupTour extends StatelessWidget {
  const RequestGroupTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*FutureBuilder<bool>(
        future: Future.delayed(const Duration(milliseconds: 100), () => true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          } else if (snapshot.hasData && snapshot.data!) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                  child: CustomText(
                    text: groupTour.toUpperCase(),
                    fontSize: 15.sp,
                    underline: false,
                    fontWeight: FontWeight.w300,
                    fontFamily: addingTonFont,
                    color: ColorPath.primaryColor,
                    maxLine: 1,
                    letterSpacing: 2,
                  ),
                ),
                VerticalSpace(height: 1.h),
                VisitsContainer(
                  key: const Key('request_group_tour'),
                  title: groupVisits,
                  description: groupTourDesc,
                  imageName: IconPaths.swamiNarayanImage,
                  subText: commingSoon,
                  onTap: () {},
                  isTitle: true,
                ),
                VerticalSpace(height: 3.5.h),
              ],
            );
          } else {
            return const SizedBox();
          }
        }
    );*/
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
            child: CustomText(
              text: groupTour.toUpperCase(),
              fontSize: 15.sp,
              underline: false,
              fontWeight: FontWeight.w300,
              fontFamily: addingTonFont,
              color: ColorPath.primaryColor,
              maxLine: 1,
              letterSpacing: 2,
            ),
          ),
          VerticalSpace(height: 1.h),
          VisitsContainer(
            key: const Key('request_group_tour'),
            title: groupVisits,
            description: groupTourDesc,
            imageName: IconPaths.groupVisitImage,
            subText: commingSoon,
            onTap: () {},
            isTitle: false,
          ),
          VerticalSpace(height: 3.5.h),
        ],
      );
  }
}