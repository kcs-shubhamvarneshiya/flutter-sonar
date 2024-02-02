import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../presentaion/bloc/common_slider_image_bloc/common_image_slider_bloc.dart';
import '../../presentaion/bloc/common_slider_image_bloc/common_image_slider_state.dart';
import '../../presentaion/bloc/common_slider_image_bloc/common_image_slider_tap.dart';
import '../../utils/colors.dart';
import '../../utils/iconpath.dart';
import '../fancyShimmerCachedImage.dart';

class CommonImageSlider extends StatelessWidget {
  CommonImageSlider(
      {super.key,
      this.controller,
      this.attractionItem,
      required this.isGuideLine});

  List<String>? attractionItem;
  PageController? controller;
  bool isGuideLine;
  int? _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<CommonImageSliderBloc>(),
      child: BlocBuilder<CommonImageSliderBloc, CommonImageSliderState>(
          builder: (context, state) {
        _currentPage = state.currentIndex;

        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: ColorPath.whiteColor.withOpacity(0.1),
              child: SizedBox(
                height: 19.h,
                child: PageView.builder(
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: attractionItem!.length,
                  onPageChanged: (int page) {
                    _currentPage = page;
                    //print(_currentPage);
                    context
                        .read<CommonImageSliderBloc>()
                        .add(CommonImageSliderTapEvent.tap(_currentPage!));
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 0.3.h, left: 0.3.h),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: FancyShimmerCachedImage(
                          imageUrl: attractionItem![index].toString() ?? "",
                          boxFit: BoxFit.cover,
                          alignment: Alignment.center,
                          errorWidget: Image.asset(IconPaths.placeholderImage,
                              fit: BoxFit.fitWidth),
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    );
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
                      context
                          .read<CommonImageSliderBloc>()
                          .add(CommonImageSliderTapEvent.tap(_currentPage!));
                      if (controller!.page! > 0) {
                        controller!.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    },
                    child: Icon(Icons.arrow_back_ios,
                        size: 2.h,
                        color: _currentPage == 0
                            ? (isGuideLine
                                ? ColorPath.ViewMore
                                : ColorPath.secondaryBrownColor
                                    .withOpacity(0.30))
                            : (isGuideLine
                                ? ColorPath.blackColor.withOpacity(0.7)
                                : ColorPath.secondaryBrownColor)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: controller!,
                      count: attractionItem!.length,
                      effect: SlideEffect(
                        radius: 8,
                        spacing: 5,
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: isGuideLine!
                            ? ColorPath.ViewMore
                            : ColorPath.secondaryBrownColor.withOpacity(.40),
                        activeDotColor: isGuideLine!
                            ? ColorPath.blackColor.withOpacity(0.7)
                            : ColorPath.secondaryBrownColor,
                      ),
                    ),
                  ),
                  HorizontalSpace(width: 1.h),
                  GestureDetector(
                      onTap: () {
                        if (controller!.page! < attractionItem!.length - 1) {
                          context.read<CommonImageSliderBloc>().add(
                              CommonImageSliderTapEvent.tap(_currentPage!));
                          controller!.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        }
                      },
                      child: Icon(Icons.arrow_forward_ios,
                          size: 2.h,
                          color: _currentPage == (attractionItem!.length - 1)
                              ? (isGuideLine
                                  ? ColorPath.ViewMore
                                  : ColorPath.secondaryBrownColor
                                      .withOpacity(0.30))
                              : (isGuideLine
                                  ? ColorPath.blackColor.withOpacity(0.7)
                                  : ColorPath.secondaryBrownColor))),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
