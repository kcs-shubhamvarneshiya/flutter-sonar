import 'package:akdmvisitorsapp/common_widgets/dashed_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DashedPageIndicator', () {
    testWidgets('should render the correct number of dots',
        (WidgetTester tester) async {
      const count = 5;
      const activeIndex = 2;
      const dotColor = Colors.grey;
      const activeDotColor = Colors.blue;

      await tester.pumpWidget(
          MaterialApp(home:
          Sizer(builder: (context, orientation, deviceType) {
        return DashedPageIndicator(
          count: count,
          activeIndex: activeIndex,
          dotColor: dotColor,
          activeDotColor: activeDotColor,
        );
      })));

      expect(find.byType(Container), findsNWidgets(5));
    });

    testWidgets('should render the correct color for active and inactive dots',
        (WidgetTester tester) async {
      const count = 5;
      const activeIndex = 2;
      const dotColor = Colors.grey;
      const activeDotColor = Colors.blue;

      await tester.pumpWidget(
          MaterialApp(home:
          Sizer(builder: (context, orientation, deviceType) {
            return DashedPageIndicator(
              count: count,
              activeIndex: activeIndex,
              dotColor: dotColor,
              activeDotColor: activeDotColor,
            );
          }))
      );

      final activeDotFinder = find.byWidgetPredicate((widget) =>
          (widget is Container) && (widget.color == activeDotColor));

      expect(activeDotFinder, findsOneWidget);

      final inactiveDotFinders = find.byWidgetPredicate(
          (widget) => (widget is Container) && (widget.color == dotColor));

      expect(inactiveDotFinders, findsNWidgets(count - 1));
    });
  });
}
