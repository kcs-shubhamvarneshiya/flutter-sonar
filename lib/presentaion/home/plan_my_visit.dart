// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/presentaion/home/visit_plan_list.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../model/attraction/attraction.dart';
import '../../router_page/app_router.dart';
import '../../utils/iconpath.dart';
import '../bloc/visit_bloc/visit_bloc.dart';
import '../bloc/visit_bloc/visit_event.dart';
import '../bloc/visit_bloc/visit_state.dart';

class PlanMyVisit extends StatelessWidget {
  PlanMyVisit({Key? key,this.attractionList}) : super(key: key);
  Widget? planMyWidget;
  List<Attraction>? attractionList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: Future.delayed(const Duration(milliseconds: 500), () => true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          } else if (snapshot.hasData && snapshot.data!) {
            return PlanMyVisitList();
          } else {
            return const SizedBox();
          }
        });
  }
}
