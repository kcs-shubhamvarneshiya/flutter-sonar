// ignore_for_file: must_be_immutable
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_headset_detector/flutter_headset_detector.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pod_player/pod_player.dart';
import '../../common_widgets/custom_dialog.dart';
import '../../router_page/app_router.dart';
import '../bloc/bluetooth_headset/bluetooth_headset_state.dart';

class VideoDialogScreen extends StatefulWidget {
  VideoDialogScreen({
    Key? key,
    required this.videoUrl,
    required this.isVimeo,
  }) : super(key: key);
  String? videoUrl;
  bool? isVimeo;

  @override
  State<VideoDialogScreen> createState() => _VideoDialogScreenState();
}

class _VideoDialogScreenState extends State<VideoDialogScreen> {
  late final PodPlayerController controller;
  final networkPlayer = AudioPlayer();
  Widget? playSongWidget;
  final headsetDetector = HeadsetDetector();
  var bluetoothBloc = BluetoothHeadsetBloc();

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: widget.isVimeo!
          ? PlayVideoFrom.vimeo(widget.videoUrl!)
          : PlayVideoFrom.youtube(widget.videoUrl!),
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
    return Scaffold(
      backgroundColor:Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch content horizontally
        children: [
          PodVideoPlayer(controller: controller)
          //Below code is used for display video in dialog with bluetooth and headset connectivity.
          /*Expanded( // Expand to take up available space
            child: BlocBuilder<BluetoothHeadsetBloc, BluetoothHeadsetListStates>(
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
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
