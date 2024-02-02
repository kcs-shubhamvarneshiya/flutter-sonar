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

class VisitPlan extends StatelessWidget {
  const VisitPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: 2.h),
          child: CustomText(
            text: visitPlan.toUpperCase(),
            fontSize: 15.sp,
            underline: false,
            fontFamily: addingTonFont,
            fontWeight: FontWeight.w300,
            color: ColorPath.primaryColor,
            letterSpacing: 2,
          ),
        ),
        VerticalSpace(height: 1.h),
        VisitsContainer(
          description: visitPlanDesc,
          imageName: IconPaths.swamiNarayanImage,
          subText: plan,
          isTitle: false,
          onTap: () => getIt<AppRouter>().push(PlanVisitRoute()),
        ),
      ],
    );
  }
}
