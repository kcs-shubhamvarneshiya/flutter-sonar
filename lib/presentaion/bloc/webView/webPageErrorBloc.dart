import 'dart:async';
import 'package:akdmvisitorsapp/presentaion/bloc/webView/webView_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/webView/webView_state.dart';
import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:akdmvisitorsapp/dependencies.dart';


@injectable
class WebViewErrorBloc extends Bloc<WebViewEvent, WebViewState> {
  IConnectionStatus? iConnectionStatus;
  StreamSubscription<bool>? connectionSubscription;

  WebViewErrorBloc():iConnectionStatus = getIt<IConnectionStatus>(),super(const WebViewState.webViewInitialState()){
    on<WebViewClickEvent>(getValidateData);
  }

  getValidateData(WebViewClickEvent event, emit) async {
    print("initial state");
    emit(const WebViewState.webViewInitialState());
    if(iConnectionStatus!.connect) {
      print("event value:${event.isError}");
      emit(WebViewState.webViewClickState(event.isError,event.code));
      print("second state");
    }else{
      await Future.delayed(const Duration(seconds: 1));
      emit(const WebViewState.webViewInternetState());
    }
  }
}

