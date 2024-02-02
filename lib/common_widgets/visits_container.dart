import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VisitsContainer extends StatelessWidget {
  const VisitsContainer({
    super.key,
    required this.imageName,
    this.title = '',
    required this.description,
    required this.subText,
    required this.onTap,
    this.isTitle = false,
  });

  final String imageName;
  final String? title;
  final String description;
  final String subText;
  final Function() onTap;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Container(
        decoration: BoxDecoration(
          color: ColorPath.whiteColor,
          border:Border.all(color: ColorPath.containerBorderColor,width:0.2.h),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 18.h,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 2.h, right: 2.h, top: 2.h, bottom: 2.h),
                    height: 12.h,
                    width: 26.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(imageName),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: isTitle == false
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        isTitle == false
                            ? SizedBox(height: 0.5.h)
                            : Padding(
                                padding: const EdgeInsets.only(top: 28.3, left: 10, right: 10),
                                child: CustomText(
                                  text: title,
                                  fontSize: 14.sp,
                                  underline: false,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: addingTonFont,
                                  color: ColorPath.primaryColor,
                                  maxLine: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                        //VerticalSpace(height: 1.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: CustomText(
                            text: description,
                            fontSize: 11.sp,
                            underline: false,
                            fontWeight: FontWeight.w400,
                            fontFamily: interFont,
                            color: ColorPath.primaryColor,
                            overflow: TextOverflow.ellipsis,
                            maxLine: 4,
                            align: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 7.h,
                padding:  EdgeInsets.symmetric(horizontal: 2.5.h),
                decoration:BoxDecoration(
                  color: ColorPath.containerBorderColor.withOpacity(.50),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child:Center(
                  child: CustomText(
                    text: subText,
                    fontSize: 15.sp,
                    underline: false,
                    fontWeight: FontWeight.w300,
                    fontFamily: addingTonFont,
                    color: ColorPath.primaryColor,
                    maxLine: 5,
                  ),
                ),

                /*child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: subText,
                      fontSize: 14.sp,
                      underline: false,
                      fontWeight: FontWeight.w300,
                      fontFamily: addingTonFont,
                      color: ColorPath.primaryColor,
                      maxLine: 5,
                    ),
                    Container(
                      height: 5.h,
                      width: 7.w,
                      padding: EdgeInsets.all(1.h),
                      margin:  EdgeInsets.symmetric(vertical: 1.h),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorPath.primaryColor,
                      ),
                      child: SvgPicture.asset(IconPaths.rightDoubleIcon),
                    ),
                  ],
                ),*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
