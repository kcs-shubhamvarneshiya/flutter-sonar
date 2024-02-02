import 'package:flutter_headset_detector/flutter_headset_detector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_headset_state.freezed.dart';

@freezed
class BluetoothHeadsetListStates with _$BluetoothHeadsetListStates {
  const factory BluetoothHeadsetListStates.bluetoothHeadsetStateLoading() =
      _BluetoothHeadsetStateLoading;

  const factory BluetoothHeadsetListStates.bluetoothHeadsetConnected(
      Map<HeadsetType, HeadsetState> headsetState) = _BluetoothHeadsetConnected;

  const factory BluetoothHeadsetListStates.bluetoothHeadsetDisConnected(
          Map<HeadsetType, HeadsetState> headsetState) =
      _BluetoothHeadsetDisConnected;

  const factory BluetoothHeadsetListStates.bluetoothHeadsetErrorState(
      String error) = _BluetoothHeadsetErrorState;
}
