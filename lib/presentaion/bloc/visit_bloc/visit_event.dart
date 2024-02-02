
import 'package:flutter/src/widgets/framework.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/attraction/attraction.dart';

part 'visit_event.freezed.dart';

@freezed
class VisitEvent with _$VisitEvent{
  const factory VisitEvent.loadVisitEvent() = VisitLoadEvent;
  const factory VisitEvent.loadVisitActivityEvent() = VisitActivityLoadEvent;
  const factory VisitEvent.addActivityEvent(Attraction attractionItem,bool isVisit, BuildContext context) = VisitAddActivityEvent;
  const factory VisitEvent.removeVisitItemEvent(int attractionId) = VisitRemoveItemEvent;
  const factory VisitEvent.removeAllVisitEvent() =VisitRemoveAllEvent;

}
