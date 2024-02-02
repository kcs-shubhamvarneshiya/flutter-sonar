import 'package:akdmvisitorsapp/presentaion/bloc/webView/webPageErrorBloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/webView/webView_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/webView/webView_state.dart';
import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements Connectivity {}

class MockConnectionStatus extends Mock implements IConnectionStatus {
  bool _connected = false;

  @override
  bool get connect => _connected;

  @override
  void setStatus(bool connection) {
    _connected = connection;
  }
}

GetIt sl = GetIt.instance;

Future<void> setupGetIt(MockConnectionStatus mockConnectionStatus) async {
  sl.registerSingleton<IConnectionStatus>(mockConnectionStatus);
}


void main() {
  group('WebViewErrorBloc', () {
    late WebViewErrorBloc webViewErrorBloc;
    final mockConnectionStatus = MockConnectionStatus();
    setupGetIt(mockConnectionStatus);

    setUp(() {
      webViewErrorBloc = WebViewErrorBloc();
      mockConnectionStatus.setStatus(true);
    });

    test('Initial state should be WebViewState.webViewInitialState', () {
      expect(webViewErrorBloc.state, const WebViewState.webViewInitialState());
    });

    blocTest<WebViewErrorBloc, WebViewState>(
      'emits when internet is available webViewClick state.',
      build: () => webViewErrorBloc,
      act: (bloc) {
        mockConnectionStatus.setStatus(true);
        bloc.add(const WebViewClickEvent(false,'-2'));
      },
      expect: () => [const WebViewState.webViewInitialState(), const WebViewState.webViewClickState(false,'-2')],
    );

    blocTest<WebViewErrorBloc, WebViewState>(
      'emits when internet is not available webViewInternet state.',
      build: () => webViewErrorBloc,
      act: (bloc) {
        mockConnectionStatus.setStatus(false);
        bloc.add(const WebViewClickEvent(true,'-6'));
      },
      wait: const Duration(seconds: 1),
      expect: () => [const WebViewState.webViewInitialState(),const WebViewState.webViewInternetState()],
    );

  });
}