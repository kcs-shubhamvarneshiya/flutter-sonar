import 'package:akdmvisitorsapp/common_widgets/custom_header.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  Widget customHeader() {
    return MaterialApp(
      home: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            body: CustomHeader(
              title: "", redirectToHome: false,
            ),
          );
        },
      ),
    );
  }

  testWidgets('Custom header', (WidgetTester tester) async {
    await tester.pumpWidget(customHeader());
    expect(find.byType(InkWell), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(CustomText), findsWidgets);
  });
  testWidgets('Click on widget go to previous screen', (widgetTester) async {
    await widgetTester.pumpWidget(customHeader());
    await widgetTester.tap(find.byType(InkWell));
    await widgetTester.pump();
  });
  testWidgets('Click on back icon go to previous screen', (widgetTester) async {
    await widgetTester.pumpWidget(customHeader());
    final Finder buttonToTap = find.byKey(const Key('back_screen'));
    await widgetTester.dragUntilVisible(buttonToTap, find.byType(Row), const Offset(0, 50),);
    await widgetTester.tap(buttonToTap);
    await widgetTester.pump();
  });
}
