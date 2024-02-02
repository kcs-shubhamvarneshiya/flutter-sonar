import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/webview_message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Web view message screen test case', () {
    Widget webViewMessageWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: WebViewMessageScreen(
                onTap: () {},
                description: '',
              ),
            );
          },
        ),
      );
    }

    testWidgets('Web view message screen', (WidgetTester tester) async {
      await tester.pumpWidget(webViewMessageWidget());
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Align), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(ElevatedButton), findsWidgets);
    });
    testWidgets('Click on button', (WidgetTester tester) async {
      await tester.pumpWidget(webViewMessageWidget());
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
    });
  });
}
