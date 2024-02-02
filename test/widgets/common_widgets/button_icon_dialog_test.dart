import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Rounded Border Button test case', () {
    Widget buttonIconDialogWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: ButtonIconDialog(
                onTap: () {},
                buttonIcon: IconPaths.rightIcon,
                buttonName: '',
              ),
            );
          },
        ),
      );
    }

    testWidgets('Rounded Border Button ', (WidgetTester tester) async {
      await tester.pumpWidget(buttonIconDialogWidget());
      expect(find.byType(Directionality), findsWidgets);
    });
  });
}
