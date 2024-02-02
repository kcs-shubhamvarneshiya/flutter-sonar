import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Icon Container Widget case', () {
    Widget iconContainerWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: IconContainer(
                onTap: () {},
                imageName: IconPaths.leftDoubleIcon,
              ),
            );
          },
        ),
      );
    }

    testWidgets('Icon Container', (WidgetTester tester) async {
      await tester.pumpWidget(iconContainerWidget());
      expect(find.byType(GestureDetector), findsWidgets);
      expect(find.byType(Container), findsWidgets);
    });
    testWidgets('Click on Icon', (WidgetTester tester) async {
      await tester.pumpWidget(iconContainerWidget());
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
    });
  });
}
