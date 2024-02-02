import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Day time Widget test case', () {
    Widget dayTimeWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return const Scaffold(
              body: DayTimeWidget(
                day: friday,
                startTime: time8,
                endTime: time4,
                type: true,
              ),
            );
          },
        ),
      );
    }

    testWidgets('Day Time Container', (WidgetTester tester) async {
      await tester.pumpWidget(dayTimeWidget());
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
    });
  });
}
