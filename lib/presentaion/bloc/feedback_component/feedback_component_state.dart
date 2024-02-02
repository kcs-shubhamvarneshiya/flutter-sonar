import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../more_screen/feedback_form/feedback_multiselect_dropdown.dart';

part 'feedback_component_state.freezed.dart';

@freezed
class FeedbackComponentState with _$FeedbackComponentState {
  const factory FeedbackComponentState(
          {required String selectedValue,
          required bool checkState,
          required int checkedIndex,
          required List<Option> optionList,
          required List<MultiSelectItem<Option>> optionItemList}) =

      _FeedbackComponentState;

  factory FeedbackComponentState.loaded() => const FeedbackComponentState(
      selectedValue: "",
      checkState: false,
      checkedIndex: 0,
      optionList: [],
      optionItemList: <MultiSelectItem<Option>>[]);
}
