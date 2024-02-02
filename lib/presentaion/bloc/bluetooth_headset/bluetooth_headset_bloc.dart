import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_headset_detector/flutter_headset_detector.dart';
import 'package:injectable/injectable.dart';

import 'bluetooth_headset_events.dart';
import 'bluetooth_headset_state.dart';

//bluetooth bloc for
@injectable
class BluetoothHeadsetBloc
    extends Bloc<BluetoothHeadsetEvents, BluetoothHeadsetListStates> {
  final headsetDetector = HeadsetDetector();
  Map<HeadsetType, HeadsetState> headsetState = {
    HeadsetType.WIRED: HeadsetState.DISCONNECTED,
    HeadsetType.WIRELESS: HeadsetState.DISCONNECTED,
  };

  BluetoothHeadsetBloc()
      : super(const BluetoothHeadsetListStates.bluetoothHeadsetStateLoading()) {
    on<LoadBluetoothHeadsetEvents>(bluetoothConnection);
    on<LoadBluetoothChangeEvents>(bluetoothConnectionChange);
  }

  bluetoothConnection(LoadBluetoothHeadsetEvents event, emit) async {
    try {
      await headsetDetector.getCurrentState.then((val) => headsetState = val);
      if (headsetState[HeadsetType.WIRELESS] == HeadsetState.CONNECTED ||
          headsetState[HeadsetType.WIRED] == HeadsetState.CONNECTED) {
        emit(
            BluetoothHeadsetListStates.bluetoothHeadsetConnected(headsetState));
      } else {
        emit(BluetoothHeadsetListStates.bluetoothHeadsetDisConnected(
            headsetState));
      }
    } catch (e) {
      emit(BluetoothHeadsetListStates.bluetoothHeadsetErrorState(e.toString()));
    }
  }

  bluetoothConnectionChange(LoadBluetoothChangeEvents event, emit) async {
    try {
      switch (event.value) {
        case HeadsetChangedEvent.WIRED_CONNECTED:
          headsetState[HeadsetType.WIRED] = HeadsetState.CONNECTED;
          if (kDebugMode) {
            print('wired connected');
          }
          emit(BluetoothHeadsetListStates.bluetoothHeadsetConnected(
              headsetState));
          break;
        case HeadsetChangedEvent.WIRED_DISCONNECTED:
          headsetState[HeadsetType.WIRED] = HeadsetState.DISCONNECTED;
          if (kDebugMode) {
            print('wired disconnected');
          }
          emit(BluetoothHeadsetListStates.bluetoothHeadsetDisConnected(
              headsetState));
          break;
        case HeadsetChangedEvent.WIRELESS_CONNECTED:
          headsetState[HeadsetType.WIRELESS] = HeadsetState.CONNECTED;
          if (kDebugMode) {
            print('wireless connected');
          }
          emit(BluetoothHeadsetListStates.bluetoothHeadsetConnected(
              headsetState));
          break;
        case HeadsetChangedEvent.WIRELESS_DISCONNECTED:
          headsetState[HeadsetType.WIRELESS] = HeadsetState.DISCONNECTED;
          if (kDebugMode) {
            print('wireless disconnected');
          }
          emit(BluetoothHeadsetListStates.bluetoothHeadsetDisConnected(
              headsetState));
          break;
      }
    } catch (e) {
      emit(BluetoothHeadsetListStates.bluetoothHeadsetErrorState(e.toString()));
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
