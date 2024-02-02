import 'package:freezed_annotation/freezed_annotation.dart';

part 'attraction_change_event.freezed.dart';

@freezed
class AttractionChangeEvent with _$AttractionChangeEvent {
 factory AttractionChangeEvent.tap(bool checked,int index,String value,bool isListScreen) = AttractionChangeEventData;
}