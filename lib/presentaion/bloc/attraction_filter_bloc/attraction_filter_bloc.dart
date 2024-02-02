import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_change_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../model/app_json/app_json.dart';
import '../../../model/attraction/attraction.dart';
import '../../../repository/app_json_repository.dart';
import '../../../utils/strings.dart';

@injectable
class AttractionFilterBloc extends Bloc<AttractionChangeEvent, AttractionState> {
  AppJsonRepository appJsonRepository;

  AttractionFilterBloc(this.appJsonRepository) : super(AttractionState.checkedState()) {
    on<AttractionChangeEvent>(onCheckedChangeEvent);
  }

  onCheckedChangeEvent(AttractionChangeEvent event, emit) async {
    List<Attraction>mAttractionList=[];
    Set<String?> mAttractionTypeList = <String?>{};
    AppJsonModel appJsonData = await appJsonRepository.loadJsonAssetData();
    //mAttractionTypeList.add(allText);
    if(appJsonData.attractions != null){
      appJsonData.attractions?.sort((a, b) =>
          a.attractionType.toString().toLowerCase()
              .compareTo(b.attractionType.toString().toLowerCase()));
      for (var element in  appJsonData.attractions!) {
        mAttractionTypeList.add(element.attractionType.toString());
      }
      mAttractionTypeList.removeWhere((element) => element == "null");
    }
    if(appJsonData.attractions != null &&  appJsonData.attractions!.isNotEmpty){
      if(event.isListScreen){
        appJsonData.attractions?.removeWhere((element) => element.displayOrder?.exploreList == null);
      }
      appJsonData.attractions?.sort((a, b) {
        var aEL = a.displayOrder?.exploreList;
        var bEL = b.displayOrder?.exploreList;
        return (aEL ?? 0).compareTo((bEL ?? 0));
      });

      if(event.value.isNotEmpty){
        mAttractionList.addAll(appJsonData.attractions!.where((i) => i.attractionType==event.value).toList());
      }else{
        mAttractionList.addAll(appJsonData.attractions!.where((i) => i.attractionType==mAttractionTypeList.first.toString()).toList());
      }
    }

    emit(state.copyWith(
        checked: event.checked,value: event.value,currentIndex: event.index,attractionList: mAttractionList,
        isFiltering: !state.isFiltering,attractionTypeList: mAttractionTypeList));

  }
}
