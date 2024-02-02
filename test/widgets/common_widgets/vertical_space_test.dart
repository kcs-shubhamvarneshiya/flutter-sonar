import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Vertical space test case', () {
    Widget verticalSpaceWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: VerticalSpace(height: 10.sp),
            );
          },
        ),
      );
    }

    testWidgets('Horizontal', (WidgetTester tester) async {
      await tester.pumpWidget(verticalSpaceWidget());
      expect(find.byType(SizedBox), findsWidgets);
    });
  });
}
