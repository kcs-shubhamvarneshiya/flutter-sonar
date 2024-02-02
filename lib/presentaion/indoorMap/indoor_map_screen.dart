import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_filter_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_state.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/attraction_filter.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/detailDialog/navigation_bottom_sheet.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/map_routing_provider.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/utils/preference_utils.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/service/cached_network_tile_provider.dart';
import 'package:akdmvisitorsapp/utils/BottomNavNotifier.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/attraction_common_dialog.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../model/attraction/attraction.dart';
import '../../utils/constants.dart';
import '../../utils/iconpath.dart';
import '../bloc/attraction_filter_bloc/attraction_change_event.dart';
import '../explore/map_attraction_screen.dart';
// IndoorMap Screen

//LatLng imageBoundSW = LatLng(23.09800, 72.48609); //72.48609,23.09800
LatLng imageBoundSE = LatLng(40.26345597188367, -74.59077005157279);
LatLng imageBoundNW = LatLng(40.24456736076913, -74.55906653731233);
LatLng imageBoundSEForOverlay = LatLng(40.26039, -74.58173);
LatLng imageBoundNWForOverlay = LatLng(40.24832, -74.57149);
LatLng akshardhamVenue = LatLng(40.254036, -74.578008);
LatLng initialCameraPosition = akshardhamVenue;

@RoutePage()
class IndoorMapScreen extends StatefulWidget {
  final String? initialObjectId;
  late Attraction? isLocationAttraction;
  final bool? isListVisible;

  IndoorMapScreen(
      {Key? key,
      this.initialObjectId,
      this.isLocationAttraction,
      this.isListVisible})
      : super(key: key);

  @override
  State<IndoorMapScreen> createState() => _IndoorMapScreenState();
}

class _IndoorMapScreenState extends State<IndoorMapScreen>
    with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  late MapMarkerProvider mapProviderRead;
  final lines = <Polyline>[];
  final Key _currentLocationKey = UniqueKey();
  late StreamController<void> _turnHeadingUpStreamController;
  bool _isNavigationMode = false;

  //MapMarkerProvider? mapProviderWatch;
  LatLng? _parkingPinLocation;
  Position? _currentLocation;
  Stream<Position>? _positionStream;
  StreamSubscription<Position>? _positionStreamSubscription;
  bool? isSelectAttractionfromParent = false;
  ValueNotifier<bool> isAttractionList = ValueNotifier(false);
  Set<String?> attractionTypeListString = <String?>{};
  Set<String?> attractionTypeList = <String?>{};
  String? selectedAttractionValue = "";
  List<Attraction>? allAttractionList = [];
  List<Attraction>? attractionFilterList = [];
  int? isFomLocationAttractionId;
  bool isAttractionSelacted = false;

  void getAvailableAttraction(
      List<Attraction>? allAttractionList, Set<String?> attractionTypeList) {
    if (isAttractionSelacted != true && widget.isLocationAttraction != null) {
      if (allAttractionList != null && allAttractionList.isNotEmpty) {
        bool isExisted = attractionTypeList
            .map((item) => item.toString())
            .contains(widget.isLocationAttraction!.attractionType);
        if (isExisted) {
          _focusMarker(
              LatLng(double.parse(widget.isLocationAttraction!.latitude ?? "0"),
                  double.parse(widget.isLocationAttraction!.longitude ?? "0")),
              zoomLevel: 17);
        }
        Attraction? selectedAttraction = allAttractionList?.firstWhere(
            (element) => element.id == widget.isLocationAttraction!.id);
        mapProviderRead.setSelectedLocation(selectedAttraction!);
        _openLocationDetailsBottomSheet(selectedAttraction!);
        isAttractionSelacted = true;
      }
    }
  }

  //Bottom Sheet
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController<void>? bottomSheetController;

  @override
  void initState() {
    super.initState();
    _turnHeadingUpStreamController = StreamController<void>.broadcast();
    setMapLocationFromJson();
    mapProviderRead = context.read<MapMarkerProvider>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await mapProviderRead.readAllLocationsPref(context);
      mapProviderRead.isSelectAttractionUpdate = false;
      mapProviderRead.isVisibleList = false;
      if (widget.isListVisible != null) {
        if (widget.isListVisible!) {
          mapProviderRead.setMapListVisibility(true);
        }
      }
    });

    _initGeoLocator();
    //_getStoredLocationIfAvailable();
    context.read<AttractionFilterBloc>().add(AttractionChangeEvent.tap(
        false, 0, '', mapProviderRead.isVisibleList!)); //allText
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  Attraction? isLocationAttraction;
  Widget? tabBarWidget;

  @override
  Widget build(BuildContext context) {
    //mapProviderWatch = context.watch<MapMarkerProvider>();
    if (mapProviderRead.objectSelectionMode &&
        mapProviderRead.selectedLocation != null) {
      mapProviderRead.selectMapFilter(null);
    }
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(isNotification: true),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Column(
              children: [
                VerticalSpace(height: 12.h),
                BlocConsumer<AttractionFilterBloc, AttractionState>(
                  listener: (context, state) {
                    allAttractionList = state.attractionList;
                    attractionTypeList = state.attractionTypeList;

                    if (isAttractionSelacted != true &&
                        widget.isLocationAttraction != null) {
                      var index = attractionTypeList.toList().indexWhere(
                          (item) =>
                              item ==
                              widget.isLocationAttraction!.attractionType);
                      context.read<AttractionFilterBloc>().add(
                          AttractionChangeEventData(
                              false,
                              index,
                              widget.isLocationAttraction!.attractionType
                                  .toString(),
                              true));
                      Future.delayed(const Duration(seconds: 3)).then(
                        (value) {
                          if (allAttractionList!.isNotEmpty) {
                            getAvailableAttraction(
                                allAttractionList, attractionTypeList);
                          }
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<AttractionFilterBloc, AttractionState>(
                        builder: (context, state) {
                      return Expanded(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                mapProviderRead.isVisibleList == false
                                    ? Expanded(
                                        child: IgnorePointer(
                                          ignoring: mapProviderRead
                                              .isSelectAttractionUpdate!,
                                          child: FlutterMap(
                                            mapController: _mapController,
                                            options: MapOptions(
                                              center: akshardhamVenue,
                                              interactiveFlags: InteractiveFlag
                                                      .doubleTapZoom |
                                                  InteractiveFlag.drag |
                                                  InteractiveFlag.pinchMove |
                                                  InteractiveFlag.pinchZoom,
                                              //InteractiveFlag.rotate,
                                              zoom: 17,
                                              minZoom: 17,
                                              maxZoom: 19,
                                              rotation: 107,
                                              maxBounds: LatLngBounds(
                                                imageBoundSE,
                                                imageBoundNW,
                                              ),
                                              slideOnBoundaries: true,
                                              onTap: (position, latlong) {
                                                if (mapProviderRead
                                                        .objectSelectionMode &&
                                                    mapProviderRead
                                                            .selectedLocation !=
                                                        null) {
                                                  mapProviderRead
                                                      .selectMapFilter(null);
                                                }
                                              },
                                            ),
                                            children: [
                                              TileLayer(
                                                tileProvider:
                                                    AssetTileProvider(),
                                                // backgroundColor: Colors.greenAccent,
                                                maxNativeZoom: 19,
                                                urlTemplate:
                                                    'assets/map/map-bg.png',
                                                errorImage: const AssetImage(
                                                    'assets/map/map-bg.png'),
                                              ),
                                              // OverlayImageLayer(
                                              //   overlayImages: [
                                              //     OverlayImage(
                                              //       bounds: LatLngBounds(
                                              //           imageBoundSEForOverlay,
                                              //           imageBoundNWForOverlay),
                                              //       imageProvider:
                                              //           const AssetImage(
                                              //         'assets/map/map-fg.jpg',
                                              //       ),
                                              //     )
                                              //   ],
                                              // ),
                                              TileLayer(
                                                urlTemplate:
                                                    Constant.indoorMapURL,
                                                tileProvider:
                                                    CachedNetworkTileProvider(),
                                                maxZoom: 19,
                                                minZoom: 17,
                                                keepBuffer: 5,
                                                backgroundColor:
                                                    Colors.transparent,
                                                errorTileCallback:
                                                    (tile, error, stackTrace) {
                                                  getIt<Logger>().d(
                                                      'Error: ${tile}  ${error}');
                                                },
                                              ),

                                              //Loding the url from the network path
                                              /*TileLayer(
                                                  urlTemplate: Constant.indoorMapURL,
                                                    errorImage: const AssetImage(
                                                      'assets/map/map-fg.png',
                                                    ),
                                                  ),*/

                                              //path
                                              PolylineLayer(polylines: lines),
                                              CurrentLocationLayer(
                                                key: _currentLocationKey,
                                                turnHeadingUpLocationStream:
                                                    _turnHeadingUpStreamController
                                                        .stream,
                                                turnAnimationCurve:
                                                    Curves.easeIn,
                                                turnAnimationDuration:
                                                    const Duration(
                                                        milliseconds: 1000),
                                              ),
                                              if (!_isNavigationMode)
                                                MarkerClusterLayerWidget(
                                                  options:
                                                      MarkerClusterLayerOptions(
                                                    spiderfyCircleRadius: 25,
                                                    spiderfySpiralDistanceMultiplier:
                                                        2,
                                                    circleSpiralSwitchover: 999,
                                                    //we want circle always
                                                    maxClusterRadius:
                                                        mapProviderRead
                                                                .objectSelectionMode
                                                            ? 0
                                                            : 50,
                                                    disableClusteringAtZoom: 18,
                                                    rotate: true,
                                                    rotateAlignment:
                                                        Alignment.bottomCenter,
                                                    size: const Size(45, 45),
                                                    anchor: AnchorPos.align(
                                                        AnchorAlign.center),
                                                    showPolygon: false,
                                                    centerMarkerOnClick: false,
                                                    zoomToBoundsOnClick: false,

                                                    // fitBoundsOptions: FitBoundsOptions(
                                                    //   padding: EdgeInsets.all(100),
                                                    //   // maxZoom: 19,
                                                    //   zoom: currentZoomLevel.value + 1,
                                                    //   inside: true,
                                                    // ),
                                                    onClusterTap: (marker) {
                                                      print('onClusterTap');
                                                      var cz = _mapController
                                                          .centerZoomFitBounds(
                                                        marker.bounds,
                                                        options:
                                                            const FitBoundsOptions(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  100),
                                                          // maxZoom: 19,
                                                          // zoom: currentZoomLevel + 1.0,
                                                          inside: true,
                                                        ),
                                                      );
                                                      _animatedMapMove(
                                                          cz.center,
                                                          (_mapController.zoom +
                                                                  1)
                                                              .clamp(14, 19));
                                                    },
                                                    spiderfyCluster: false,
                                                    markers:
                                                        buildClusteredMarkers(),
                                                    builder:
                                                        (context, markers) {
                                                      return buildClusterCountMarker(
                                                          markers);
                                                    },
                                                  ),
                                                ),
                                              MarkerLayer(
                                                markers: [
                                                  // if (_currentLocation != null) currLocationMarker(),
                                                  if (mapProviderRead
                                                          .selectedLocation !=
                                                      null)
                                                    buildMarkerFromLocationEntity(
                                                      mapProviderRead
                                                          .selectedLocation!,
                                                      isSelected: true,
                                                    )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: IgnorePointer(
                                        ignoring: mapProviderRead
                                            .isSelectAttractionUpdate!,
                                        child: MapAttractionListScreen(
                                          onTap: (attraction) {
                                            mapProviderRead
                                                .setMapListVisibility(false);

                                            mapProviderRead.setSelectedLocation(
                                                attraction);
                                            _openLocationDetailsBottomSheet(
                                                attraction);
                                            //print("Attraction object on tap:$attraction");
                                            debugPrint(
                                                "Marker List :${mapProviderRead.filteredLocations}",
                                                wrapWidth: 1024);
                                            debugPrint(
                                                "Marker Length :${mapProviderRead.filteredLocations.length}",
                                                wrapWidth: 1024);
                                          },
                                        ),
                                      )),
                              ],
                            ),
                            _isNavigationMode
                                ? Container()
                                : DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: mapProviderRead
                                                  .isSelectAttractionUpdate ==
                                              true
                                          ? BorderRadius.only(
                                              bottomLeft:
                                                  Radius.circular(1.0.h),
                                              bottomRight:
                                                  Radius.circular(1.0.h))
                                          : BorderRadius.all(
                                              Radius.circular(0.h)),
                                      color: ColorPath.whiteColor,
                                    ),
                                    child: AttractionFilter(
                                        attractionTypeList:
                                            attractionTypeList.toList(),
                                        attractionList: allAttractionList),
                                  ),
                            VerticalSpace(
                                height: ((Platform.isAndroid) ? 2.h : 6.h))
                          ],
                        ),
                      );
                    }
                        /*   error: (error) =>
                                tabBarWidget = CustomText(
                                text: error,
                                fontSize: 13.sp,
                                underline: false,
                                fontWeight: FontWeight.w500,
                                color: ColorPath.primaryColor,
                              )*/
                        );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: _mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: _mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: _mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      _mapController.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  Widget buildClusterCountMarker(List<Marker> markers) {
    return Center(
      child: Transform.rotate(
        angle: -_mapController.rotation * pi / 180,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              fit: BoxFit.fitHeight,
              'assets/markers/marker_cluster_base.png',
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                markers.length.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Marker> buildClusteredMarkers() {
    /*return (mapProviderRead.clusteredLocations)
        .map(buildMarkerFromLocationEntity)
        .toList();*/
    return allAttractionList!.map(buildMarkerFromLocationEntity).toList();
  }

  Marker buildMarkerFromLocationEntity(Attraction e,
      {bool isSelected = false}) {
    late double radius;
    late Widget marketWidget;

    // radius = isSelected ? 70 : 40;
    radius = 40;
    marketWidget = _fullMarker(e, isSelected: isSelected);

    return Marker(
      point: LatLng(
          double.parse(e.latitude ?? "0"), double.parse(e.longitude ?? "0")),
      width: radius,
      height: radius,
      rotate: true,
      rotateAlignment: Alignment.bottomCenter,
      anchorPos: AnchorPos.align(AnchorAlign.top),
      builder: (ctx) => InkWell(
        onTap: () {
          _focusMarker(
              LatLng(double.parse(e.latitude ?? "0"),
                  double.parse(e.longitude ?? "0")),
              zoomLevel: 17);
          mapProviderRead.setSelectedLocation(e);
          print("Open Data for selected marker");
          _openLocationDetailsBottomSheet(e);
        },
        child: marketWidget,
      ),
    );
  }

  void _focusMarker(LatLng? latLng, {double zoomLevel = 18.5}) {
    // _mapController.move(latLng!, zoomLevel);
    _animatedMapMove(latLng!, zoomLevel);
  }

  _fullMarker(Attraction? e, {bool isSelected = false}) {
    //var imgAssets = 'assets/map_icons/${e?.locationMarker}.png';
    return AspectRatio(
      aspectRatio: 0.2,
      child: FancyShimmerCachedImage(
        imageUrl: e?.mapIcon ?? "",
        boxFit: BoxFit.contain,
        errorWidget: Image.asset(IconPaths.akshardhamMarkerIcon),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Future<void> _initGeoLocator() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // TODO: discuss whether it would be better to request the permission here?
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are denied forever');
    }

    var serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // If Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    try {
      _currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(milliseconds: 1500));
    } catch (e) {
      _currentLocation = await Geolocator.getLastKnownPosition();
    } finally {
      const locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
      );
      _positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings);
      _positionStreamSubscription = _positionStream?.listen((position) {
        if (mounted) {
          _currentLocation = position;
        }
      });
    }
  }

  Future<void> setMapLocationFromJson() async {
    AppJsonModel jsonDataRepo =
        await getIt<AppJsonRepository>().loadJsonAssetData();
    List<Attraction>? locationList = <Attraction>[];
    if ((jsonDataRepo.attractions ?? []).isNotEmpty) {
      locationList = jsonDataRepo.attractions;
    }
    setString(keyMapLocationsJsonEngPref, jsonEncode(locationList));
  }

  Future<void> _openLocationDetailsBottomSheet(Attraction e) async {
    double? dist;

    if (_currentLocation != null) {
      var route = context.read<MapRoutingProvider>();
      var result = route.getShortestPath(
        getCurrentLatLng(),
        LatLng(
            double.parse(e.latitude ?? "0"), double.parse(e.longitude ?? "0")),
      );
      if (result != null) {
        dist = MapRoutingProvider.getDistanceFromResult(result);
        Logger().i("distance : $dist");
      }
    }

    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      context: context,
      barrierColor: Colors.transparent.withOpacity(.1),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Stack(
          children: [
            Positioned(
                right: 0,
                left: 0,
                bottom: 12.h,
                child: AttractionTypeCommonDialog(
                  attraction: e,
                  attractionList: allAttractionList,
                  estimatedTime: MapRoutingProvider.getTimeFromLength(dist),
                  startNavigationCallback: () async {
                    Map<String, dynamic> mapParameter = {
                      'type': startNavigationEvent,
                      'name': e.title.toString(),
                    };
                    setAnalyticData(navigationWayFinding, mapParameter);
                    await startNavigation(e, dist!);
                    print(
                        "DISTANCE AWAITED: ${MapRoutingProvider.getTimeFromLength(dist)}");
                  },
                  buildContext: context,
                )),
          ],
        );
      },
    ).then((value) {
      if (bottomSheetController == null) {
        widget.isLocationAttraction = null;
        mapProviderRead.clearSelectedLocation();
        mapProviderRead.isBottomSheetSelected = false;
        exitNavigation();
      }
    });
  }

  LatLng getCurrentLatLng() {
    if (_currentLocation != null) {
      return LatLng(
        _currentLocation?.latitude ?? 0,
        _currentLocation?.longitude ?? 0,
      );
    } else {
      return initialCameraPosition;
    }
  }

  // Start Navigation Path
  Future<void> startNavigation(Attraction e, double distAwaited) async {
    _isNavigationMode = true;
    var route = context.read<MapRoutingProvider>();
    var result = route.getShortestPath(
      getCurrentLatLng(),
      LatLng(double.parse(e.latitude ?? "0"), double.parse(e.longitude ?? "0")),
    );
    if (result != null) {
      drawNavigationPath(result.path);
      var cz = _mapController.centerZoomFitBounds(
        LatLngBounds(
            getCurrentLatLng(),
            LatLng(double.parse(e.latitude ?? "0"),
                double.parse(e.longitude ?? "0"))),
        options: const FitBoundsOptions(
          inside: true,
          padding: EdgeInsets.all(200),
        ),
      );
      _animatedMapMove(cz.center, cz.zoom);

      if (_isNavigationMode) {
        getIt<AppRouter>().pop();
        //updateValue.isHidden.value = true;
        updateValue.setFloatingVisibility(true);
        bottomSheetController = scaffoldKey.currentState!.showBottomSheet(
          (context) => NavigationBottomSheet(
            entity: e,
            estimatedDistance: distAwaited,
            estimatedTime: MapRoutingProvider.getTimeFromLength(distAwaited),
            endNavigationCallback: () {
              Map<String, dynamic> mapParameter = {
                'type': exitNavigationEvent,
                'name': e.title.toString(),
              };
              setAnalyticData(nameMap, mapParameter);
              exitNavigation();
              bottomSheetController?.close();

              // end the Navigation
              /* setState(() {

                });
                setState(() {
                  _isNavigationMode = false;
                });*/
              if (e.attractionType != allText) {
                if (mapProviderRead.objectSelectionMode) {
                  print('objectSelectionMode');
                  var sl = mapProviderRead.selectedLocation;
                  if (sl != null) {
                    mapProviderRead.selectMapFilter(sl.attractionType);
                  } else {
                    mapProviderRead.selectMapFilter(null);
                  }
                  // getIt<AppRouter>().pop();
                }
                bottomSheetController = null;
                mapProviderRead.clearSelectedLocation();
                exitNavigation();
              }
            },
            positionStream: _positionStream!,
            onPathChanged: (path) {
              drawNavigationPath(path);
            },
          ),
        );
      }
    }
  }

  void drawNavigationPath(List<String> path) {
    lines.clear();
    var points = MapRoutingProvider.getPolylineFromFeature(path);
    var startPoint = points.first;

    for (var i = 1; i < points.length; i++) {
      var endPoint = points[i];
      lines.add(
        Polyline(
          points: [startPoint, endPoint],
          color: Colors.blue,
          strokeWidth: 8,
        ),
      );
      startPoint = endPoint;
    }
  }

  exitNavigation() {
    lines.clear();
    _isNavigationMode = false;
    mapProviderRead.isBottomSheetSelected = false;
    updateValue.isHidden.value = false;
  }
}
