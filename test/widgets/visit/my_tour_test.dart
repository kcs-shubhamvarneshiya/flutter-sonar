import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/presentaion/visit/my_tour.dart';
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

  group('My tour Widget', () {
    // visit container widget
    Widget myTourWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return const MyTour();
          },
        ),
      );
    }

    testWidgets('render text and button name', (WidgetTester tester) async {
      await tester.pumpWidget(myTourWidget());
      var containerDesc = find.text(tourTime);
      var buttonText = find.text(viewTour);
      expect(containerDesc, findsOneWidget);
      expect(buttonText, findsOneWidget);
    });

    test('to render specific image in intro ', () {
      var path = IconPaths.placeholderImage;
      final exists = getProjectFile(path).existsSync();
      expect(exists, isTrue, reason: '$path does not exist');
    });

    // book a tour widget test case
    testWidgets('My tour ', (WidgetTester tester) async {
      await tester.pumpWidget(myTourWidget());
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(VerticalSpace), findsWidgets);
    });
    //view more tours and my tour buttons
    testWidgets('View more and my tour button', (widgetTester) async {
      await widgetTester.pumpWidget(myTourWidget());
      final Finder buttonToTap = find.byKey(const Key('more_tours'));
      await widgetTester.dragUntilVisible(
        buttonToTap,
        find.byType(Row),
        const Offset(0, 50),
      );
      await widgetTester.tap(buttonToTap);
      await widgetTester.pump();
      await widgetTester.tap(find.byType(ButtonIcon));
      await widgetTester.pump();
    });
  });
}
