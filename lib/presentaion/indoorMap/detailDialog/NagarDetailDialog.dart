import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/fancyShimmerCachedImage.dart';
import '../../../utils/iconpath.dart';

class LocationDetails extends StatefulWidget {
  final VoidCallback startNavigationCallback;
  final VoidCallback addToPlanCallback;
  final VoidCallback knowMoreCallback;
  final Attraction entity;
  final Future<double?>? estimatedTime;

  LocationDetails(
      {required this.entity,
      required this.startNavigationCallback,
        required this.addToPlanCallback,
        required this.knowMoreCallback,
      this.estimatedTime});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  List<Attraction> objectsOnSelectedLoc = [];

  DraggableScrollableController? _sheetController;

  MapMarkerProvider get mapProviderRead => context.read<MapMarkerProvider>();
  Set<String?> attractionTypeList = <String?>{};
  List<Attraction>? allAttractionList = [];
  ValueNotifier<List<Attraction>?> filteredAttractionList = ValueNotifier([]);
  @override
  void initState() {
    objectsOnSelectedLoc =
        mapProviderRead.getAllEntitiesFromLocId(widget.entity.id ?? 0);
    _sheetController = DraggableScrollableController();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DraggableScrollableSheet(
          initialChildSize: 0.40,
          minChildSize: 0.40,
          maxChildSize: 0.70,
          snap: true,
          expand: false,
          snapSizes: const [
            0.70,
          ],
          controller: _sheetController,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: ColorPath.activityBgColor,
                borderRadius: BorderRadius.circular(1.5.h),
              ),
              child: CustomScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        var e = objectsOnSelectedLoc[index];
                        return _buildRow(context, e);
                        /*if ((e.attractionType ?? "") == "utility") {
                          return _utitlity(context, e);
                        } else {
                          return _buildRow(context, e);
                        }*/
                      },
                      childCount: objectsOnSelectedLoc.length,
                    ),
                  ),
                ],
              ),
            );
          }),
        Positioned(
          bottom: 0.h,
          left: 0.h,
          right: 0.h,
          child: GestureDetector(
          //Navigate to Details page
          onTap: widget.knowMoreCallback,
          child: Container(
            height: 7.h,
            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
            decoration: const BoxDecoration(
              color: ColorPath.planSubContainer,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: knowMore,
                    fontSize: 14.sp,
                    underline: false,
                    fontWeight: FontWeight.w300,
                    fontFamily: addingTonFont,
                    color: ColorPath.primaryColor,
                    maxLine: 5,
                  ),
                  Container(
                    height: 5.h,
                    width: 7.w,
                    padding: EdgeInsets.all(1.h),
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorPath.primaryColor,
                    ),
                    child: SvgPicture.asset(IconPaths.rightDoubleIcon),
                  ),
                ],
              ),
            ),
          ),
      ),
        ),]

    );
  }

  void navigateToDetailsScreen(
      String routeScreen, String label, Attraction model) {
    print("Navigate to Attraction detail page");
    // try {
    //   NavigationUtils.push(context, routeScreen, arguments: {
    //     argDetailScreenTitle: label,
    //     argEventObj: model,
    //     argsIsEvent: detailScreenType,
    //     argsFromLocation: "nagar_detail_dialog"
    //   });
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  Widget _buildRow(BuildContext context, Attraction? e) {
    return InkWell(
      onTap: () async {
        print("navigateToDetailsScreen: ON TAP");
        /*var facilityPR = context.read<FacilityProvider>();
        facilityPR.readFacilityData(context);

          var attractionModel = (facilityPR.listAttractions ?? [])
              .firstWhere((element) => element.id == e?.objId);*/

        // navigateToDetailsScreen(
        //     routeDetailScreen,
        //     themeProvider!.localization.labelAttraction,
        //     attractionModel,
        //     EntityTypes.attraction);

        // var selectedItem = (facilityPR.listEvents ?? [])
        //     .singleWhere((element) => false, orElse: null);
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                left: 2.5.h, right: 2.5.h, top: 2.5.h, bottom: 1.h),
            decoration: BoxDecoration(
              color: ColorPath.activityBgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1.5.h),
                topRight: Radius.circular(1.5.h),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:FancyShimmerCachedImage(
                      imageUrl:e?.thumbnail ?? "",
                      boxFit: BoxFit.fill,
                      errorWidget: Image.asset(IconPaths.placeholderImage),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                VerticalSpace(height: 1.5.h),
                (e?.displayOrder?.visitPlanner != null) ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (e?.displayOrder?.visitPlanner != null) ? ElevatedButton(
                      onPressed: widget.addToPlanCallback,
                      style: ElevatedButton.styleFrom(backgroundColor: ColorPath.redColor),
                      child: CustomText(
                        text: addPlan,
                        fontSize: 12.sp,
                        underline: false,
                        fontFamily: interFont,
                        fontWeight: FontWeight.w400,
                        color: ColorPath.whiteColor,
                      ),
                    ) : const SizedBox(),
                    ElevatedButton(
                        onPressed: widget.startNavigationCallback,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPath.bottomNavSelectedItemColor),
                        child: CustomText(
                          text: navigate,
                          fontSize: 12.sp,
                          underline: false,
                          fontFamily: interFont,
                          fontWeight: FontWeight.w400,
                          color: ColorPath.whiteColor,
                        ),
                      )
                  ],
                ):SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: widget.startNavigationCallback,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPath.bottomNavSelectedItemColor),
                    child: CustomText(
                      text: navigate,
                      fontSize: 12.sp,
                      underline: false,
                      fontFamily: interFont,
                      fontWeight: FontWeight.w400,
                      color: ColorPath.whiteColor,
                    ),
                  ),
                ),

                VerticalSpace(height: 1.5.h),
                CustomText(
                  text: e!.title?.toUpperCase(),
                  fontSize: 13.sp,
                  underline: false,
                  fontFamily: addingTonFont,
                  fontWeight: FontWeight.w300,
                  color: ColorPath.primaryColor,
                  maxLine: 2,
                  letterSpacing: 1.5,
                ),
                VerticalSpace(height: 1.5.h),
                FutureBuilder<double?>(
                    future: widget.estimatedTime,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return CustomText(
                          text:
                              '${timeRemain(snapshot.data!.round())}. ${e.description ?? ''}',
                          fontSize: 12.sp,
                          underline: false,
                          fontWeight: FontWeight.normal,
                          fontFamily: interFont,
                          color: ColorPath.primaryColor,
                          //maxLine: 3,
                        );
                      } else {
                        return CustomText(
                          text:
                          e.description ?? '',
                          fontSize: 12.sp,
                          underline: false,
                          fontWeight: FontWeight.normal,
                          fontFamily: interFont,
                          color: ColorPath.primaryColor,
                          //maxLine: 3,
                        );
                      }
                    }),
                VerticalSpace(height: 1.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEventTimeAndLocation(IconData icons, String strLabel) {
    if (strLabel.isEmpty) return Container();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 14,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            strLabel,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface)
                .copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }

  ButtonStyle primaryElevatedButtonTheme(BuildContext _context) =>
      ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      );

  /*Widget _utitlity(BuildContext context, Attraction? e) {
    return Card(
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFFB78A62),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 16)
          .add(const EdgeInsets.only(bottom: 16)),
      child: InkWell(
          onTap: () {
            print("NagarDetailDialog: Utility:ON TAP: ${e?.id}");

            *//* var facilityPR = context.read<FacilityProvider>();
            facilityPR.readFacilityData(context);
            var attractionModel = (facilityPR.listUtilities ?? [])
                .firstWhere((element) => element.id == e?.objId);

            NavigationUtils.push(
              context,
              routeUtilityDetailScreen,
              arguments: {
                argDetailScreenTitle: themeProvider!.localization.labelUtility,
                argUtilityObj: attractionModel,
                argsFromLocation: "facilities"
              },
            );*//*
          },
          child: Container(
            color: Colors.white,
            height: 75,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: *//*SvgPicture.asset(
                        'assets/svg_icons/${e?.locationMarker ?? ""}.svg',
                        color: Theme.of(context).colorScheme.primary,
                        placeholderBuilder: (_) => Icon(
                          Icons.image,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )*//*
                      FancyShimmerCachedImage(
                        imageUrl: e?.mapIcon ?? "",
                        boxFit: BoxFit.cover,
                        errorWidget: Image.asset(IconPaths.akshardhamMarkerIcon),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  // fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          maxLines: 1,
                          e!.title?.toUpperCase() ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.onSurface)
                              .copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }*/
}
