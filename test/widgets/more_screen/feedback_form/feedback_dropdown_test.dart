import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/feedback/feedback_form.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Test Case for dropdown', () {
    // Dropdown Widget
    Widget dropdownWidget() {
      return MaterialApp(
        home: Scaffold(
          body: Sizer(
            builder: (context, orientation, deviceType) {
              return FeedbackDropdown(
                fields: Fields(
                    fieldName: '',
                    options: [
                      FeedbackOptions(key: 'key1', value: 'Value 1', isChecked: false),
                      FeedbackOptions(key: 'key2', value: 'Value 2', isChecked: true),
                    ],
                    fieldType: '',
                    answer: '',
                    required: true),
                press: () {},
              );
            },
          ),
        ),
      );
    }

    testWidgets('Select Dropdown item test', (tester) async {

      await tester.pumpWidget(dropdownWidget());

      await tester.pump();

      expect(find.byType(FeedbackDropdown), findsOneWidget);

      expect(find.byType(Column), findsOneWidget);

      expect(find.byType(CustomText), findsNWidgets(3));

      expect(find.byType(HorizontalSpace), findsOneWidget);

      expect(find.byType(VerticalSpace), findsNWidgets(2));

      expect(find.byType(Row), findsNWidgets(2));

      expect(find.byType(Icon), findsWidgets);

    });

  });
}
