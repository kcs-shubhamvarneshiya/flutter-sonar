import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_headset_detector/flutter_headset_detector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockHeadsetDetector extends Mock implements HeadsetDetector {
  Map<HeadsetType, HeadsetState> getCurrentStateMock() {
    return {
      HeadsetType.WIRED: HeadsetState.DISCONNECTED,
      HeadsetType.WIRELESS: HeadsetState.CONNECTED,
    };
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize Flutter framework
  group('BluetoothHeadsetBloc', () {
    final mockHeadsetDetector = MockHeadsetDetector();
    late BluetoothHeadsetBloc bluetoothHeadsetBloc;

    setUp(() {
      bluetoothHeadsetBloc = BluetoothHeadsetBloc();
    });

    test('initial state is correct', () {
      expect(bluetoothHeadsetBloc.state, const BluetoothHeadsetListStates.bluetoothHeadsetStateLoading());
    });

    blocTest<BluetoothHeadsetBloc, BluetoothHeadsetListStates>(
      'emits connected state when bluetooth is connected',
      build: () {
        return bluetoothHeadsetBloc;
      },
      act: (bloc) => bloc.add(const LoadBluetoothHeadsetEvents()),

      expect:() => [const BluetoothHeadsetListStates.bluetoothHeadsetConnected(
          {HeadsetType.WIRED: HeadsetState.DISCONNECTED, HeadsetType.WIRELESS: HeadsetState.CONNECTED}
      )],
    );

    blocTest<BluetoothHeadsetBloc, BluetoothHeadsetListStates>(
      'emits disconnected state when bluetooth is disconnected',
      build: () {
        return bluetoothHeadsetBloc;
      },
      act: (bloc) => bloc.add(const LoadBluetoothHeadsetEvents()),

      expect:() => [const BluetoothHeadsetListStates.bluetoothHeadsetDisConnected(
          {HeadsetType.WIRED: HeadsetState.DISCONNECTED, HeadsetType.WIRELESS: HeadsetState.DISCONNECTED}
      )],
    );

    blocTest<BluetoothHeadsetBloc, BluetoothHeadsetListStates>(
      'emits BluetoothHeadsetListStates when LoadBluetoothChangeEvents is added',
      build: () => bluetoothHeadsetBloc,
      act: (bloc) => bloc.add(
          const LoadBluetoothChangeEvents(HeadsetChangedEvent.WIRED_CONNECTED)),
      expect: () => [
        const BluetoothHeadsetListStates.bluetoothHeadsetConnected(
          {
            HeadsetType.WIRED: HeadsetState.CONNECTED,
            HeadsetType.WIRELESS: HeadsetState.CONNECTED
          },
        ),
      ],
    );


    blocTest<BluetoothHeadsetBloc, BluetoothHeadsetListStates>(
      'emits error state when an exception occurs',
      build: () {
        when(mockHeadsetDetector.getCurrentState).thenThrow(Exception('An error occurred'));
        return bluetoothHeadsetBloc;
      },
      act: (bloc) => bloc.add(const LoadBluetoothHeadsetEvents()),
      expect:() =>  [const BluetoothHeadsetListStates.bluetoothHeadsetErrorState('An error occurred')],
    );


  });
}