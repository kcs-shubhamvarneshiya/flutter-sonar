import 'dart:io';

import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/news_event_common_widget.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/common_slider_image_bloc/common_image_slider_bloc.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<CommonImageSliderBloc>(CommonImageSliderBloc());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  Widget newsEventCommonWidget(List<String> imageList, bool isEvent) {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(
          builder: (context, orientation, deviceType) {
            return NewsEventCommonWidget(
              imageLength: 3,
              imageUrl: imageList,
              title: 'Test Title',
              publishedDate: '2023-11-08',
              description: 'This is a test description.',
              eventStatus: 'Upcoming',
              eventDate: '2023-11-15',
              isEventContainer: isEvent,
              onNewsClick: () {},
              externalLink: 'https://example.com',
            );
          },
        ),
      ),
    );
  }

  testWidgets('NewsEventCommonWidget widget test', (WidgetTester tester) async {
    // Test case 1: imageLength > 0

    var imageList = ['image1.jpg', 'image2.jpg', 'image3.jpg'];

    await tester.pumpWidget(newsEventCommonWidget(imageList,false));

    // Assert that the widget renders correctly
    expect(find.text('Test Title'), findsOneWidget);

    expect(find.text('This is a test description.'), findsOneWidget);

    expect(find.byType(PageView), findsOneWidget);

    expect(find.byType(CustomText), findsNWidgets(4));
  });

  testWidgets('NewsEventCommonWidget widget test', (WidgetTester tester) async {
    //Test case 2: imageLength == 0

    List<String> imageList = [];

    await tester.pumpWidget(newsEventCommonWidget(imageList,false));

    // Assert that the widget renders correctly without images
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('This is a test description.'), findsOneWidget);
    expect(find.byType(PageView), findsNothing);


    // Test case 3: isEventContainer is true

    List<String>  imageListData = ['image1.jpg', 'image2.jpg'];

    await tester.pumpWidget(newsEventCommonWidget(imageListData,true));

    // Assert that the share button is present for event containers
    expect(find.byType(SvgPicture), findsOneWidget);

    expect(find.byType(CustomText), findsNWidgets(3));

    var path  = IconPaths.shareIconButton;
    final exists = getProjectFile(path).existsSync();
    expect(exists, isTrue, reason: '$path does not exist');

  });


}
