import 'package:akdmvisitorsapp/presentaion/more_screen/more_section.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('More section container', () {
    int? tappedIndex;
    int mockIndex = 0;
    //Create a function to be called when onTap is triggered
    void mockOnTap() {
      tappedIndex = mockIndex;
    }
    Widget listOfData() {
      return MaterialApp(
        home: Material(
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return MoreSections(
                appData: aboutUs,
                icon: const Icon(Icons.add), // Mock icon
                onTap: mockOnTap, // Assign the mock onTap function
                index: mockIndex,
              );
            },
          ),
        ),
      );
    }

    testWidgets('Listview item verify', (WidgetTester tester) async {
      await tester.pumpWidget(listOfData());
      MoreSections item = tester
          .widgetList<MoreSections>(find.byType(MoreSections))
          .elementAt(0);
      String data = item.appData;
      expect(aboutUs, data);
    });

    testWidgets('Click on button', (WidgetTester tester) async {
      await tester.pumpWidget(listOfData());

      await tester.tap(find.byKey(const ValueKey('go_page')));

      await tester.pump();

      expect(find.text('Sample Data'), findsOneWidget);

      expect(find.byType(SvgPicture), findsOneWidget);

      await tester.tap(find.byType(MoreSections));

      await tester.pump();

      expect(tappedIndex, mockIndex);
    });

  });
}
