import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_textfield.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_textarea.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  //for empty text-field
  TextEditingController controller = TextEditingController();
  String? emptyTextFieldValidator(String value) {
    if (value.isEmpty) return requiredField;
    return null;
  }

  group('Test case for Feedback Text box and Text area', () {
    Widget textField() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Material(
              child: FeedbackTextArea(
                  controller: controller,
                  fieldName: '',
                  hintText: '',
                  isRequired: true),
            );
          },
        ),
      );
    }

    testWidgets('Textarea widget', (tester) async {
      await tester.pumpWidget(textField());

      expect(find.byType(Column), findsOneWidget);

      expect(find.byType(Row), findsOneWidget);

      expect(find.byType(HorizontalSpace), findsOneWidget);

      expect(find.byType(CustomTextField), findsOneWidget);
    });

    //entered text
    testWidgets('Not empty text field', (tester) async {
      await tester.pumpWidget(textField());

      await tester.enterText(find.byType(CustomTextField), 'hi');

      expect(find.text('hi'), findsOneWidget);
    });

    //empty text
    testWidgets('Empty text field', (tester) async {
      await tester.pumpWidget(textField());

      var result = emptyTextFieldValidator('');

      expect(result, requiredField);
    });

  });
}
