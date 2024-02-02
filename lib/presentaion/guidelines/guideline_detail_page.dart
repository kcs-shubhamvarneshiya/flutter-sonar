import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/gallery/gallery.dart';
import 'package:akdmvisitorsapp/presentaion/guidelines/video_dialog_screen.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_headset_detector/flutter_headset_detector.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pod_player/pod_player.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/ImageSliders/common_image_slider.dart';
import '../../common_widgets/custom_dialog.dart';
import '../../common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../model/guidelines/content.dart';
import '../../router_page/app_router.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import '../bloc/bluetooth_headset/bluetooth_headset_events.dart';
import '../bloc/bluetooth_headset/bluetooth_headset_state.dart';

class GuideLineDetailPage extends StatelessWidget {
  GuideLineDetailPage({super.key, this.content});

  Content? content;
  PageController? pageController;
  Media? media;
  PodPlayerController? podController;
  Map<HeadsetType, HeadsetState> headsetState = {};
  final headsetDetector = HeadsetDetector();
  String? vedioUrl = "";

  void headsetChangeState(BuildContext context) {
    headsetDetector.setListener((val) {
      BlocProvider.of<BluetoothHeadsetBloc>(context)
          .add(LoadBluetoothChangeEvents(val));
    });
  }

  String? getYoutubeThumbnail(String videoUrl) {
    final Uri? uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return null;
    }
    if (uri.queryParameters['v'] == null) {
      return "";
    } else {
      return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    headsetChangeState(context);
    pageController = PageController(initialPage: 0);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    if (content!.videoUrl != null) {
      vedioUrl = getYoutubeThumbnail(content!.videoUrl.toString());
    }
    return BlocBuilder<BluetoothHeadsetBloc, BluetoothHeadsetListStates>(
        builder: (context, state) {
      state.when(
        bluetoothHeadsetStateLoading: () =>
            const Center(child: CircularProgressIndicator()),
        bluetoothHeadsetConnected: (stateType) {
          print('Connect - $stateType');
          headsetState = stateType;
        },
        bluetoothHeadsetDisConnected: (stateType) {
          print('Disconnect - $stateType');
          headsetState = stateType;
          //bluetoothWidget = setupPlayButton(context, stateType, url, isVimeo /*galleryList*/);
        },
        bluetoothHeadsetErrorState: (error) {},
      );
      return Padding(
        padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            content!.text == null
                ? Container()
                : CustomText(
                    text: content!.text.toString(),
                    fontSize: 14,
                    underline: false,
                    fontFamily: interFont,
                    fontWeight: FontWeight.w400,
                    color: ColorPath.whiteColor.withOpacity(0.7),
                  ),
               content!.imageURL != null
                ? (content!.imageURL!.length == 1)
                    ? Padding(
                        padding: EdgeInsets.only(left: 1.h, right: 1.h),
                        child: SizedBox(
                          height: 19.h,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: FancyShimmerCachedImage(
                              imageUrl: content!.imageURL![0].toString() ?? "",
                              boxFit: BoxFit.fitWidth,
                              errorWidget:
                                  Image.asset(IconPaths.placeholderImage),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                      )
                    : CommonImageSlider(
                        controller: pageController,
                        attractionItem: content!.imageURL, isGuideLine: true,)
                : Container(),
            content!.videoUrl != null
                ?  ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                            onTap: () async {
                              videoPlayerRedirection(context, headsetState,
                                  content!.videoUrl.toString(), false);
                              },
                            child: Stack(
                              children: [
                                SizedBox(
                                    height: 22.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: vedioUrl!.isNotEmpty
                                        ? Image.network(vedioUrl.toString(),
                                            fit: BoxFit.cover)
                                        : Image.asset(
                                            IconPaths.placeholderImage,fit: BoxFit.cover)),
                                Positioned(
                                    child: Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: vedioUrl!.isNotEmpty
                                        ? SvgPicture.asset(IconPaths.playIcon,
                                            fit: BoxFit.cover)
                                        : Container(),
                                  ),
                                )),
                              ],
                            )) /* */)
                : Container(),
            VerticalSpace(height: 1.5.h)
          ],
        ),
      );
    });
  }

  void videoPlayerRedirection(
      BuildContext context,
      Map<HeadsetType, HeadsetState> headsetState,
      String url,
      bool isVimeoVideo) {
      //Below code display dialog and play video.
      showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 3.5.h),
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,// Set background to transparent
        content: AspectRatio(
          aspectRatio: 16 / 10, // Adjust the aspect ratio as needed
          child:VideoDialogScreen(
            videoUrl: url,
            isVimeo: isVimeoVideo,
          ),
        ),
      ),
    );
      //Below code is used for display video in dialog with bluetooth and headset connectivity.
    /*if (_mapStateToText(headsetState.values.elementAt(0)) == 'Connected' || _mapStateToText(headsetState.values.elementAt(1)) == 'Connected') {
      //getIt<AppRouter>().push(PlayVideoScreenRoute(videoUrl: url, isVimeo: isVimeoVideo));
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            elevation: 0,
            insetPadding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 3.5.h),
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,// Set background to transparent
            content: AspectRatio(
              aspectRatio: 16 / 10, // Adjust the aspect ratio as needed
              child:VideoDialogScreen(
                videoUrl: url,
                isVimeo: isVimeoVideo,
              ),
            ),
          ),
        );
    } else {
      showDialog(
        context: context,
        builder: (context) => CustomDialog(
          isVideoPlay: true,
          title: warning,
          description: connectDevice,
          onTap: () {
            getIt<AppRouter>().pop();
          },
          onTapNo: () {
            getIt<AppRouter>().pop();
          },
        ),
      );
    }*/
  }

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
