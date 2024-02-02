import 'package:akdmvisitorsapp/common_widgets/activity_container.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/no_attraction.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_state.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../router_page/app_router.dart';
import '../../utils/iconpath.dart';
import '../bloc/visit_bloc/visit_bloc.dart';
import '../bloc/visit_bloc/visit_event.dart';

@RoutePage()
class AddActivity extends StatelessWidget {
  AddActivity({Key? key}) : super(key: key);
  Widget? addActivityWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetIt.I<VisitBloc>()
          ..add(const VisitEvent.loadVisitActivityEvent()),
        child: BlocBuilder<VisitBloc, VisitState>(
          builder: (context, state) {
            addActivityWidget = Container(
              color: ColorPath.homeBgColor,
              child: Column(
                children: [
                  VerticalSpace(height: 1.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: activityMainTitle,
                          fontSize: 23.sp,
                          underline: false,
                          fontFamily: addingTonFont,
                          fontWeight: FontWeight.w300,
                          color: ColorPath.primaryColor,
                          maxLine: 3,
                        ),
                        InkWell(
                          onTap: () {
                            getIt<AppRouter>().pop();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(1.h),
                            margin: EdgeInsets.symmetric(
                              vertical: 1.h,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorPath.primaryColor,
                            ),
                            child: SvgPicture.asset(IconPaths.removeCircleIcon),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(height: 3.h),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: (state.mainAttractionList != null &&
                              state.mainAttractionList.isNotEmpty)
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h),
                              child: ActivityList(
                                itemBuilder: (context, index) {
                                  return ActivityContainer(
                                    title: state.attractionAddList[index].title
                                        .toString(),
                                    imageName: state
                                        .attractionAddList[index].thumbnail
                                        .toString(),
                                    time: state.attractionAddList[index]
                                                .averageVisitLengthInMinutes !=
                                            null
                                        ? state.attractionAddList[index]
                                            .averageVisitLengthInMinutes!
                                        : 0,
                                    desc: state
                                        .attractionAddList[index].description
                                        .toString(),
                                    btnIcon: IconPaths.rightIcon,
                                    btnName: addPlan,
                                    attraction: state.attractionAddList[index],
                                    isActivityAdded: (state.attractionList
                                            .map((item) => item.id)
                                            .contains(state
                                                .attractionAddList[index].id))
                                        ? false
                                        : true,
                                    onTap: () {
                                      Map<String, dynamic> loginParameter = {
                                        'type': state
                                            .attractionAddList[index].id
                                            .toString(),
                                        'name': state
                                            .attractionAddList[index].title
                                            .toString(),
                                      };
                                      setAnalyticData(
                                          nameAddPlan, loginParameter);
                                      context.read<VisitBloc>().add(
                                          VisitEvent.addActivityEvent(
                                              state.attractionAddList[index],
                                              true,
                                              context));
                                      /*context.customSnackBar(
                                          context,
                                          "${state.attractionAddList[index].title} $addActivityPlan",
                                          okText);*/
                                          Fluttertoast.cancel();
                                          showToast("${state.attractionAddList[index].title} $addActivityPlan");
                                    },
                                  );
                                },
                                indexItem: state.attractionAddList.length,
                                isScroll: true,
                              ),
                            )
                          : const NoAttractionScreen(),
                    ),
                  ),
                  const VerticalSpace(height: 30),
                ],
              ),
            );
            return addActivityWidget!;
          },
        ),
      ),
    );
  }
}
