import 'dart:async';

import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/map_routing_provider.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/custom_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/strings.dart';

class NavigationBottomSheet extends StatefulWidget {
  final Attraction entity;
  final VoidCallback endNavigationCallback;
  final Stream<Position> positionStream;
  final Function onPathChanged;
  final double? estimatedDistance;
  final double? estimatedTime;

  //final ThemeLangSizeProvider? themeProvider;

  const NavigationBottomSheet({
    Key? key,
    required this.entity,
    required this.endNavigationCallback,
    required this.positionStream,
    required this.onPathChanged,
    this.estimatedDistance,
    this.estimatedTime,
    //this.themeProvider,
  }) : super(key: key);

  @override
  State<NavigationBottomSheet> createState() => _NavigationBottomSheetState();
}

class _NavigationBottomSheetState extends State<NavigationBottomSheet> {
  Position? _currentLocation;
  double? distanceRemaining;
  double? timeRemaining;

  Timer? timer;

  StreamSubscription<Position>? posStreamSub;

  bool get showSubtitle => distanceRemaining != null && timeRemaining != null;

  @override
  void initState() {
    posStreamSub = widget.positionStream.listen((data) {
      _currentLocation = data;
      setState(() {});
    });
    distanceRemaining = widget.estimatedDistance;
    timeRemaining = widget.estimatedTime;
    // reRoute();
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      timer = Timer.periodic(Duration(seconds: 5), (timer) {
        if (mounted) {
          reRoute();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.center,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 5),
              height: 4,
              width: 35,
              /*decoration: BoxDecoration(
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                borderRadius: BorderRadius.circular(16),
              ),*/
            ),
          ),
        ),
        ListTile(
          //leading:Image(image:getImage('assets/map_icons/${widget.entity.locationMarker}.png'),),
          leading: (widget.entity.mapIcon != null)
              ? FancyShimmerCachedImage(
                  imageUrl: widget.entity.mapIcon ?? "",
                  boxFit: BoxFit.contain,
                  errorWidget: Image.asset(IconPaths.akshardhamMarkerIcon),
                )
              : Image.asset(IconPaths.akshardhamMarkerIcon),
          title: Text(widget.entity.title!),
          subtitle: showSubtitle
              ? Text(
                  //'${distanceRemaining?.round()} m · ${timeRemaining?.round()} ${widget.themeProvider!.localization.labelMins}')
                  '${((distanceRemaining ?? 0) * 3.28084).round()} ft · ${timeRemaining?.round()} Min')
              : const Text('...'),
          trailing: ElevatedButton(
            onPressed: widget.endNavigationCallback,
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorPath.bottomSelectedItemColor),
            child: CustomText(
              text: 'End',
              fontSize: 10.sp,
              underline: false,
              fontFamily: interFont,
              fontWeight: FontWeight.w400,
              color: ColorPath.whiteColor,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  void dispose() {
    posStreamSub?.cancel();
    timer?.cancel();
    super.dispose();
  }

  void reRoute() {
    var mapRouting = context.read<MapRoutingProvider>();

    if (_currentLocation != null) {
      var source =
          LatLng(_currentLocation!.latitude, _currentLocation!.longitude);
      var dest = LatLng(double.parse(widget.entity.latitude ?? "0"),
          double.parse(widget.entity.longitude ?? "0"));
      var path = mapRouting.getShortestPath(source, dest);

      if (path != null) {
        widget.onPathChanged(path);
        distanceRemaining = MapRoutingProvider.getDistanceFromResult(path);
        timeRemaining =
            MapRoutingProvider.getTimeFromLength(distanceRemaining!);
        // TODO: This is dangerous and should be removed.
        setState(() {});
      }
    }
  }
}
