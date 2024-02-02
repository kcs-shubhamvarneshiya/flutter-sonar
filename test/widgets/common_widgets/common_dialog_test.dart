import 'package:akdmvisitorsapp/common_widgets/commonDialog.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Common Alert test case', () {
    Widget commonAlertDialogWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: CommonDialog(
                title: '',
                description: '',
                onTap: () {},
              ),
            );
          },
        ),
      );
    }

    testWidgets('Custom Common Alert', (WidgetTester tester) async {
      await tester.pumpWidget(commonAlertDialogWidget());
      expect(find.byType(AlertDialog), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(ListBody), findsWidgets);
      expect(find.byType(TextButton), findsWidgets);
    });
    testWidgets('Click on button to close the dialog', (widgetTester) async {
      await widgetTester.pumpWidget(commonAlertDialogWidget());
      await widgetTester.tap(find.byType(TextButton));
      await widgetTester.pump();
    });
  });
}
