import 'dart:io';

import 'package:akdmvisitorsapp/common_widgets/bottom_nav.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/visits_container.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/presentaion/visit/find_way.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  group('Finding way around', () {
    // visit container widget
    Widget findingWayWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return const FindingWay();
          },
        ),
      );
    }

    Widget pushMapRouteScreen() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeBottomNav(),
                  ),
                );
              },
              child: CustomText(
                text: viewMore,
                fontSize: 10.sp,
                underline: false,
                fontFamily: interFont,
                fontWeight: FontWeight.w400,
                color: ColorPath.redColor,
              ),
            );
          },
        ),
      );
    }

    testWidgets('open all latest news screen', (tester) async {
      await tester.pumpWidget(pushMapRouteScreen());
      expect(find.byType(GestureDetector), findsOneWidget);
    });
    testWidgets('render text and button name', (WidgetTester tester) async {
      await tester.pumpWidget(findingWayWidget());
      var findingWaySubHeading = find.text(findWayDesc);
      var buttonText = find.text(exploreAttractions);
      expect(findingWaySubHeading, findsOneWidget);
      expect(buttonText, findsOneWidget);
    });

    test('to render specific image in intro ', () {
      var path = IconPaths.placeholderImage;
      final exists = getProjectFile(path).existsSync();
      expect(exists, isTrue, reason: '$path does not exist');
    });

    // book a tour widget test case
    testWidgets('Request group tour ', (WidgetTester tester) async {
      await tester.pumpWidget(findingWayWidget());
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(VerticalSpace), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(VisitsContainer), findsWidgets);
    });
    testWidgets('View more and my tour button', (widgetTester) async {
      await widgetTester.pumpWidget(findingWayWidget());
      final Finder buttonToTap = find.byKey(const Key('finding_way_container'));
      await widgetTester.dragUntilVisible(
        buttonToTap,
        find.byType(VisitsContainer),
        const Offset(0, 50),
      );
      await widgetTester.tap(buttonToTap);
      await widgetTester.pump();
    });
  });
}
