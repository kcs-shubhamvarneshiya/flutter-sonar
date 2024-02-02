import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/feedback/feedback_form.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/feedback_component/feedback_component_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/feedback_component/feedback_component_event.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_multiselect_dropdown.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:sizer/sizer.dart';

GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<FeedbackComponentBloc>(FeedbackComponentBloc());
}

void main() {
   String? emptyDropdownValidator(String value) {
    if (value.isEmpty) return requiredField;
    return null;
  }

   TestWidgetsFlutterBinding.ensureInitialized();

   setupGetIt();

   late FeedbackComponentBloc feedbackComponentBloc;

   List<String> optionList = [];
   var fields=Fields(
       fieldName: '',
       required: false,
       options: [
         FeedbackOptions(key: 'key1', value: 'Value 1', isChecked: false),
         FeedbackOptions(key: 'key2', value: 'Value 2', isChecked: false),
       ],
       fieldType: '',
       answer: '');

    for(var option in fields.options!){
      optionList.add(option.value.toString());
    }

   setUp((){
     feedbackComponentBloc = FeedbackComponentBloc();
     feedbackComponentBloc.add(FeedbackOptionItemEvent(fields.options!));
   });

   //test case
  group('Test Case for dropdown', () {
    // Multi select Dropdown Widget
    Widget dropdownWidget() {
      return MultiBlocProvider(
        providers: [
          BlocProvider<FeedbackComponentBloc>(create: (context) => feedbackComponentBloc),
        ],
        child: MaterialApp(
          home: Material(
            child: Sizer(
              builder: (context, orientation, deviceType) {
                return FeedbackMultiselectDropdown(
                  getCheckedValue:(List<String> selectedValues)=>optionList,
                  fields: Fields(
                      fieldName: '',
                      required: false,
                      options: [
                        FeedbackOptions(key: 'key1', value: 'Value 1', isChecked: false),
                        FeedbackOptions(key: 'key2', value: 'Value 2', isChecked: false),
                      ],
                      fieldType: '',
                      answer: ''),
                );
              },
            ),
          ),
        ),
      );
    }

    testWidgets('Multiselect dropdown widget', (tester) async {
      await tester.pumpWidget(dropdownWidget());

      await tester.pump();

      expect(find.byType(FeedbackMultiselectDropdown), findsOneWidget);

      expect(find.byType(Column),  findsNWidgets(2));

      expect(find.byType(Row), findsNWidgets(2));

      expect(find.byType(CustomText), findsNWidgets(2));

      expect(find.byType(HorizontalSpace), findsOneWidget);

      expect(find.byType(VerticalSpace), findsNWidgets(2));

      expect(find.byType(Icon), findsWidgets);

      expect(find.byKey(const Key('originColumn')), findsOneWidget);

      expect(find.byKey(const Key('originRow')), findsOneWidget);

      expect(find.byKey(const Key('fieldName')), findsOneWidget);

      expect(find.byKey(const Key('isRequired')), findsOneWidget);

    });


    test('Empty MultiSelectDropdown Field', () {
      String? result = emptyDropdownValidator('');
      expect(result, requiredField);
    });

  });
}
