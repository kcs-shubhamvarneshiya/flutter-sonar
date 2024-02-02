import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../model/attraction/attraction.dart';
import '../../presentaion/bloc/common_slider_image_bloc/common_image_slider_bloc.dart';
import '../../presentaion/bloc/common_slider_image_bloc/common_image_slider_state.dart';
import '../../presentaion/bloc/common_slider_image_bloc/common_image_slider_tap.dart';
import '../../router_page/app_router.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/iconpath.dart';
import '../../utils/strings.dart';
import '../custom_text.dart';
import '../fancyShimmerCachedImage.dart';

class VisitImageSlider extends StatelessWidget {
  VisitImageSlider(
      {super.key, this.attractionList, this.controller});

  List<Attraction>? attractionList;
  PageController? controller;
  int? _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => GetIt.I<CommonImageSliderBloc>(),
      child: BlocBuilder<CommonImageSliderBloc, CommonImageSliderState>(
          builder: (context, state) {
            _currentPage = state.currentIndex;

            return Column(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  color: ColorPath.whiteColor.withOpacity(0.1),
                  child: SizedBox(
                    height: 24.h,
                    child: PageView.builder(
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: (attractionList!.length < 5 ? attractionList!.length:Constant.attractionItemCount),
                      onPageChanged: (int page) {
                        _currentPage = page;
                        //print(_currentPage);
                        context.read<CommonImageSliderBloc>().add(CommonImageSliderTapEvent.tap(_currentPage!));
                      },
                      itemBuilder: (context, index) {
                        return attractionList![index].options!.isRecommended == true
                            ? GestureDetector(
                          onTap: () {
                            Attraction? selectedAttraction =attractionList!.firstWhere((element) => element.id == attractionList![index].id);
                            getIt<AppRouter>().push(AttractionDetailsRoute(appJsonModel: [selectedAttraction]));
                          },
                          child: Card(
                            shadowColor: ColorPath.whiteColor,
                            elevation: 0,
                            margin: EdgeInsets.only(right: 1.h, left: 0.5.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: FancyShimmerCachedImage(
                                        imageUrl: attractionList![index]
                                            .thumbnail
                                            .toString(),
                                        boxFit: BoxFit.cover,
                                        alignment: Alignment.center,
                                        errorWidget: Image.asset(
                                          IconPaths.placeholderImage,fit: BoxFit.fitWidth,),
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 7.h,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.h, vertical: 2.h),
                                  decoration: const BoxDecoration(
                                    color: ColorPath.whiteColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: CustomText(
                                    text: attractionList![index].title,
                                    fontSize: 14.sp,
                                    underline: false,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: addingTonFont,
                                    color: ColorPath.primaryColor,
                                    maxLine: 3,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ): Container();
                      },
                    ),
                  ),
                  //),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HorizontalSpace(width: 1.h),
                      GestureDetector(
                        onTap: () {
                          context.read<CommonImageSliderBloc>().add(CommonImageSliderTapEvent.tap(_currentPage!));
                          if (controller!.page! > 0) {
                            controller!.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }
                        },
                        child: Icon(
                            Icons.arrow_back_ios,
                            size: 2.h,
                            color: _currentPage == 0 ? ColorPath
                                .secondaryBrownColor
                                .withOpacity(0.30) : ColorPath.secondaryBrownColor
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: SmoothPageIndicator(
                          controller: controller!,
                          count:(attractionList!.length < 5 ? attractionList!.length:Constant.attractionItemCount),
                          effect: SlideEffect(
                            radius: 8,
                            spacing: 5,
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: ColorPath.secondaryBrownColor.withOpacity(
                                .40),
                            activeDotColor: ColorPath.secondaryBrownColor,
                          ),
                        ),
                      ),

                      HorizontalSpace(width: 1.h),
                      GestureDetector(
                          onTap: () {

                              if (controller!.page! < (attractionList!.length < 5 ? attractionList!.length - 1:Constant.attractionItemCount.toInt() - 1)) {
                                context.read<CommonImageSliderBloc>().add(CommonImageSliderTapEvent.tap(_currentPage!));
                                controller!.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                              }

                          },
                          child: Icon(Icons.arrow_forward_ios,
                              size: 2.h,
                              color:
                              _currentPage == (attractionList!.length < 5 ? attractionList!.length - 1:Constant.attractionItemCount.toInt() - 1)
                                  ? ColorPath.secondaryBrownColor.withOpacity(.30) : ColorPath.secondaryBrownColor
                          )
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
