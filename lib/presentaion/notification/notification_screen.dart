import 'package:akdmvisitorsapp/common_widgets/notification_container.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_event.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/custom_dialog.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custome_page.dart';
import '../../common_widgets/widgets.dart';
import '../../model/notification/notification.dart';
import '../../router_page/app_router.dart';
import '../../utils/colors.dart';
import '../../utils/iconpath.dart';
import '../../utils/strings.dart';
import '../bloc/attraction_filter_bloc/attraction_change_event.dart';
import '../bloc/attraction_filter_bloc/attraction_filter_bloc.dart';
import '../bloc/notification_bloc/notification_state.dart';
import '../indoorMap/logic/MapMarkerProvider.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with WidgetsBindingObserver {
  List<NotificationLog> selectedList = [];
  SharedPreferences? sharedPreferences;
  bool isLongPressSelected = false;
  MapMarkerProvider? mapProviderRead;

  @override
  initState() {
    super.initState();
    mapProviderRead = context.read<MapMarkerProvider>();
    context.read<NotificationBloc>().add(const NotificationEvent.loadNotificationEvent(false));
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      context.read<NotificationBloc>().add(NotificationEvent.loadNotificationEvent(isLongPressSelected));
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    Widget? notificationWidget;
    return WillPopScope(
        onWillPop: () async {
          mapProviderRead!.isSelectAttractionUpdate =false;
          mapProviderRead!.selectMapFilter(null);
          context.read<AttractionFilterBloc>().add(AttractionChangeEvent.tap(false,0,'',mapProviderRead!.isVisibleList!));//allText
          return true;
        },

      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar:notificationAppBar(),
          backgroundColor: ColorPath.bottomNavBgColor,
          body:BlocBuilder<NotificationBloc, NotificationState>(
               builder: (context, state){
                       isLongPressSelected=state.isLongPress;
                       return SingleChildScrollView(
                         padding:EdgeInsets.symmetric(horizontal: 1.h),
                         child: Column(
                           children: [
                             //VerticalSpace(height: 3.h),
                             VerticalSpace(height: 15.h),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 IconButton(icon: const Icon(Icons.arrow_back_ios_new),onPressed: (){
                                   getIt<AppRouter>().pop();
                                 },),

                                 Expanded(
                                   child: CustomText(
                                     text: notificationTitle,
                                     fontSize: 22.sp,
                                     underline: false,
                                     fontFamily: addingTonFont,
                                     fontWeight: FontWeight.w500,
                                     color: ColorPath.primaryColor,
                                     maxLine: 1,
                                     align: TextAlign.center,
                                   ),
                                 ),
                                 SizedBox(width: 5.h,)
                               ],
                             ),
                             VerticalSpace(height: 4.h),
                             Container(
                               padding: EdgeInsets.symmetric(horizontal: 1.h),
                               child: state.notificationList.isNotEmpty
                                   ? ListView.separated(
                                   scrollDirection: Axis.vertical,
                                   shrinkWrap: true,
                                   padding: EdgeInsets.zero,
                                   physics: const ScrollPhysics(),
                                   itemCount: state.notificationList.length,
                                   separatorBuilder: (context, index) =>
                                       VerticalSpace(height: 2.h),
                                   itemBuilder: (context, index) {
                                     return Dismissible(
                                       key: UniqueKey(),
                                       background: Container(
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10),
                                             color: ColorPath.dismissBackground),
                                         child: Container(
                                             alignment: Alignment.centerRight,
                                             padding: EdgeInsets.all(2.h),
                                             child: SvgPicture.asset(
                                               IconPaths.swipeDeleteNotificationIcon,
                                               height: 4.h,
                                               width: 4.h,
                                             )),
                                       ),
                                       direction: DismissDirection.endToStart,
                                       confirmDismiss: (direction) async {
                                         return !isLongPressSelected;
                                       },
                                       onDismissed: (direction) {
                                         showDialog(
                                           context: context,
                                           builder: (context) => CustomDialog(
                                             title: "",
                                             description: deleteNotificationMessage,
                                             onTap: () {
                                               getIt<AppRouter>().pop();
                                               context.read<NotificationBloc>().add(NotificationEvent.removeNotificationItemEvent(state.notificationList[index].id.toString()));
                                             },
                                             onTapNo:(){
                                               getIt<AppRouter>().pop();
                                               context.read<NotificationBloc>().add(const NotificationEvent.loadNotificationEvent(false));
                                             },
                                             isNotification: true,
                                           ),
                                         ).then((value){
                                           context.read<NotificationBloc>().add(const NotificationEvent.loadNotificationEvent(false));
                                         });
                                       },
                                       child: GestureDetector(
                                         onTap: () {
                                           if (!isLongPressSelected){
                                             setAnalyticData(nameNotificationDetail,<String, String>{});
                                             getIt<AppRouter>().push(NotificationDetailRoute(notificationData: state.notificationList[index]),)
                                                 .then((value) async {
                                               //bloc added to update list.
                                               context.read<NotificationBloc>().add(const NotificationEvent.loadNotificationEvent(false));
                                             });
                                           } else {
                                             //Select Unselect code
                                             context.read<NotificationBloc>().add(NotificationEvent.selectedNotificationEvent(state.notificationList,true,index));
                                           }
                                         },
                                         onLongPress: () {
                                           context.read<NotificationBloc>().add(NotificationEvent.selectedNotificationEvent(state.notificationList,true,index));
                                         },
                                         child: NotificationContainer(
                                             notificationLst: state.notificationList[index],
                                             isLongPressSelected: isLongPressSelected),
                                       ),
                                     );
                                   }):Padding(
                                 padding: EdgeInsets.only(top: 5.h),
                                 child: CustomPage(
                                   imageName: IconPaths.noNotificationIcon,
                                   description: noNotificationMessage,
                                   onTap: () {},
                                   isNotification: true,
                                 ),
                               ),
                             ),
                             VerticalSpace(height: 1.h),
                           ],
                         ),
                       );

               }
           ),


      ),
    );
  }

  PreferredSize notificationAppBar() =>
      PreferredSize(
        preferredSize: Size.fromHeight(8.5.h),
        child:BlocBuilder<NotificationBloc, NotificationState>(
        builder:(context, state){
          var selectedLst = state.notificationList.where((e) => e.isSelected==true).toList();
          if(state.isLongPress){
          return AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor:ColorPath.containerBorderColor.withOpacity(.95),
          title: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 35),
            height: 13.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<NotificationBloc>().add(const NotificationEvent.loadNotificationEvent(false));
                  },
                  child: SvgPicture.asset(IconPaths.closeNotificationIcon),
                ),
                CustomText(
                  text: '${selectedLst.length} $selectMessage',
                  fontSize: 18.sp,
                  underline: false,
                  fontFamily: addingTonFont,
                  fontWeight: FontWeight.w500,
                  color: ColorPath.blackColor,
                  maxLine: 1,
                  align: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        title: "",
                        description: deleteNotificationMessage,
                        onTap: () {
                          getIt<AppRouter>().pop();
                          context.read<NotificationBloc>().add(NotificationEvent.removeSelectedNotificationEvent(selectedLst));
                        },
                        onTapNo: () {
                          getIt<AppRouter>().pop();
                          context.read<NotificationBloc>().add(const NotificationEvent.loadNotificationEvent(false));
                        },
                        isNotification: true,
                      ),
                    ).then((value){
                      context.read<NotificationBloc>().add(const NotificationEvent.loadNotificationEvent(false));
                    });
                  },
                  child: SvgPicture.asset(IconPaths.deleteNotificationIcon),
                ),
              ],
            ),
          ),
        );
      }else{
        return CustomAppBar(isNotification: false);
      }
    }
  ),
      );
}
