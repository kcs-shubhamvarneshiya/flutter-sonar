import 'package:akdmvisitorsapp/common_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  Widget customTextFieldWidget() {
    return MaterialApp(
      home: Sizer(
        builder: (context, orientation, deviceType) {
          return const Material(child: CustomTextField());
        },
      ),
    );
  }

  testWidgets('Custom Text Field', (WidgetTester tester) async {
    await tester.pumpWidget(customTextFieldWidget());
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(TextFormField), findsWidgets);
  });
  //entered text
  testWidgets('Enter text in text field', (tester) async {
    await tester.pumpWidget(customTextFieldWidget());
    await tester.enterText(find.byType(CustomTextField), 'Custom TextField Widget');
    expect(find.text('Custom TextField Widget'), findsOneWidget);
  });
}
