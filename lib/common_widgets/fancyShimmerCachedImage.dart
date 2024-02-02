library fancy_shimmer_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/defaults.dart';
import 'package:fancy_shimmer_image/widgets/image_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';
import 'custom_text.dart';

class FancyShimmerCachedImage extends StatelessWidget {
  const FancyShimmerCachedImage({
    Key? key,
    required this.imageUrl,
    this.boxFit = BoxFit.fill,
    this.width,
    this.height,
    this.shimmerDirection = ShimmerDirection.ltr,
    this.shimmerDuration = const Duration(milliseconds: 1500),
    this.cacheKey,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerBackColor,
    this.errorWidget,
    this.boxDecoration,
    this.color,
    this.alignment,
    this.imageBuilder,
  }) : super(key: key);

  final String imageUrl;
  final double? width;
  final double? height;
  final ShimmerDirection shimmerDirection;
  final Duration shimmerDuration;
  final BoxFit boxFit;
  final String? cacheKey;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final Color? shimmerBackColor;
  final Widget? errorWidget;
  final BoxDecoration? boxDecoration;
  final Color? color;
  final Alignment? alignment;
  final ImageWidgetBuilder? imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      alignment: alignment ?? Alignment.topCenter,
      color: color,
      imageUrl: imageUrl,
      cacheKey: cacheKey,
      fit: boxFit,
      width: width,
      height: height,
      imageBuilder: imageBuilder,
      placeholder: (context, url) => ImageShimmerWidget(
        width: width,
        height: 100,
        shimmerDirection: shimmerDirection,
        shimmerDuration: shimmerDuration,
        baseColor: shimmerBaseColor ?? defaultShimmerBaseColor,
        highlightColor: shimmerHighlightColor ?? defaultShimmerHighlightColor,
        backColor: shimmerBackColor ?? defaultShimmerBackColor,
        boxDecoration: boxDecoration,
      ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.error, color: Colors.red),
                CustomText(
                  text: errorImageTitle,
                  fontSize: 14.sp,
                  underline: false,
                  fontWeight: FontWeight.w300,
                  fontFamily: addingTonFont,
                  color: ColorPath.primaryColor,
                  maxLine: 8,
                  align: TextAlign.center,
                )
              ],
            ),
          ),
    );
  }
}
