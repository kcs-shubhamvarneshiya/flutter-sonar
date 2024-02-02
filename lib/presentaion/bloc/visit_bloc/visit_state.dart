
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/attraction/attraction.dart';

part 'visit_state.freezed.dart';

@freezed
class VisitState with _$VisitState {
  const factory VisitState({
    required List<Attraction> attractionList,
    required List<Attraction> attractionAddList,
    required int totalHours,
    required List<Attraction> mainAttractionList,
    required bool isFiltering,
    required bool isExist}) = _VisitState;

  factory VisitState.loaded() => const VisitState(
      attractionList: [],
      attractionAddList:[],
      totalHours:0,
      mainAttractionList:[],
      isFiltering: false,
      isExist: false);
}
