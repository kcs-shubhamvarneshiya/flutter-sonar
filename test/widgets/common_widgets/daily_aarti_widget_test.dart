import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Daily Aarti Widget test case', () {
    Widget dailyAartiWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return const Scaffold(
              body: DailyAartiWidget(),
            );
          },
        ),
      );
    }

    testWidgets('Daily Arti Container', (WidgetTester tester) async {
      await tester.pumpWidget(dailyAartiWidget());
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(VerticalSpace), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
    });
  });
}
