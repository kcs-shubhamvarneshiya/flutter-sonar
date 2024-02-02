import 'package:akdmvisitorsapp/presentaion/bloc/connection/connection_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/connection/connection_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/connection/connection_state.dart';
import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

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
  group('ConnectionBloc', () {
    late ConnectionBloc connectionBloc;
    final mockConnectionStatus = MockConnectionStatus();
    setupGetIt(mockConnectionStatus);

    setUp(() {
      connectionBloc = ConnectionBloc();
      mockConnectionStatus.setStatus(true);
    });

    test('Initial state should be ConnectionState(false)', () {
      expect(connectionBloc.state, const ConnectionState(false));
    });

    blocTest<ConnectionBloc, ConnectionState>(
      'emits internetAvailable state when internet connection',
      build: () => connectionBloc,
      act: (bloc) {
        mockConnectionStatus.setStatus(true);
        bloc.add( const ConnectionCheck(true));
      },
      expect: () => [ const ConnectionState(true)],
    );

    blocTest<ConnectionBloc, ConnectionState>(
      'emits internetAvailable state when no internet connection',
      build: () => connectionBloc,
      act: (bloc) {
        mockConnectionStatus.setStatus(false);
        bloc.add( const ConnectionCheck(false));
      },
      expect: () => [ const ConnectionState(false)],
    );

  });
}
