import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/feedback/feedback_form.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/feedback_component/feedback_component_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_radio_btn.dart';
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

  setUp(() {
    feedbackComponentBloc = FeedbackComponentBloc();
  });

  group('Test case for Radio Button ', () {
    Widget radioButtonWidget() {
      return MultiBlocProvider(
        providers: [
          BlocProvider<FeedbackComponentBloc>(
              create: (context) => feedbackComponentBloc),
        ],

        child: MaterialApp(
          home: Material(
            child: Sizer(
              builder: (context, orientation, deviceType) {
                return FeedbackRadio(
                  fields: Fields(
                      fieldName: '',
                      required: false,
                      options: [
                        FeedbackOptions(key: 'key1', value: 'Value 1', isChecked: true),
                        FeedbackOptions(key: 'key2', value: 'Value 2', isChecked: false),
                      ],
                      fieldType: '',
                      answer: ''),
                  press: (String? selectedValue) {
                    return "Value 1";
                  },
                );
              },
            ),
          ),
        ),
      );
    }

    testWidgets('it behaves the same as tapping the text', (tester) async {
      await tester.pumpWidget(radioButtonWidget());

      await tester.pump();

      expect(find.byType(FeedbackRadio), findsOneWidget);

      expect(find.byType(Column), findsNWidgets(2));

      expect(find.byType(Row), findsOneWidget);

      expect(find.byType(CustomText), findsNWidgets(4));

      expect(find.byType(HorizontalSpace), findsOneWidget);

      expect(find.byType(VerticalSpace), findsNWidgets(2));

      expect(find.byType(SizedBox), findsNWidgets(6));

      expect(find.byType(Expanded), findsOneWidget);

      expect(find.byKey(const Key('originVerticalSpace')), findsOneWidget);

    });
  });
}
