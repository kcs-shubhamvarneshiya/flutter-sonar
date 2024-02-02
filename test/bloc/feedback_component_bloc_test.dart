import 'package:akdmvisitorsapp/model/feedback/feedback_form.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/feedback_component/feedback_component_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/feedback_component/feedback_component_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/feedback_component/feedback_component_state.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_multiselect_dropdown.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('FeedbackComponentBloc', () {
    late FeedbackComponentBloc feedbackComponentBloc;

    setUp(() {
      feedbackComponentBloc = FeedbackComponentBloc();
    });

    test('initial state is FeedbackComponentState.loaded()', () {
      expect(feedbackComponentBloc.state, FeedbackComponentState.loaded());
    });

    blocTest<FeedbackComponentBloc, FeedbackComponentState>(
      'emits the expected state when FeedbackOnChangeRadioEvent is added',
      build: () => feedbackComponentBloc,
      act: (bloc) {
        bloc.add(const FeedbackOnChangeRadioEvent('Male'));
      },
      expect: () => [
        const FeedbackComponentState(selectedValue: 'Male', checkState: false, checkedIndex: 0,optionItemList: [],optionList: []),
      ],
    );

    blocTest<FeedbackComponentBloc, FeedbackComponentState>(
      'emits the expected state when FeedbackOnChangeCheckBoxEvent is added',
      build: () => feedbackComponentBloc,
      act: (bloc) {
        bloc.add(const FeedbackOnChangeCheckBoxEvent(true,0));
      },
      expect: () => [
        const FeedbackComponentState(selectedValue: '', checkState: true, checkedIndex: 0,optionItemList: [],optionList: []),
      ],
    );


    List<Option> optionList = [];
    optionList.add(Option(key: "keyOne", value: "Option1"));
    optionList.add(Option(key: "keyTwo", value: "Option2"));

    blocTest<FeedbackComponentBloc, FeedbackComponentState>(
      'emits the expected state when FeedbackOptionListEvent is added',
      build: () => feedbackComponentBloc,
      act: (bloc) {
        bloc.add(FeedbackOptionListEvent(optionList.toList()));
      },
      expect: () => [
        FeedbackComponentState(selectedValue: '', checkState: false, checkedIndex: 0,optionItemList: [],optionList: optionList),
      ],
    );


    List<MultiSelectItem<Option>> optionItemList = optionList.map((optionItem) => MultiSelectItem<Option>(optionItem, optionItem.value)).toList();

    blocTest<FeedbackComponentBloc, FeedbackComponentState>(
      'emits the expected state when FeedbackOptionItemEvent is added',
      setUp: () {
      },
      build: () => feedbackComponentBloc,
      act: (bloc) {
        List<FeedbackOptions> optionFeedbackItemList = [];
        optionFeedbackItemList.add(FeedbackOptions(key: 'keyOne', value: 'Option1',isChecked: false));
        optionFeedbackItemList.add(FeedbackOptions(key: 'keyTwo', value: 'Option2',isChecked: false));
        bloc.add(FeedbackOptionItemEvent(optionFeedbackItemList.toList()));
      },
      expect: () => [
        FeedbackComponentState(selectedValue: '', checkState: false, checkedIndex: 0, optionItemList:optionItemList.toList(),optionList: []),
      ],
    );
  });


}