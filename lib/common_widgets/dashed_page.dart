import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashedPageIndicator extends StatelessWidget {
  final int count;
  final int activeIndex;
  final Color dotColor;
  final Color activeDotColor;

  DashedPageIndicator({
    required this.count,
    required this.activeIndex,
    required this.dotColor,
    required this.activeDotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return Container(
          width: 3.h, // Adjust the width according to your preference
          height: 0.5.h, // Height of the dashed line
          margin: EdgeInsets.symmetric(horizontal: 2), // Adjust the spacing between dots
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: index == activeIndex ? activeDotColor : dotColor,
          ),
        );
      }),
    );
  }
}
