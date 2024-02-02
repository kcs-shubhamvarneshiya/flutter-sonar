import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/visits_container.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/presentaion/visit/request_group_tour.dart';
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

  group('Request group tour', () {
    // visit container widget
    Widget requestGroupTourWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return const RequestGroupTour();
          },
        ),
      );
    }

    testWidgets('render text and button name', (WidgetTester tester) async {
      await tester.pumpWidget(requestGroupTourWidget());
      var groupTourHeading = find.text(groupTour.toUpperCase());
      var groupTourTitle = find.text(groupVisits);
      var groupTourSubText = find.text(groupTourDesc);
      var buttonText = find.text(request);
      expect(groupTourHeading, findsOneWidget);
      expect(groupTourTitle, findsOneWidget);
      expect(groupTourSubText, findsOneWidget);
      expect(buttonText, findsOneWidget);
    });

    test('to render specific image in intro ', () {
      var path = IconPaths.placeholderImage;
      final exists = getProjectFile(path).existsSync();
      expect(exists, isTrue, reason: '$path does not exist');
    });

    // book a tour widget test case
    testWidgets('Request group tour widget', (WidgetTester tester) async {
      await tester.pumpWidget(requestGroupTourWidget());
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(VerticalSpace), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(VisitsContainer), findsWidgets);
      expect(find.byType(VerticalSpace), findsWidgets);
    });
    testWidgets('View more and my tour button', (widgetTester) async {
      await widgetTester.pumpWidget(requestGroupTourWidget());
      final Finder tapRequestBtn = find.byKey(const Key('request_group_tour'));
      await widgetTester.dragUntilVisible(
        tapRequestBtn,
        find.byType(VisitsContainer),
        const Offset(0, 50),
      );
      await widgetTester.tap(tapRequestBtn);
      await widgetTester.pump();
    });
  });
}
