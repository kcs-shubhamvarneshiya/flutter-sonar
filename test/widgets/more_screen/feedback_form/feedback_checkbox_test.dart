import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/feedback/feedback_form.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/feedback_component/feedback_component_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<FeedbackComponentBloc>(FeedbackComponentBloc());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupGetIt();

  late FeedbackComponentBloc feedbackComponentBloc;

  setUp((){
    feedbackComponentBloc = FeedbackComponentBloc();
  });

  group('Test case for Checkbox', () {
    Widget checkboxWidget() {
      return MultiBlocProvider(
      providers: [
        BlocProvider<FeedbackComponentBloc>(create: (context) => feedbackComponentBloc),
      ],
        child: MaterialApp(
          home: Material( 
            child: Sizer(
              builder: (context, orientation, deviceType) {
                return FeedbackCheckbox(
                  fields: Fields(
                      fieldName: '',
                      required: false,
                      options: [
                        FeedbackOptions(key: 'key1', value: 'Value 1', isChecked: false),
                        FeedbackOptions(key: 'key2', value: 'Value 2', isChecked: true),
                      ],
                      fieldType: '',
                      answer: ''),
                      press: (List<String> selectedValues) {},
                      isRequired: true,
                );

              },
            ),
          ),
        ),
      );
    }

    testWidgets("FeedbackCheckBox widget onChanged works", (WidgetTester tester) async {
          await tester.pumpWidget(checkboxWidget());

          await tester.pump();

          expect(find.byType(FeedbackCheckbox), findsOneWidget);

          expect(find.byType(Column), findsNWidgets(3));

          expect(find.byType(Row), findsOneWidget);

          expect(find.byType(CustomText), findsNWidgets(4));

          expect(find.byType(HorizontalSpace), findsOneWidget);

          expect(find.byType(VerticalSpace),  findsNWidgets(3));

          expect(find.byType(CheckboxListTile),  findsNWidgets(2));

          expect(find.byKey(const ValueKey('originColumn')), findsOneWidget);

          expect(find.byKey(const ValueKey('originRow')), findsOneWidget);

          expect(find.byKey(const Key('fieldName')), findsOneWidget);

          expect(find.byKey(const Key('fieldName')), findsOneWidget);

          expect(find.byKey(const Key('isRequired')), findsOneWidget);

          expect(find.byKey(const Key('formFieldColumn')), findsOneWidget);
        });
  });

}
