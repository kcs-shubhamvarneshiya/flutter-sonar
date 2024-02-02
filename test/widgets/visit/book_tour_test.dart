import 'dart:io';

import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/visits_container.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/presentaion/visit/book_tour.dart';
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

  group('Customize visit plan', () {
    // visit container widget
    Widget bookTourWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return const BookTour();
          },
        ),
      );
    }

    test('to render specific image in intro ', () {
      var path = IconPaths.placeholderImage;
      final exists = getProjectFile(path).existsSync();
      expect(exists, isTrue, reason: '$path does not exist');
    });

    // book a tour widget test case
    testWidgets('Book a tour ', (WidgetTester tester) async {
      await tester.pumpWidget(bookTourWidget());
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(VerticalSpace), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(VisitsContainer), findsWidgets);
    });
    testWidgets('click book now button for book tour widget',
        (widgetTester) async {
      await widgetTester.pumpWidget(bookTourWidget());
      final Finder tapBookNowBtn = find.byKey(const Key('book_tour_container'));
      await widgetTester.dragUntilVisible(
          tapBookNowBtn, find.byType(VisitsContainer), const Offset(0, 50));
      await widgetTester.tap(tapBookNowBtn);
      await widgetTester.pump();
    });
    testWidgets('render text and button name', (WidgetTester tester) async {
      await tester.pumpWidget(bookTourWidget());
      var heading = find.text(bookTour.toUpperCase());
      var title = find.text(mandirTour);
      var description = find.text(mandirTourDesc);
      var subText = find.text(bookTickets);
      expect(heading, findsOneWidget);
      expect(title, findsOneWidget);
      expect(description, findsOneWidget);
      expect(subText, findsOneWidget);
    });
  });
}
