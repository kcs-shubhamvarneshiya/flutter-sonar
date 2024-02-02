import 'package:akdmvisitorsapp/common_widgets/attractionType_tab.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  int tappedIndex = -1;
  Widget attractionTypeTabWidget(Set<String> imageListData) {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(
          builder: (context, orientation, deviceType) {
            return AttractionTypeTab(
              imageListData,
              1,(index) {
              tappedIndex = index;
            },
            );
          },
        ),
      ),
    );
  }

  testWidgets('AttractionTypeTab widget test', (WidgetTester tester) async {
    Set<String> imageListData = {'Attraction 1', 'Attraction 2', 'Attraction 3'};
    // Build our widget and trigger a frame.
    await tester.pumpWidget(attractionTypeTabWidget(imageListData));

    // Verify the initial state of the widget
    expect(find.byType(TabBar), findsOneWidget);

    expect(find.byType(Tab), findsNWidgets(imageListData.length));

    expect(find.text('Attraction 1'), findsOneWidget);

    expect(find.text('Attraction 2'), findsOneWidget);

    expect(find.text('Attraction 3'), findsOneWidget);

    final tabLabels = find.byType(CustomText);

    expect(tabLabels, findsNWidgets(imageListData.length));

    expect(imageListData.first.toString(), "Attraction 1");

    expect(imageListData.last.toString(), "Attraction 3");

    // Tap on the first tab
    await tester.tap(find.text('Attraction 1'));
    await tester.pump();
    expect(tappedIndex, equals(0));

    // Tap on the second tab
    await tester.tap(find.text('Attraction 2'));
    await tester.pump();
    expect(tappedIndex, equals(1));

  });
}