import 'dart:convert';

import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/utils/preference_utils.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/cupertino.dart';


class MapMarkerProvider with ChangeNotifier {
  List<Attraction> allLocations = [];
  List<Attraction> distinctLocations = [];
  List<Attraction> filteredLocations = [];
  Attraction? selectedLocation;
  bool objectSelectionMode = false;
  late String? selectedMapFilter;
  bool? isBottomSheetSelected =false;
  bool? isSelectAttractionUpdate = false;
  bool? isVisibleList =false;
  List<Attraction> get clusteredLocations => filteredLocations
      .where((element) =>
          (selectedLocation == null || element != selectedLocation))
      .toList();

  Future<void> readAllLocationsPref(context) async {
    selectedMapFilter = null;
    if (allLocations.isNotEmpty && distinctLocations.isNotEmpty) {
      notifyListeners();
      return;
    }

    var response = await getStringF(keyMapLocationsJsonEngPref);
    Iterable l = jsonDecode(response);
    allLocations = List<Attraction>.from(
      l.map(
        (model) => Attraction.fromJson(model),
      ),
    );

    // var seen = Set<String?>();
    // distinctLocations =
    //     allLocations.where((element) => seen.add(element.locationId)).toList();
    distinctLocations = allLocations;
    filteredLocations.clear();
    filteredLocations.addAll(distinctLocations);
    objectSelectionMode = false;
    notifyListeners();
  }

  void filterAll() {
    filteredLocations = distinctLocations;
    notifyListeners();
    objectSelectionMode = false;
  }

  void filterAttractionByType(String attractionType) {
    filteredLocations = distinctLocations
        .where((element) => (element.attractionType ?? "") == attractionType)
        .toList();
    objectSelectionMode = false;
    notifyListeners();
  }

  void attractionValueUpdate(bool? value){
    isSelectAttractionUpdate = value;
    notifyListeners();
  }

  List<Attraction> getAllEntitiesFromLocId(int locationId) {
    var _list = allLocations
        .where(
          (element) =>
              element.id == locationId,
        )
        .toList();
    return _list;
  }

  setSelectedLocation(Attraction e) {
    selectedLocation = e;
    notifyListeners();
  }

  clearSelectedLocation() {
    selectedLocation = null;
    notifyListeners();
  }

  getAllLocationFromObjId(String objId) {
    filteredLocations = allLocations
        .where((element) =>
            element.id == objId)
        .toList();
    print('filtered loc: ${filteredLocations.length}');
    if (filteredLocations.length == 1) {
      selectedLocation = filteredLocations.first;
    }
    objectSelectionMode = true;
    if (objectSelectionMode) {
      selectedMapFilter = null;
    }
    notifyListeners();
  }

  void selectMapFilter(String? mapFilters) {
    selectedMapFilter = mapFilters;

    if(mapFilters != null){
      filterAttractionByType(mapFilters);
    }else{
      filterAll();
    }
    notifyListeners();
  }

  void setMapListVisibility(bool? value){
    isVisibleList = value;
    notifyListeners();
  }

}