import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/attraction/attraction.dart';

part 'attraction_state.freezed.dart';

@freezed
class AttractionState with _$AttractionState {
  const factory AttractionState({required bool checked, int? currentIndex,String? value,required List<Attraction> attractionList,required Set<String?> attractionTypeList,required bool isFiltering}) = _AttractionState;

  factory AttractionState.checkedState() => const AttractionState(checked: false,currentIndex: 0,value: "",attractionList:[],attractionTypeList:<String?>{}, isFiltering: false);
}