import 'package:akdmvisitorsapp/common_widgets/alert_dialogue.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('AlertDialogWidget shows dialog', (WidgetTester tester) async {
    // Create a PageController for testing.
    final controller = PageController();

    // Define test variables.
    const title = 'Test Title';
    const description = 'Test Description';
    bool yesPressed = false;
    bool noPressed = false;

    // Build the AlertDialogWidget.
    await tester.pumpWidget(
      MaterialApp(
        home: AlertDialogWidget(
          title: title,
          description: description,
          index: 0,
          controller: controller,
          onYesPressed: () {
            yesPressed = true;
          },
          onNoPressed: () {
            noPressed = true;
          },
        ),
      ),
    );

    // Trigger the dialog by pumping frames.
    await tester.pumpAndSettle();

    expect(find.byType(TextButton), findsWidgets);

    expect(find.byType(CustomText), findsWidgets);

    expect(find.byType(SingleChildScrollView), findsWidgets);

    expect(find.byType(ListBody), findsWidgets);

    expect(find.byType(IosAlert), findsWidgets);

    expect(find.byType(SizedBox), findsWidgets);

    // Find the AlertDialog's title and description widgets.
    final titleFinder = find.text(title);
    final descriptionFinder = find.text(description);

    // Verify that the title and description are displayed.
    expect(titleFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);

    // Tap the "Yes" button.
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();

    // Verify that the "Yes" button press works.
    expect(yesPressed, true);

    // Tap the "No" button.
    await tester.tap(find.text('No'));
    await tester.pumpAndSettle();

    // Verify that the "No" button press works.
    expect(noPressed, true);
  });
}