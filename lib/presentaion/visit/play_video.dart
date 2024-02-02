// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_header.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/gallery/gallery.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_headset_detector/flutter_headset_detector.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pod_player/pod_player.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/custom_dialog.dart';
import '../../router_page/app_router.dart';
import '../bloc/bluetooth_headset/bluetooth_headset_events.dart';
import '../bloc/bluetooth_headset/bluetooth_headset_state.dart';
@RoutePage()
class PlayVideoScreen extends StatefulWidget {
  PlayVideoScreen({
    Key? key,
    required this.videoUrl,
    required this.isVimeo,
    //required this.galleryList,
    //required this.stateType,
  }) : super(key: key);
  String? videoUrl;
 // Media? galleryList;

  bool? isVimeo;

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  late final PodPlayerController controller;
  final networkPlayer = AudioPlayer();
  Widget? playSongWidget;
  //final headsetDetector = HeadsetDetector();
  var bluetoothBloc = BluetoothHeadsetBloc();

  @override
  void initState() {
    // print('In Video Screen - ${widget.stateType}');
    controller = PodPlayerController(
      playVideoFrom: widget.isVimeo!
          ? PlayVideoFrom.vimeo(widget.videoUrl!)
          : PlayVideoFrom.youtube(widget.videoUrl!),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: true,
            isLooping: false,
          videoQualityPriority:[1080, 720, 360, 144],
        )
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget? bluetoothWidget;

  @override
  Widget build(BuildContext context) {
    // print('Inside Video Screen - ${widget.stateType}');
    return Scaffold(
      appBar: CustomHeader(
          title:'Title',
        /*
                  '${*/
        /*widget.galleryList!.name*//*
        } (${context.capitalizeOnlyFirstLater(widget.galleryList!.type.toString())})',
        */
        redirectToHome: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*BlocProvider(
                  create: (context) => GetIt.I<BluetoothHeadsetBloc>()..add(const LoadBluetoothHeadsetEvents()),
                  child:*/ BlocBuilder<BluetoothHeadsetBloc, BluetoothHeadsetListStates>(
                      builder: (context, state) {
                      state.when(
                        bluetoothHeadsetStateLoading: () => bluetoothWidget = const Center(child: CircularProgressIndicator()),
                        bluetoothHeadsetConnected: (headsetState) {
                          print('Connect - $headsetState');
                          return bluetoothWidget = PodVideoPlayer(controller: controller);
                        },
                        bluetoothHeadsetDisConnected: (headsetState) {
                          print('Disconnect 110- $headsetState');
                          controller.pause();
                          return bluetoothWidget = CustomDialog(
                            isVideoPlay: true,
                            title: warning,
                            description: connectDevice,
                            onTap: () {
                              //getIt<AppRouter>().pop();
                             getIt<AppRouter>().push(VisitScreenRoute());
                            },
                            onTapNo: (){
                              getIt<AppRouter>().pop();
                            },
                          );
                        },
                        bluetoothHeadsetErrorState: (error) {
                         return bluetoothWidget = Center(
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
               // ),
                //PodVideoPlayer(controller: controller),
                Column(
                  children: [
                    Container(
                      color: ColorPath.buttonOutlineColor.withOpacity(0.4),
                      padding: EdgeInsets.all(1.h),
                      child: ListTile(
                        title: CustomText(
                          text: captionText,
                          fontSize: 18.sp,
                          underline: false,
                          fontWeight: FontWeight.w400,
                          fontFamily: addingTonFont,
                          color: ColorPath.primaryColor,
                          maxLine: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    /*    subtitle: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: CustomText(
                            text: widget.galleryList!.captions,
                            fontSize: 12.sp,
                            underline: false,
                            fontWeight: FontWeight.w300,
                            fontFamily: interFont,
                            color: ColorPath.primaryColor,
                            maxLine: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),*/
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
