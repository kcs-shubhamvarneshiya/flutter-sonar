import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Horizontal space test case', () {
    Widget horizontalSpaceWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: HorizontalSpace(width: 10.sp),
            );
          },
        ),
      );
    }

    testWidgets('Horizontal', (WidgetTester tester) async {
      await tester.pumpWidget(horizontalSpaceWidget());
      expect(find.byType(SizedBox), findsWidgets);
    });
  });
}
