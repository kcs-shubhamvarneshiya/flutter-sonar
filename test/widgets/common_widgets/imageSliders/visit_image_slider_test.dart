import 'package:akdmvisitorsapp/common_widgets/ImageSliders/visit_image_slider.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
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

  Widget visitImageSliderWidget(List<Attraction> attractionList) {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(
          builder: (context, orientation, deviceType){
            return BlocProvider(
              create: (context) => CommonImageSliderBloc(),
              child: VisitImageSlider(
                controller: PageController(),
                attractionList: attractionList,
              ),
            );
          },
        ),
      ),
    );
  }


  testWidgets('VisitImageSlider widget test', (WidgetTester tester) async {
    // Mock data for attractionList
    List<Attraction> attractionList = [
      Attraction(
          id: 1,
          title: 'Attraction 1',
          thumbnail: 'image1.jpg',
          options: Options(isRecommended: true)),
      Attraction(
          id: 2,
          title: 'Attraction 2',
          thumbnail: 'image2.jpg',
          options: Options(isRecommended: true)),
      Attraction(
          id: 3,
          title: 'Attraction 3',
          thumbnail: 'image3.jpg',
          options: Options(isRecommended: true)),
    ];

    await tester.pumpWidget(visitImageSliderWidget(attractionList));


    // Verify the initial state of the widget
    expect(find.byType(VisitImageSlider), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(FancyShimmerCachedImage), findsOneWidget);
    expect(find.byType(SmoothPageIndicator), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);

    // Tap on the next arrow
    await tester.tap(find.byIcon(Icons.arrow_forward_ios));
    await tester.pump(); // Pump one frame

    // Wait for the animation to complete
    await tester.pump(const Duration(milliseconds: 500));

    // Verify that the page is changed
    expect(find.text('Attraction 2'), findsOneWidget);
    expect(find.text('Attraction 1'), findsNothing);

    // Additional test cases for more coverage can be added as needed
  });
}
