import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Widget Container  case', () {
    Widget widgetContainerWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: WidgetContainer(
                color: ColorPath.primaryColor,
                widget: Container(),
              ),
            );
          },
        ),
      );
    }

    testWidgets('Widget Container', (WidgetTester tester) async {
      await tester.pumpWidget(widgetContainerWidget());
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Center), findsWidgets);
    });
  });
}
