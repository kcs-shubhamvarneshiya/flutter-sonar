import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class MoreSections extends StatefulWidget {
  const MoreSections(
      {Key? key,
      this.icon,
      required this.appData,
      required this.onTap,
      this.index})
      : super(key: key);
  final Icon? icon;
  final String appData;
  final Function onTap;
  final int? index;

  @override
  State<MoreSections> createState() => MoreSectionsState();
}

class MoreSectionsState extends State<MoreSections> {
  int? tappedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            color: tappedIndex == widget.index
                ? ColorPath.bottomNavBgColor
                : ColorPath.bottomNavBgColor,
            border: Border.all(color: ColorPath.primaryButtonColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            key: const ValueKey('go_page'),
            contentPadding: EdgeInsets.symmetric(horizontal: 1.5.h),
            visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
            leading: widget.icon,
            title: CustomText(
              text: widget.appData,
              fontSize: 12.sp,
              underline: false,
              fontWeight: FontWeight.w500,
              color: ColorPath.primaryColor,
            ),
            trailing: SvgPicture.asset(IconPaths.rightIcon),
            onTap: () {
              widget.onTap();
            },
          ),
        ),
      ),
    );
  }
}
