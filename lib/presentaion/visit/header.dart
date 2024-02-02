// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_dialog.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/gallery/gallery.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_headset_detector/flutter_headset_detector.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/custom_text.dart';
import '../../common_widgets/fancyShimmerCachedImage.dart';
import '../../common_widgets/swiper_widget.dart';
import '../../router_page/app_router.dart';
import '../../utils/enums.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';
import '../bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import '../bloc/bluetooth_headset/bluetooth_headset_events.dart';
import '../bloc/bluetooth_headset/bluetooth_headset_state.dart';


class VisitHeader extends StatelessWidget {
   VisitHeader({Key? key}) : super(key: key);

  Widget? headerWidget;

  final headsetDetector = HeadsetDetector();

  //call headset listener on change event of wired and wireless device.
  void headsetChangeState(BuildContext context) {
    headsetDetector.setListener((val) {
      BlocProvider.of<BluetoothHeadsetBloc>(context).add(LoadBluetoothChangeEvents(val));
    });
  }

  @override
  Widget build(BuildContext context) {
    headsetChangeState(context);
    return BlocBuilder<AppJsonBloc, AppJsonState>(
      bloc: GetIt.I<AppJsonBloc>()..add(const LoadAppJsonEvent()),
      builder: (context, state) {
        state.when(
          loading: () => headerWidget = Center(
              child: SizedBox(
                height: 5.h,
              )),
          loaded: (appJsonData) {
            var index = appJsonData.galleries?.indexWhere((element) => element.title == GalleryModuleType.Visit.name);
            var visitSliderIndex = (index != null) ? index : -1;

            headerWidget = (appJsonData.galleries != null && visitSliderIndex >= 0) ? Stack(
              children: [
                //image slider
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: SwiperWidget(
                    isIndexPagination: false,
                    itemLength: appJsonData.galleries![visitSliderIndex].media!.length,
                    activeColor: ColorPath.primaryColor,
                    inActiveColor: ColorPath.secondaryTextColor,
                    itemBuilder: (context, index) {
                      var isVimeoVideo = appJsonData.galleries![visitSliderIndex].media![index].type ==
                          GalleryType.VIMEO.name;
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(4.h)),
                              child:FancyShimmerCachedImage(
                                imageUrl: appJsonData
                                    .galleries![visitSliderIndex].media![index].thumbnail
                                    .toString() ?? "",
                                boxFit:BoxFit.fill,
                                errorWidget: Image.asset(IconPaths.placeholderImage),
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ),
                          appJsonData.galleries![visitSliderIndex].media![index].type !=
                              GalleryType.IMAGE.name
                              ? BluetoothConnectionStatus().bluetoothHeadset(
                            context,
                            appJsonData.galleries![visitSliderIndex].media![index].src.toString(),
                            isVimeoVideo,
                            appJsonData.galleries![visitSliderIndex].media![index],
                          )
                              : const SizedBox(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ) : Container(height: 12.h,);
          },
          error: (error) => headerWidget = CustomText(
            text: error,
            fontSize: 13.sp,
            underline: false,
            fontWeight: FontWeight.w500,
            color: ColorPath.primaryColor,
          ),
        );
        return headerWidget!;
      },
    );
  }
}

class BluetoothConnectionStatus {
  Widget? bluetoothWidget;

  BlocProvider<BluetoothHeadsetBloc> bluetoothHeadset(
      BuildContext context, String url, bool isVimeo, Media galleryList) {
    return BlocProvider(
      create: (context) => GetIt.I<BluetoothHeadsetBloc>()..add(const LoadBluetoothHeadsetEvents()),
      child:
      SizedBox(
        child: BlocBuilder<BluetoothHeadsetBloc, BluetoothHeadsetListStates>(
            builder: (context, state) {
              state.when(
                bluetoothHeadsetStateLoading: () => bluetoothWidget = const Center(child: CircularProgressIndicator()),
                bluetoothHeadsetConnected: (stateType) {
                  print('Connect - $stateType');
                  bluetoothWidget = setupPlayButton(context, stateType, url, isVimeo, galleryList);
                },
                bluetoothHeadsetDisConnected: (stateType){
                  print('Disconnect - $stateType');
                  bluetoothWidget = setupPlayButton(context, stateType, url, isVimeo, galleryList);
                },
                bluetoothHeadsetErrorState: (error) {
                  bluetoothWidget = Center(
                    child: CustomText(
                      text: 'Error:$error',
                      fontSize: 15.0,
                      underline: false,
                      fontWeight: FontWeight.normal,
                      color: ColorPath.primaryColor,
                    ),
                  );
                },
              );
              return bluetoothWidget!;
            }),
      ),
    );
  }

  Widget setupPlayButton(BuildContext context,Map<HeadsetType, HeadsetState> headsetState, String url, bool isVimeoVideo, Media media){
    return GestureDetector(
      onTap: () {
        videoPlayerRedirection(context, headsetState, url, isVimeoVideo);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: SizedBox(
          height: 10.h,
          child: SvgPicture.asset(IconPaths.playIcon, fit: BoxFit.cover),
        ),
      ),
    );
  }

  void videoPlayerRedirection(BuildContext context,Map<HeadsetType, HeadsetState> headsetState, String url, bool isVimeoVideo) {
    if(_mapStateToText(headsetState.values.elementAt(0)) =='Connected' || _mapStateToText(headsetState.values.elementAt(1)) =='Connected') {
      getIt<AppRouter>().push(PlayVideoScreenRoute(
          videoUrl: url,
          isVimeo: isVimeoVideo) //galleryList
      );
    }else{
      showDialog(
        context: context,
        builder: (context) =>
            CustomDialog(
              isVideoPlay: true,
              title: warning,
              description:
              connectDevice,
              onTap: () {
                getIt<AppRouter>().pop();
              },
              onTapNo: () {
                getIt<AppRouter>().pop();
              },
            ),
      );
    }
  }

  //string which provide the current headset state value.
  String _mapStateToText(HeadsetState? state) {
    switch (state) {
      case HeadsetState.CONNECTED:
        return 'Connected';
      case HeadsetState.DISCONNECTED:
        return 'Disconnected';
      default:
        return 'Unknown';
    }
  }
}
