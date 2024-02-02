import 'package:akdmvisitorsapp/common_widgets/custom_dialog.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  Widget customAlertDialogWidget() {
    return MaterialApp(
      home: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            body: CustomDialog(
              title: '',
              description: '',
              onTap: () {},
              onTapNo: (){},
            ),
          );
        },
      ),
    );
  }

  testWidgets('Custom Alert Dialog', (WidgetTester tester) async {
    await tester.pumpWidget(customAlertDialogWidget());
    expect(find.byType(AlertDialog), findsWidgets);
    expect(find.byType(CustomText), findsWidgets);
    expect(find.byType(SingleChildScrollView), findsWidgets);
    expect(find.byType(ListBody), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(ButtonIcon), findsWidgets);
  });

  testWidgets('Click on button if its not video btn', (widgetTester) async {
    await widgetTester.pumpWidget(customAlertDialogWidget());
    final Finder buttonToTap = find.byKey(const Key('isVideoNotButton'));

    await widgetTester.dragUntilVisible(
      buttonToTap,
      find.byType(Row),
      const Offset(0, 50),
    );
    await widgetTester.tap(buttonToTap);
    await widgetTester.pump();
  });
}
