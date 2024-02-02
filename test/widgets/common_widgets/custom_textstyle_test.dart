import 'package:akdmvisitorsapp/common_widgets/custom_textstyle.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DefaultTextStyle changes propagate to Text',
      (WidgetTester tester) async {
    TextStyle s1 = CustomTextStyle.customTextStyle(
      FontWeight.w500,
      interFont,
      10,
      ColorPath.primaryColor,
      false,
      0.0,
      0.0
    );

    Text textWidget = Text(
      'Hello',
      textDirection: TextDirection.ltr,
      style: s1,
    );

    await tester.pumpWidget(DefaultTextStyle(
      style: s1,
      child: textWidget,
    ));

    expect(s1, s1);
    Text text = tester.firstWidget(find.byType(Text));
    expect(text, isNotNull);
    expect(textWidget.style, s1);
  });
}
