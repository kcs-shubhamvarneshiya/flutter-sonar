/*
import 'package:akdmvisitorsapp/presentaion/bloc/network/internet_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/network/internet_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/network/internet_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements Connectivity {}


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Splash Block Test', () {
    late InternetBloc internetBloc;

    setUp(() {
      internetBloc = InternetBloc();
    });

    blocTest(
      'Emit internet block',
      build: () =>  InternetBloc(),
      act: (bloc) => bloc.add(const InternetObservationEvent()),
      wait: const Duration(milliseconds: 3000),
      expect: () => [const InternetState.internetInitialState()],
    );
    tearDown(() {
      internetBloc.close();
    });
  });
}*/
