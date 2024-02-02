// ignore_for_file: must_be_immutable
import 'dart:io';

import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/lookups/lookups.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../utils/constants.dart';
import '../../model/campus/campus.dart';
import '../../utils/iconpath.dart';
import '../bloc/app_json/app_json_bloc.dart';
import '../bloc/app_json/app_json_events.dart';
import '../bloc/app_json/app_json_state.dart';

class GetAkshardham extends StatelessWidget {
  GetAkshardham({Key? key,this.campus,this.lookups}) : super(key: key);
  Widget? getAkshardhamWidget;
  final MapController _mapController = MapController();
  final double defaultZoom = 10;
  int currentZoomLevel = 10;
  Campus? campus;
  Lookups? lookups;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:
      BoxDecoration(
        color: ColorPath.whiteColor.withOpacity(0.10),
        border: Border(
          top: BorderSide(color: ColorPath.secondaryBrownColor, width: 0.1.h),
        ),
      ),child: Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
      //color: ColorPath.buttonOutlineColor.withOpacity(.2),
      color: ColorPath.secondaryBrownColor.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: getAkshardham.toUpperCase(),
            fontSize: 15.sp,
            underline: false,
            fontWeight: FontWeight.w300,
            fontFamily: addingTonFont,
            color: ColorPath.primaryColor,
            maxLine: 5,
            letterSpacing: 2,
          ),
          VerticalSpace(height: 2.h),
          CustomText(
            text: getAkshardhamDesc,
            fontSize: 12.sp,
            underline: false,
            fontWeight: FontWeight.w400,
            fontFamily: interFont,
            color: ColorPath.primaryColor,
            maxLine: 5,
          ),
          VerticalSpace(height: 2.h),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: Platform.isIOS ? 56.h:50.h,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorPath.whiteColor,
                    borderRadius:BorderRadius.all(Radius.circular(1.h),),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 23.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(1.h),topLeft: Radius.circular(1.h)),
                            child: FlutterMap(
                              options:MapOptions(center: LatLng(double.parse(
                                  campus!.latitude.toString()),double.parse(
                                  campus!.longitude.toString())),
                                /*interactiveFlags: InteractiveFlag.pinchMove |
                                          InteractiveFlag.pinchZoom |
                                          InteractiveFlag.rotate,*/
                                interactiveFlags:InteractiveFlag.none,
                                zoom: 15,
                                /* minZoom: 12,
                                          maxZoom: 18,*/
                              ),
                              children: [
                                TileLayer(urlTemplate:'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                                MarkerLayer(markers: [
                                  Marker(
                                      width: 30.0,
                                      height: 30.0,
                                      point: LatLng(double.parse(
                                          campus!.latitude.toString()),double.parse(
                                          campus!.longitude.toString())),
                                      builder: (ctx) => const Icon(
                                        Icons.location_on,
                                        color: Colors.blueAccent,
                                        size: 40,
                                      )
                                  ),
                                ]),
                                //To represent circle radius in map.
                                /*CircleLayer(
                                            circles: [
                                              CircleMarker(
                                                point: LatLng(double.parse(appJsonData.campus!.latitude.toString()),double.parse(appJsonData.campus!.longitude.toString())),
                                                radius: 70,
                                                color: Colors.red.withOpacity(0.2),
                                                borderColor: Colors.red,
                                                borderStrokeWidth: 2.0,
                                              ),
                                            ],
                                          ),*/
                              ],
                            ),
                          ),
                        ),
                      ),
                      VerticalSpace(height: 3.h),
                      //map container
                      GestureDetector(
                        onTap: () async {
                          var mapLink = "https://www.google.com/maps/search/?api=1&query=112+N+Main+St,+Robbinsville+Twp,+NJ,+USA";
                          urlLaunch(mapLink.toString());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 3.h,left: 3.h),
                          child:WidgetContainer(
                            widget: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(IconPaths.mapLogo),
                                HorizontalSpace(width: 2.w),
                                CustomText(
                                  text: maps,
                                  fontSize: 14.sp,
                                  underline: false,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: interFont,
                                  color: ColorPath.whiteColor,
                                  maxLine: 5,
                                ),
                              ],
                            ),
                            color: ColorPath.primaryButtonColor,
                          ),
                        ),
                      ),
                      Platform.isIOS ? GestureDetector(
                        onTap: () async {
                          var mapLink = 'https://maps.apple.com/?q=';
                          launchMapsUrl(
                              mapLink,
                              double.parse(campus!.latitude
                                  .toString()),
                              double.parse(campus!.longitude
                                  .toString()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 3.h,left: 3.h,top:2.h),
                          child:WidgetContainer(
                            widget: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(IconPaths.mapLogo),
                                HorizontalSpace(width: 2.w),
                                CustomText(
                                  text: appleMaps,
                                  fontSize: 14.sp,
                                  underline: false,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: interFont,
                                  color: ColorPath.whiteColor,
                                  maxLine: 5,
                                ),
                              ],
                            ),
                            color: ColorPath.primaryButtonColor,
                          ),
                        ),
                      ):Container(),

                      VerticalSpace(height: 2.h),
                      //uber container
                      GestureDetector(
                        onTap: () async {
                          launchMapsUrl(
                            lookups!.uberDeeplink.toString(),
                            double.parse(campus!.latitude
                                .toString()),
                            double.parse(campus!.longitude
                                .toString()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 3.h,left: 3.h),
                          child: WidgetContainer(
                            color: ColorPath.primaryColor,
                            widget: SvgPicture.asset(IconPaths.uberImage),
                          ),
                        ),
                      ),
                      VerticalSpace(height: 2.h),
                      //lyft container
                      GestureDetector(
                        onTap: () {
                          //'lyft://ridetype?id=lyft&pickup[latitude]=42.265570&pickup[longitude]=-83.387391&destination[latitude]=42.253737&destination[longitude]=-83.211945'
                          /*launchMapsUrl(
                           lookups!.lyftDeeplink.toString(),
                            double.parse(campus!.latitude
                                .toString()),
                            double.parse(campus!.longitude
                                .toString()),
                          );*/
                          urlLaunch(lookups!.lyftDeeplink.toString());
                        },
                        child:Padding(
                          padding: EdgeInsets.only(right: 3.h,left: 3.h,bottom: 3.h),
                          child:WidgetContainer(
                            color: ColorPath.lyftContainer,
                            widget: SvgPicture.asset(IconPaths.lyftImage),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
          VerticalSpace(height: 3.h),
        ],
      ),
    ),
    );
  }
}
