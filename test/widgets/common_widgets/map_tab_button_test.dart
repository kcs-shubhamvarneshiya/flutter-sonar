import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MapTabButton widget test', (WidgetTester tester) async {
    bool listButtonTapped = false;
    bool mapButtonTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MapTabButton(
            onTapList: () {
              listButtonTapped = true;
            },
            onTapMap: () {
              mapButtonTapped = true;
            },
            isList: false,
            isMap: true,
          ),
        ),
      ),
    );

    // Find the list and map buttons using the GestureDetector widget
    final listButtonFinder = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is Row &&
            widget.children[0] is CustomText &&
            widget.children[1] is HorizontalSpace &&
            widget.children[2] is Expanded,
      ),
    );

    final mapButtonFinder = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.byWidgetPredicate(
        (widget) =>
            widget is Row &&
            widget.children[0] is CustomText &&
            widget.children[1] is HorizontalSpace &&
            widget.children[2] is Expanded,
      ),
    );

    // Tap the list button and trigger the onTapList callback
    await tester.tap(listButtonFinder);
    await tester.pump();

    // Verify that the onTapList callback is triggered
    expect(listButtonTapped, true);

    // Tap the map button and trigger the onTapMap callback
    await tester.tap(mapButtonFinder);
    await tester.pump();

    // Verify that the onTapMap callback is triggered
    expect(mapButtonTapped, true);
  });
}
