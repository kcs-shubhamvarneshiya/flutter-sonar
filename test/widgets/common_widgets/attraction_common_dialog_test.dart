import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/attraction_common_dialog.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //get Path from Folder
  File _getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  Widget headerSectionWidget(Attraction attraction, List<Attraction> attractionList, double estimatedTime) {
    startNavigationCallback() {}
    return MaterialApp(
      home: Sizer(
          builder: (context, orientation, deviceType) {
            return AttractionTypeCommonDialog(
              attraction: attraction,
              attractionList: attractionList,
              startNavigationCallback: startNavigationCallback,
              estimatedTime: estimatedTime,
            );
          }
      ),
    );
  }


  testWidgets('AttractionTypeCommonDialog shows content', (WidgetTester tester) async {
    // Define test variables.
    final attraction = Attraction(
      id: 1,
      title: 'Test Attraction',
      attractionType:"Maha Mandir", //UtilityAttractionType.facilities.name
      thumbnail: 'test_thumbnail.jpg',
      averageVisitLengthInMinutes: 30,
    );
    final attractionList = <Attraction>[attraction];
    const estimatedTime = 30.0;

    // Build the AttractionTypeCommonDialog.
    await tester.pumpWidget(headerSectionWidget(attraction,attractionList,estimatedTime));

    await tester.pump();

    // Find widgets in the dialog content.
    final titleFinder = find.text('Test Attraction');

    final navigateButtonFinder = find.text('Navigate');

    final durationTextFinder = find.text('30 mins');

    final knowMoreFinder = find.text('Know More');

    // Verify that the widgets are displayed.
    expect(titleFinder, findsOneWidget);

    expect(navigateButtonFinder, findsOneWidget);

    expect(durationTextFinder, findsOneWidget);

    expect(knowMoreFinder, findsOneWidget);

    expect(find.byType(Container), findsNWidgets(6));

    expect(find.byType(CustomText), findsNWidgets(5));

    expect(find.byType(ElevatedButton), findsOneWidget);

    expect(find.byType(Column), findsNWidgets(3));

    expect(find.byType(Row), findsNWidgets(2));

    expect(find.byType(VerticalSpace), findsNWidgets(4));

    expect(find.byType(ClipRRect), findsOneWidget);

    expect(find.byType(SizedBox), findsNWidgets(11));

    expect(find.byType(FancyShimmerCachedImage), findsOneWidget);

    expect(find.byType(AlertDialog), findsOneWidget);

    var path  = IconPaths.walkingIcon;
    final exists = _getProjectFile(path).existsSync();
    expect(exists, isTrue, reason: '$path does not exist');
  });


  testWidgets('AttractionTypeCommonDialog shows content', (WidgetTester tester) async {
    // Define test variables.
    final attraction = Attraction(
      id: 1,
      title: 'Parking Attraction',
      attractionType: "Parking",
      //UtilityAttractionType.facilities.name
      thumbnail: 'test_thumbnail.jpg',
      averageVisitLengthInMinutes: 20,
    );

    final attractionList = <Attraction>[attraction];
    const estimatedTime = 20.0;

    await tester.pumpWidget(headerSectionWidget(attraction, attractionList, estimatedTime));

    await tester.pump();

    // Find widgets in the dialog content.
    final titleFinder = find.text('Parking Attraction');

    final navigateButtonFinder = find.text('Navigate');

    final durationTextFinder = find.text('20 mins');

    // Verify that the widgets are displayed.
    expect(titleFinder, findsOneWidget);

    expect(navigateButtonFinder, findsOneWidget);

    expect(durationTextFinder, findsOneWidget);

    expect(find.byType(AlertDialog), findsOneWidget);

    expect(find.byType(Container), findsNWidgets(4));

    expect(find.byType(Column), findsNWidgets(3));

    expect(find.byType(SizedBox), findsNWidgets(8));

    expect(find.byType(ClipRRect), findsOneWidget);

    expect(find.byType(SvgPicture), findsOneWidget);

    expect(find.byType(FancyShimmerCachedImage), findsOneWidget);

    expect(find.byType(VerticalSpace), findsNWidgets(3));

    expect(find.byType(Row), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);

    expect(find.byType(CustomText), findsNWidgets(3));

  });



}