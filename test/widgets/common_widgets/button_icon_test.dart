import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Button Icon test case', () {
    Widget buttonIconWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: ButtonIcon(
                onTap: () {},
                buttonIcon: IconPaths.rightIcon,
                buttonName: '',
                  borderColor:Colors.black
              ),
            );
          },
        ),
      );
    }

    testWidgets('Button Icon', (WidgetTester tester) async {
      await tester.pumpWidget(buttonIconWidget());
      expect(find.byType(Directionality), findsWidgets);
    });
  });
}
