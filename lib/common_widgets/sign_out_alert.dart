import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/user_model/user_model.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/login_bloc/login_event_data.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../presentaion/bloc/login_bloc/login_bloc.dart';
import '../router_page/app_router.dart';
import '../utils/iconpath.dart';


class SignOutAlert extends StatefulWidget {
  SignOutAlert({Key? key,this.model}) : super(key: key);
  UserModel? model;
  @override
  State<SignOutAlert> createState() => _SignOutAlertState();
}

class _SignOutAlertState extends State<SignOutAlert> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.5.h),
      child: SizedBox(
        width: 100.h,
        child: Padding(padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                key: const Key('close_alert'),
                onTap: () => getIt<AppRouter>().pop(),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    padding: EdgeInsets.all(1.h),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorPath.primaryColor,
                    ),
                    child: SvgPicture.asset(IconPaths.removeCircleIcon),
                  ),
                ),
              ),
              VerticalSpace(height: 5.h),
              CustomText(
                text: "${widget.model!.fn} ${widget.model!.ln}",
                fontSize: 18.sp,
                underline: false,
                fontFamily: addingTonFont,
                fontWeight: FontWeight.w400,
                color: ColorPath.primaryColor,
                maxLine: 3,
              ),
              /*VerticalSpace(height: 1.5.h),
              CustomText(
                align: TextAlign.center,
                text: "${widget.model!.sid}",
                fontSize: 11.sp,
                underline: false,
                fontFamily: interFont,
                fontWeight: FontWeight.w300,
                color: ColorPath.primaryColor,
                maxLine: 3,
              ),*/
              VerticalSpace(height: 3.h),
              SizedBox(
                width: double.infinity,
                child: ButtonIconDialog(
                  onTap: () async {
                    GetIt.I<LoginBloc>().add(const LogoutEventData());
                    getIt<AppRouter>().pop();
                  },
                  buttonName: signOut,
                  buttonIcon: IconPaths.rightBrownIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /*return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: 2.h),
      backgroundColor: ColorPath.bottomNavBgColor,
      content: SizedBox(
        width: 100.h,
        child: Padding(padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                key: const Key('close_alert'),
                onTap: () => getIt<AppRouter>().pop(),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    padding: EdgeInsets.all(1.h),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorPath.primaryColor,
                    ),
                    child: SvgPicture.asset(IconPaths.removeCircleIcon),
                  ),
                ),
              ),
              VerticalSpace(height: 5.h),
              CustomText(
                //text: "${widget.model!.fn} ${widget.model!.ln}",
                text: "helllllllo",
                fontSize: 18.sp,
                underline: false,
                fontFamily: addingTonFont,
                fontWeight: FontWeight.w400,
                color: ColorPath.primaryColor,
                maxLine: 3,
              ),
              VerticalSpace(height: 1.h),
              CustomText(
                align: TextAlign.center,
                //text: "${widget.model!.sid}",
                text:"hiiiiiii",
                fontSize: 11.sp,
                underline: false,
                fontFamily: interFont,
                fontWeight: FontWeight.w300,
                color: ColorPath.primaryColor,
                maxLine: 3,
              ),
              VerticalSpace(height: 5.h),
              SizedBox(
                width: double.infinity,
                child: ButtonIconDialog(
                  onTap: () async {
                    GetIt.I<LoginBloc>().add(const LogoutEventData());
                    getIt<AppRouter>().pop();
                  },
                  buttonName: signOut,
                  buttonIcon: IconPaths.rightBrownIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
