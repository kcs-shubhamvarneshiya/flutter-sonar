import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/no_attraction.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  testWidgets('NoAttractionScreen displays no attraction image and text',
      (WidgetTester tester) async {
    // Act

    await tester.pumpWidget(
        MaterialApp(home: Sizer(builder: (context, orientation, deviceType) {
      return const NoAttractionScreen();
    })));
    // Assert
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(CustomText), findsOneWidget);
    expect(
      find.text(noAttraction),
      findsOneWidget,
    );
  });
}
