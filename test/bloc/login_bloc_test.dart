import 'package:akdmvisitorsapp/core/api_client.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/login_bloc/login_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/login_bloc/login_event_data.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/login_bloc/login_state.dart';
import 'package:akdmvisitorsapp/repository/validate_api_impl.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:async/src/result/result.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockValidateApiRepository extends Mock implements ValidateApiRepository {
  @override
  Future<Result<bool>> getToken() async {
    return Result.value(true);
  }

  @override
  Future<Result<bool>> getLogout() {
    return Future(() => Result.value(true));
  }
}

class MockConnectionStatus extends Mock implements IConnectionStatus {
  bool _connected = false;

  @override
  bool get connect => _connected;

  @override
  void setStatus(bool connection) {
    _connected = connection;
  }
}

class MockApiClient extends Mock implements ApiClient {}
class MockAppRouter extends Mock implements AppRouter {}

class MockSharedPreferences extends Mock implements SharedPreferences {
  //Arrange: Set up the mock behavior for SharedPreferences.
  @override
  String? getString(String key){
    if (key == "keySSOUserTokenPref") {
      String tokenValue="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ik5vbmUiLCJyZXF1ZXN0b3JpZCI6Ik5vbmUiLCJyZXNvdXJjZXVyaSI6IiIsImFkZGl0aW9uYWxpbmZvIjoiTm9uZSIsIm5vbmNlIjoiTm9uZSIsInVpZCI6ImFhZmM0OTI4LWEyMTgtNGM4ZC05MTBjLTAwMTE3YmZjZjVjNCIsInNpZCI6IjAxMDUwZGY5LTBmZDQtNDFkZC1iNTYzLTQ5ZDZiMzE5YWMwYyIsImFpZCI6ImFkMDQ5M2YxLTE0MjYtNDBiMi04NTQxLTJjYjAwMWI4NzFlYiIsImNpZCI6IkU2MkE0MEQ0LTY4NUItNDBGMy1BQjJFLTk4REIwQkVGNDg4RiIsImF1dGgiOiJ2ZXJpZmllZCIsImZuIjoiS3VuamFsYmhhaSIsImxuIjoiUGF0aGFrIiwicGlkIjoiNTMyMDkiLCJjdCI6ImF0Iiwicm9sZSI6IlVzZXIiLCJuYmYiOjE2OTgyOTc5NTIsImV4cCI6MTY5ODMxMjM1MiwiaWF0IjoxNjk4Mjk3OTUyLCJpc3MiOiJodHRwczovL2JhcHMub3JnIiwiYXVkIjoiTWVtYmVycyJ9.fDc3Xk703qPGCfC-PBVHEJBeDaU46HXJJ939qwRH_lE";
      return tokenValue;
    }else if(key=="selectedIndex"){
      return "0";
    }
  }

  @override
  Future<bool> setString(String key,String value) {
    return Future.value(true);
  }
}

GetIt sl = GetIt.instance;

Future<void> setupGetIt(MockConnectionStatus mockConnectionStatus, MockApiClient mockApiClient,
    MockSharedPreferences mockSharedPreferences, MockAppRouter mockAppRouter) async {
  sl.registerSingleton<IConnectionStatus>(mockConnectionStatus);
  sl.registerSingleton<ApiClient>(mockApiClient);
  sl.registerSingleton<SharedPreferences>(mockSharedPreferences);
  sl.registerSingleton<AppRouter>(mockAppRouter);
}

void main() {
  late LoginBloc loginBloc;
  late MockValidateApiRepository mockRepo;
  final mockApiClient = MockApiClient();
  final mockSharedPreferences = MockSharedPreferences();
  final mockConnectionStatus = MockConnectionStatus();
  final mockAppRouter = MockAppRouter();

  setupGetIt(mockConnectionStatus, mockApiClient, mockSharedPreferences,mockAppRouter);

  setUp(() {
    mockRepo = MockValidateApiRepository();
    loginBloc = LoginBloc(mockRepo);
    mockConnectionStatus.setStatus(true);
  });

  group('LoginBloc', () {

    test('initial state is LoginState.loading', () {
      expect(loginBloc.state, equals(const LoginState.loading()));
    });

    blocTest<LoginBloc, LoginState>(
      'emits loading state when LoginValidateEventData is added',
      build: () => loginBloc,
      act: (bloc) {
        bloc.add(const LoginValidateEventData());
      },
      expect: () => [const LoginState.loading()],
    );

    blocTest<LoginBloc, LoginState>(
      'emits internetAvailable state when no internet connection',
      build: () => loginBloc,
      act: (bloc) {
        mockConnectionStatus.setStatus(false);
        bloc.add(const ConnectionEventCheckData());
      },
      expect: () => [const LoginState.loading(),
        const LoginState.internetAvailable(false)],
    );

    blocTest<LoginBloc, LoginState>(
      'emits internetAvailable state when no internet connection',
      build: () => loginBloc,
      act: (bloc) {
        mockConnectionStatus.setStatus(false);
        bloc.add( const ConnectionProgressEventData(100));
      },
      expect: () => [const LoginState.loading(),
        const LoginState.progressUpdate(100)],
    );


    blocTest<LoginBloc, LoginState>(
      'emits logout state when internet connection available',
      build: () => loginBloc,
      act: (bloc) {
        mockConnectionStatus.setStatus(true);
        bloc.add(const LogoutEventData());
      },
      expect: () => [const LoginState.loading()],
    );


    tearDown(() {
      loginBloc.close();
    });
  });
}
