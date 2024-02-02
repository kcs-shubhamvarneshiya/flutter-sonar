import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/photo_content.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Photo content widget test case', () {
    Widget photoContentWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: PhotoContent(
                index: 1,
                imageName: IconPaths.introImageTwo,
                buttonText: 'Next',
                controller: PageController(),
                primaryText: '',
                secondaryText: '',
              ),
            );
          },
        ),
      );
    }

    testWidgets('Photo Contents', (WidgetTester tester) async {
      final controller =PageController();

      await tester.pumpWidget(photoContentWidget());

      await tester.pump();

      expect(find.byType(PhotoContent), findsWidgets);

      expect(find.byType(Scaffold), findsWidgets);

      expect(find.byType(Stack), findsWidgets);

      expect(find.byType(Align), findsWidgets);

      expect(find.byType(Container), findsWidgets);

      expect(find.byType(Column), findsWidgets);

      expect(find.byType(Positioned), findsWidgets);

      expect(find.byType(CustomText), findsWidgets);

      expect(find.byType(Padding), findsWidgets);

      expect(find.byType(VerticalSpace), findsWidgets);

      expect(find.byType(Image), findsWidgets);

      expect(find.byType(Positioned), findsWidgets);

      expect(find.byType(Directionality), findsWidgets);

      expect(find.byType(Padding), findsNWidgets(4));

      // Find the buttons in your widget
      final buttonNext = find.widgetWithText(CustomText, 'Next');

      // Simulate a tap on button next
      await tester.tap(buttonNext);

      await tester.pump();

      controller.jumpToPage(1);

    });

  });
}
