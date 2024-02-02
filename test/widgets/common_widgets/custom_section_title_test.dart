import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  Widget customTitleWidget() {
    return MaterialApp(
      home: Sizer(
        builder: (context, orientation, deviceType) {
          return const CustomSectionTitle(
            text: '',
          );
        },
      ),
    );
  }

  testWidgets('Custom Section Title', (WidgetTester tester) async {
    await tester.pumpWidget(customTitleWidget());
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Text), findsWidgets);
  });
}
