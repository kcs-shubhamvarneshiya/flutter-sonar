import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Rounded Border Button test case', () {
    Widget roundedBorderButtonWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: RoundedBorderButton(
                onTap: () {},
                buttonIcon: IconPaths.rightIcon,
                buttonName: '',
              ),
            );
          },
        ),
      );
    }

    testWidgets('Rounded Border Button ', (WidgetTester tester) async {
      await tester.pumpWidget(roundedBorderButtonWidget());
      expect(find.byType(OutlinedButton), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
    });
    testWidgets('Button Pressed', (WidgetTester tester) async {
      await tester.pumpWidget(roundedBorderButtonWidget());
      await tester.tap(find.byType(OutlinedButton));
      await tester.pump();
    });
  });
}
