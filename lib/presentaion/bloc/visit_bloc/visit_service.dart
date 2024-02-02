import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../model/app_json/app_json.dart';
import '../../../model/attraction/attraction.dart';
import '../../../repository/app_json_repository.dart';
import '../../../utils/strings.dart';

abstract class VisitService {
  Future<List<Attraction>> getAttractionList();
  Future<List<Attraction>> getFilterAttractionList();
}

@Injectable(as: VisitService)
class VisitServiceImpl implements VisitService {
  SharedPreferences? sharedPreferences;
  AppJsonRepository appJsonRepository;
  VisitServiceImpl(this.appJsonRepository):sharedPreferences=getIt<SharedPreferences>();

  @override
  Future<List<Attraction>> getAttractionList() async {
    List<Attraction> attractionLst=[];
    List? listString = sharedPreferences?.getStringList(keyAttractionListForPlanPref);
    if(listString!=null){
      List<Attraction> attractionLst = listString
          .map((item) => Attraction.fromJson(json.decode(item)))
          .toList();
      attractionLst.sort((a, b) {
        var aEL = a.displayOrder?.visitPlanner;
        var bEL = b.displayOrder?.visitPlanner;
        return (aEL ?? 0).compareTo((bEL ?? 0));
      });
      return attractionLst;
    }else{
      return attractionLst;
    }
  }

  @override
  Future<List<Attraction>> getFilterAttractionList() async {
    List<Attraction> filteredUpdatedList=[];
    AppJsonModel appJsonData = await appJsonRepository.loadJsonAssetData();
    List<Attraction> attractionList= await getAttractionList();
    appJsonData.attractions?.removeWhere((element) => element.displayOrder?.visitPlanner == null);
    appJsonData.attractions?.sort((a,b){
      var aEL = a.displayOrder?.visitPlanner;
      var bEL = b.displayOrder?.visitPlanner;
      return (aEL ?? 0).compareTo((bEL ?? 0));
    });
    if(appJsonData.attractions!=null){
      filteredUpdatedList = appJsonData.attractions!.where((element){
        return !attractionList.map((item) => item.id).contains(element.id);
      }).toList();
      return filteredUpdatedList;
    }else{
      return filteredUpdatedList;
    }
  }

}
