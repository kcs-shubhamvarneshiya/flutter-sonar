import 'dart:convert';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_service.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_state.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../model/app_json/app_json.dart';
import '../../../model/attraction/attraction.dart';
import '../../../repository/app_json_repository.dart';
import '../../../router_page/app_router.dart';
import '../../../utils/strings.dart';


@injectable
class VisitBloc extends Bloc<VisitEvent, VisitState>{
  SharedPreferences? sharedPreferences;
  VisitService? visitService;
  AppJsonRepository appJsonRepository;

  VisitBloc(this.appJsonRepository):visitService = getIt<VisitService>(),sharedPreferences=getIt<SharedPreferences>(),super(VisitState.loaded()){
    on<VisitLoadEvent>(visitLoadEvent);
    on<VisitActivityLoadEvent>(visitActivityLoadEvent);
    on<VisitRemoveItemEvent>(visitRemoveItemEvent);
    on<VisitRemoveAllEvent>(visitRemoveAllEvent);
    on<VisitAddActivityEvent>(visitAddActivityEvent);
  }

  visitLoadEvent(VisitLoadEvent event, emit) async {
    var attractionData = await visitService!.getAttractionList();
    AppJsonModel appJsonData = await appJsonRepository.loadJsonAssetData();
    if(attractionData.isNotEmpty){
     for(var i in attractionData){
        if(i.isAddedInPlan == null){
           i.isAddedInPlan = true;
        }
     }
    }
    appJsonData.attractions?.removeWhere((element) => element.displayOrder?.visitPlanner == null);
    appJsonData.attractions?.sort((a,b){
      var aEL = a.displayOrder?.visitPlanner;
      var bEL = b.displayOrder?.visitPlanner;
      return (aEL ?? 0).compareTo((bEL ?? 0));
    });
    var totalHours = attractionData.length > 0 ? attractionData.map((item) => int.parse(item.averageVisitLengthInMinutes != null ? item.averageVisitLengthInMinutes.toString():"0"))
        .reduce((a, b) => a + b,):0;
    emit(state.copyWith(attractionList: attractionData,totalHours:totalHours,mainAttractionList:appJsonData.attractions!,isFiltering: !state.isFiltering));
  }

  visitActivityLoadEvent(VisitActivityLoadEvent event, emit) async {
    var attractionData = await visitService!.getAttractionList();
    AppJsonModel appJsonData = await appJsonRepository.loadJsonAssetData();
    var filteredUpdatedList= await visitService!.getFilterAttractionList();
    emit(state.copyWith(attractionAddList:filteredUpdatedList,attractionList: attractionData,mainAttractionList:appJsonData.attractions!,isFiltering: !state.isFiltering));
  }

  visitRemoveItemEvent(VisitRemoveItemEvent event, emit) async {
      List<Attraction> listBeforeDelete = await visitService!.getAttractionList();
      listBeforeDelete.removeWhere((element) => element.id == event.attractionId);
      List<String> listAfterDelete = listBeforeDelete.map((item) => jsonEncode(item.toJson())).toList();
      sharedPreferences!.setStringList(keyAttractionListForPlanPref, listAfterDelete);
      List<Attraction> updatedList = await visitService!.getAttractionList();
      var totalHours = updatedList.length > 0 ? updatedList.map((item) => int.parse(item.averageVisitLengthInMinutes != null ? item.averageVisitLengthInMinutes.toString():"0"))
          .reduce((a, b) => a + b,):0;
      emit(state.copyWith(attractionList: updatedList,totalHours: totalHours));
  }

  visitRemoveAllEvent(VisitRemoveAllEvent event, emit) async {
    sharedPreferences!.remove(keyAttractionListForPlanPref);
    sharedPreferences!.setStringList(keyAttractionListForPlanPref, []);
    List<Attraction> updatedList = await visitService!.getAttractionList();
    emit(state.copyWith(attractionList: updatedList));
  }

  visitAddActivityEvent(VisitAddActivityEvent event, emit) async {
    if(event.isVisit){
    var attractionData = await visitService!.getAttractionList();
    attractionData.add(event.attractionItem);
    var attractionList=attractionData.map((item) => jsonEncode(item.toJson())).toList();
    sharedPreferences!.setStringList(keyAttractionListForPlanPref, attractionList);
    var updatedList = await visitService!.getAttractionList();
    var filteredUpdatedList= await visitService!.getFilterAttractionList();
    emit(state.copyWith(attractionList:updatedList,attractionAddList:filteredUpdatedList,isFiltering: !state.isFiltering));
    if(state.attractionAddList.isEmpty){
      getIt<AppRouter>().pop();
    }
    }else{
      var attractionList = await visitService!.getAttractionList();
      if (attractionList != null){
        bool isExisted = attractionList.map((item) => item.id).contains(event.attractionItem.id);
        if (isExisted){
          //event.context.customSnackBar(event.context, "'${event.attractionItem.title}' $alreadyAddActivityPlan", okText);
          EasyDebounce.debounce('navigateButton',
            const Duration(milliseconds: 400),
                () async {
              showToast("${event.attractionItem.title} $alreadyAddActivityPlan");
            },
          );
          emit(state.copyWith(isFiltering: !state.isFiltering,isExist:true));
        } else {
          attractionList.add(event.attractionItem);
          List<String> updatedPlanLists = attractionList
              .map((item) => jsonEncode(item.toJson()))
              .toList();
          sharedPreferences!.setStringList(keyAttractionListForPlanPref, updatedPlanLists);
          var updatedList = await visitService!.getAttractionList();
          var totalHours = updatedList.length > 0 ? updatedList.map((item) => int.parse(item.averageVisitLengthInMinutes != null ? item.averageVisitLengthInMinutes.toString():"0"))
              .reduce((a, b) => a + b,):0;
          emit(state.copyWith(attractionList:updatedList,isFiltering: !state.isFiltering,isExist:false,totalHours: totalHours));
          //event.context.customSnackBar(event.context, "'${event.attractionItem.title}' $addActivityPlan", okText);
          EasyDebounce.debounce('navigateButton',
            const Duration(milliseconds: 400),
                () async {
              showToast("${event.attractionItem.title} $addActivityPlan");
            },
          );
        }
      }else{
        List<String> updatedPlanLists = [jsonEncode(event.attractionItem.toJson())];
        sharedPreferences!.setStringList(keyAttractionListForPlanPref, updatedPlanLists);
        var updatedList = await visitService!.getAttractionList();
        var totalHours = updatedList.length > 0 ? updatedList.map((item) => int.parse(item.averageVisitLengthInMinutes != null ? item.averageVisitLengthInMinutes.toString():"0"))
            .reduce((a, b) => a + b,):0;
        emit(state.copyWith(attractionList:updatedList,isFiltering: !state.isFiltering,isExist:false,totalHours: totalHours));
        //event.context.customSnackBar(event.context, "'${event.attractionItem.title}' $addActivityPlan", okText);
        EasyDebounce.debounce('navigateButton',
          const Duration(milliseconds: 400),
              () async {
            showToast("${event.attractionItem.title} $addActivityPlan");
          },
        );
      }
    }
  }



}
