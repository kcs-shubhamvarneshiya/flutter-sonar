import 'package:akdmvisitorsapp/common_widgets/custom_appbar.dart';
import 'package:akdmvisitorsapp/presentaion/home/visit_plan_list.dart';
import 'package:akdmvisitorsapp/presentaion/visit/accommodations.dart';
import 'package:akdmvisitorsapp/presentaion/visit/book_tour.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_text.dart';
import '../../model/app_json/app_json.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';
import '../bloc/visit_bloc/visit_bloc.dart';
import '../bloc/visit_bloc/visit_event.dart';
import 'attraction_screen.dart';
import 'get_akshardham.dart';
import 'guidlines.dart';
import 'request_group_tour.dart';

// Visit Screen
@RoutePage()
class VisitScreen extends StatelessWidget {
  VisitScreen({Key? key,this.scrollIndexValue}) : super(key: key);
  bool? scrollIndexValue;
  AppJsonModel? model;
  Widget? loadWidget;
  AutoScrollController? controller;
  List<Widget>widgetList = [];
  int? index =0;
  @override
  Widget build(BuildContext context) {
    context.read<VisitBloc>().add(const VisitEvent.loadVisitEvent());
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ColorPath.homeBgColor,
        appBar: CustomAppBar(isNotification: true),
        body:BlocBuilder<AppJsonBloc, AppJsonState>(
            bloc: GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
            builder: (context, state) {
              state.when(
                loading: () {
                  loadWidget = const Center(child: SizedBox());
                },
                loaded: (appJsonData) {
                  model = appJsonData;
                  widgetList.clear();
                  widgetList.add(PlanMyVisitList());
                  widgetList.add( model!.attractions != null
                      ? AttractionsScreen(
                      attractionList:
                      model!.attractions)
                      : Container(),);
                  widgetList.add(model!.guidelines != null
                      ? GuidLinesScreen(
                      guideline:
                      model!.guidelines)
                      : Container());
                  widgetList.add(const BookTour());
                  widgetList.add(const RequestGroupTour());
                  widgetList.add(model!.campus != null
                      ? GetAkshardham(
                      campus: model!.campus,
                      lookups: model!.lookups)
                      : Container());
                  widgetList.add(model!.accommodations != null
                      ? Accommodation(
                      accommodation:
                      model!.accommodations)
                      : Container());

                    print("indexxx ${(widgetList.elementAt(6))}");
                    print("indexxx ${(widgetList.length)}");

                  if (scrollIndexValue != null &&
                      scrollIndexValue == true) {
                    _scrollToIndex();
                  }
                  loadWidget =  SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          controller: controller,
                          children: <Widget>[
                            ...List.generate(widgetList.length, (index) {
                              return AutoScrollTag(
                                  key: ValueKey(index),
                                  controller: controller!,
                                  index: index,
                                  highlightColor:
                                  Colors.black.withOpacity(0.1),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      widgetList[index]
                                    ],
                                  ));

                            }),
                            //VerticalSpace(height: 10.h)
                          ],
                        ),
                      )
                  );
                },
                error: (error) {
                  loadWidget = CustomText(
                    text: error,
                    fontSize: 13.sp,
                    underline: false,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.primaryColor,
                  );
                },
              );
              return loadWidget!;
            })
    );
  }
  Future _scrollToIndex() async {
    await controller!.scrollToIndex(5, preferPosition: AutoScrollPosition.middle);
    scrollIndexValue =null;
  }
}
