import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../more_screen/feedback_form/feedback_multiselect_dropdown.dart';
import 'feedback_component_event.dart';
import 'feedback_component_state.dart';

@injectable
class FeedbackComponentBloc extends Bloc<FeedbackComponentEvent, FeedbackComponentState> {

  FeedbackComponentBloc() : super(FeedbackComponentState.loaded()) {
    on<FeedbackOnChangeRadioEvent>(feedbackRadioEvent);
    on<FeedbackOnChangeCheckBoxEvent>(feedbackCheckboxEvent);
    on<FeedbackOptionListEvent>(feedbackOptionListEvent);
    on<FeedbackOptionItemEvent>(feedbackOptionItemEvent);
  }

  feedbackRadioEvent(FeedbackOnChangeRadioEvent event, emit) async {
    emit(state.copyWith(selectedValue: event.selectedValue.toString()));
  }

  feedbackCheckboxEvent(FeedbackOnChangeCheckBoxEvent event, emit) async {
    emit(state.copyWith(checkState: event.checkValue,checkedIndex:event.index));
  }

  feedbackOptionListEvent(FeedbackOptionListEvent event, emit) async {
    emit(state.copyWith(optionList: event.optionList));
  }

  feedbackOptionItemEvent(FeedbackOptionItemEvent event, emit) async {
    List<Option> optionItem = [];
    for(var option in event.optionItemList){
      optionItem.add(Option(key: option.key.toString(), value: option.value.toString()));
    }
    var optionList = optionItem.map((optionItem) => MultiSelectItem<Option>(optionItem, optionItem.value)).toList();
    emit(state.copyWith(optionItemList: optionList));
  }
}