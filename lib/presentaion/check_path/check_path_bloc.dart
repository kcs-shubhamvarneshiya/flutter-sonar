import 'dart:io';

import 'package:akdmvisitorsapp/presentaion/check_path/check_path_exist_event.dart';
import 'package:akdmvisitorsapp/presentaion/check_path/check_path_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/constants.dart';

@injectable
class CheckExistPathBloc extends Bloc<CheckPathExistEvent, CheckPathAvailableState> {

  CheckExistPathBloc() : super(CheckPathAvailableState.initial()) {
    on<CheckPathExistEvent>(onExist);

  }
  onExist(CheckPathExistEvent event, emit) async {
    final directory = await getApplicationDocumentsDirectory();
    String savePath = '${directory.path}/${Constant.jsonAppContentFileName}';
    bool exist = await File(savePath).exists();
    if(exist) {
      emit(state.copyWith(value: true));
    }else{
      emit(state.copyWith(value: false));
    }
  }
}