// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/swiper_widget.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/announcements/announcements.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/enums.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../utils/iconpath.dart';
import '../bloc/announcement/announcement_bloc.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

//AnnouncementsWidget section
class AnnouncementsWidget extends StatelessWidget {
  AnnouncementsWidget({Key? key, this.announcements}) : super(key: key);
  Widget? announcementWidget;
  List<Announcements>? announcements;

  @override
  Widget build(BuildContext context) {
    var filteredAnnouncementList = announcements!.where((element) {
      var endTime = DateTime.parse(element.endTime.toString());
      return endTime.isAfter(DateTime.now());
    }).toList();
    return Container(
        transform: Matrix4.translationValues(0.0, 00, 0.0),
        decoration: BoxDecoration(
          color: ColorPath.secondaryBrownColor.withOpacity(0.1),
          border: const Border.symmetric(
            horizontal: BorderSide(color: ColorPath.secondaryBrownColor),
          ),
        ),
        child: BlocBuilder<AnnouncementsBloc, int>(
            bloc: GetIt.I<AnnouncementsBloc>()..startDisplayingData(),
            builder: (context, currentIndex) {
              return AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: AnimatedOpacity(
                    key: ValueKey<int>(currentIndex),
                    opacity: 1.0,
                    duration: const Duration(seconds: 1),
                    onEnd: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        context.read<AnnouncementsBloc>().startDisplayingData();
                      });
                    },
                    child: filteredAnnouncementList.isNotEmpty
                        ? Column(
                            children: [
                              const VerticalSpace(height: 1.0),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 2.h),
                                height: Platform.isIOS ? 6.h : 7.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      horizontalTitleGap: 0,
                                      leading: getIcon(filteredAnnouncementList[currentIndex % filteredAnnouncementList.length].priority.toString()),
                                      visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                                      contentPadding: EdgeInsets.zero,
                                      title: CustomText(
                                        text: filteredAnnouncementList[currentIndex % filteredAnnouncementList.length].message,
                                        fontSize: 12.sp,
                                        underline: false,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: interFont,
                                        fontWeight: FontWeight.w400,
                                        color: ColorPath.primaryColor,
                                        maxLine: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container()),
              );
            }));
  }

  getIcon(String type) {
    if (type == priorityType.INFO.name) {
      return SvgPicture.asset(IconPaths.announcementIcon);
    } else if (type == priorityType.WARNING.name) {
      return const Icon(Icons.warning_rounded,
          color: ColorPath.primaryButtonColor);
    } else if (type == priorityType.ERROR.name) {
      return const Icon(Icons.clear, color: ColorPath.primaryButtonColor);
    } else if (type == priorityType.SUCCESS.name) {
      return const Icon(Icons.check_circle,
          color: ColorPath.primaryButtonColor);
    }
  }
}
