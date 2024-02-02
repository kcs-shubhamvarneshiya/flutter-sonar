import 'dart:io';

import 'package:akdmvisitorsapp/common_widgets/ImageSliders/common_image_slider.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/common_slider_image_bloc/common_image_slider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<CommonImageSliderBloc>(CommonImageSliderBloc());
}


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupLocator();


  Widget commonImageSliderWidget(List<String> imageList) {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(
          builder: (context, orientation, deviceType){
            return BlocProvider(
              create: (context) => CommonImageSliderBloc(),
              child: CommonImageSlider(
                controller: PageController(),
                attractionItem: imageList,
                isGuideLine: true,
              ),
            );
          },
        ),
      ),
    );
  }

  testWidgets('CommonImageSlider widget test', (WidgetTester tester) async {
    var imageList = ['image1.jpg', 'image2.jpg', 'image3.jpg'];

    // Build our widget and trigger a frame.
    await tester.pumpWidget(commonImageSliderWidget(imageList));

    // Verify the initial state of the widget
    expect(find.byType(CommonImageSlider), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(FancyShimmerCachedImage), findsOneWidget);
    expect(find.byType(SmoothPageIndicator), findsOneWidget);

    // Tap on the next arrow
    await tester.tap(find.byIcon(Icons.arrow_forward_ios));
    await tester.pump();

    await tester.pump(const Duration(milliseconds: 500));

    // Verify that the page is changed
    expect(find.text('image2.jpg'), findsOneWidget);

    // Tap on the previous arrow
    await tester.tap(find.byIcon(Icons.arrow_back_ios));
    await tester.pump();

    await tester.pump(const Duration(milliseconds: 500));

    // Verify that the page is changed back
    expect(find.text('image1.jpg'), findsOneWidget);


    // Additional test cases for more coverage can be added as needed
  });
}