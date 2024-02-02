import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/custome_page.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Test case for Custom Page', () {
    Widget customPageWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Material(
              child: CustomPage(
                imageName: IconPaths.somethingWrongIcon,
                description: templeDescription,
                onTap: () {},
              ),
            );
          },
        ),
      );
    }

    testWidgets('Custom Page', (WidgetTester tester) async {
      await tester.pumpWidget(customPageWidget());
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Center), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
    });
    testWidgets('Click on back icon go to previous screen', (widgetTester) async {
      await widgetTester.pumpWidget(customPageWidget());
      final Finder buttonToTap = find.byType(RoundedBorderButton);
      await widgetTester.dragUntilVisible(
        buttonToTap,
        find.byType(Row),
        const Offset(0, 50),
      );
      await widgetTester.tap(buttonToTap);
      await widgetTester.pump();
    });
    testWidgets('Click on button go to next screen', (widgetTester) async {
      await widgetTester.pumpWidget(customPageWidget());
      await widgetTester.tap(find.byType(RoundedBorderButton));
      await widgetTester.pump();
    });
  });
}
