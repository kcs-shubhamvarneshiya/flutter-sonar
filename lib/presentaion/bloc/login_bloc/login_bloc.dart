import 'dart:convert';

import 'package:akdmvisitorsapp/core/api_client.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../model/user_model/user_model.dart';
import '../../../repository/validate_api_impl.dart';
import '../../../router_page/app_router.dart';
import '../../../service/connection_service.dart';
import '../../../utils/strings.dart';
import 'login_event_data.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEventData, LoginState> {
  ValidateApiRepository repo;
  ApiClient apiClient;
  IConnectionStatus? iConnectionStatus;

  LoginBloc(this.repo) :iConnectionStatus = getIt<IConnectionStatus>(),apiClient = getIt<ApiClient>(),super( const LoginState.loading()) {
    on<LoginEventData>(loginValidate);
  }

  loginValidate(LoginEventData event, emit) async {
    emit( const LoginState.loading());
    if (event is LoginValidateEventData) {
      if (iConnectionStatus!.connect) {
        Result<bool> result = await repo.getToken();
        if (result.isValue) {
          var prefs = getIt<SharedPreferences>();
          if (prefs.getString(keySSOUserTokenPref)!.isNotEmpty) {
            final decodedPayload = JwtDecoder.decode(prefs.getString(keySSOUserTokenPref).toString());
            prefs.setString(keySSOUserModule, json.encode(decodedPayload));
            var index = prefs.getString(keyIndex);
            getIt<AppRouter>().replace( HomeBottomNavRoute(initialIndex:int.parse(index!)));
          }
          var key = prefs.getString(keySSOUserModule);
          if(key != null && key.isNotEmpty) {
            UserModel model = UserModel.fromJson(jsonDecode(key.toString()));
            Map<String, dynamic> loginParameter = {
              'type': prefs.getString(keySSOUserTokenPref).toString(),
              'name': "${model.fn} ${model.ln}",
            };
            setAnalyticData(nameLogin, loginParameter);
          }
        }
      }else{
        emit( const LoginState.internetAvailable(false));
      }
    }
    if (event is LogoutEventData) {
      if(iConnectionStatus!.connect) {
         var result = await repo.getLogout();
         var prefs = getIt<SharedPreferences>();
         prefs.setString(keySSOUserTokenPref, "");
         var index = prefs.getString(keyIndex);
         getIt<AppRouter>().push(HomeBottomNavRoute(initialIndex:int.parse(index!)));
      }else{
          emit(const LoginState.internetAvailable(false));
      }
    }
    if(event is ConnectionProgressEventData){
      if(iConnectionStatus!.connect){
        emit( LoginState.progressUpdate(event.progress));
      }else{
        emit( LoginState.progressUpdate(event.progress));
      }
    }

    if(event is ConnectionEventCheckData){
      if(iConnectionStatus!.connect){
        emit( const LoginState.internetAvailable(true));
      }else{
        emit(const  LoginState.internetAvailable(false));
      }
    }
  }
}
