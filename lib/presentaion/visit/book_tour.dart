import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/visits_container.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/iconpath.dart';

class BookTour extends StatelessWidget {
  const BookTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*FutureBuilder<bool>(
        future: Future.delayed(const Duration(milliseconds: 100), () => true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          } else if (snapshot.hasData && snapshot.data!) {
            return DecoratedBox(
              decoration:
              BoxDecoration(
                color: ColorPath.secondaryBrownColor.withOpacity(0.10),
                border: Border(
                  top: BorderSide(
                      color: ColorPath.secondaryBrownColor, width: 0.1.h),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(height: 1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.5.h, vertical: 2.h),
                    child: CustomText(
                      text: bookTour.toUpperCase(),
                      fontSize: 15.sp,
                      underline: false,
                      fontWeight: FontWeight.w300,
                      fontFamily: addingTonFont,
                      color: ColorPath.primaryColor,
                      maxLine: 5,
                      letterSpacing: 2,
                    ),
                  ),
                  VerticalSpace(height: 1.h),
                  VisitsContainer(
                    key: const Key('book_tour_container'),
                    title: mandirTour,
                    description: mandirTourDesc,
                    imageName: IconPaths.swamiNarayanImage,
                    subText: commingSoon,
                    onTap: () {},
                    isTitle: true,
                  ),
                  VerticalSpace(height: 3.h),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        }
    );*/
      DecoratedBox(
        decoration:
        BoxDecoration(
          color: ColorPath.secondaryBrownColor.withOpacity(0.10),
          border: Border(
            top: BorderSide(
                color: ColorPath.secondaryBrownColor, width: 0.1.h),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.5.h, vertical: 2.h),
              child: CustomText(
                text: bookTour.toUpperCase(),
                fontSize: 15.sp,
                underline: false,
                fontWeight: FontWeight.w300,
                fontFamily: addingTonFont,
                color: ColorPath.primaryColor,
                maxLine: 5,
                letterSpacing: 2,
              ),
            ),
            VerticalSpace(height: 1.h),
            VisitsContainer(
              key: const Key('book_tour_container'),
              title: mandirTour,
              description: mandirTourDesc,
              imageName: IconPaths.bookTourImage,
              subText: commingSoon,
              onTap: () {},
              isTitle: false,
            ),
            VerticalSpace(height: 3.h),
          ],
        ),
      );
  }
}