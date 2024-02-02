import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/visits_container.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../router_page/app_router.dart';
import '../../utils/iconpath.dart';

class FindingWay extends StatelessWidget {
  const FindingWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(height: 3.5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
          child: CustomText(
            text: findWay.toUpperCase(),
            fontSize: 15.sp,
            underline: false,
            fontWeight: FontWeight.w300,
            fontFamily: addingTonFont,
            color: ColorPath.primaryColor,
            maxLine: 5,
            overflow: TextOverflow.ellipsis,
            letterSpacing: 2,
          ),
        ),
        VisitsContainer(
          key: const Key('finding_way_container'),
          description: findWayDesc,
          imageName: IconPaths.swamiNarayanImage,
          subText: exploreAttractions,
          isTitle: false,
          onTap: () {
            getIt<AppRouter>().push(HomeBottomNavRoute(initialIndex: 1));
          },
        ),
        //const VerticalSpace(height: 100),
      ],
    );
  }
}
