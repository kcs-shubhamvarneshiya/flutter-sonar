import 'package:flutter_headset_detector/flutter_headset_detector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_headset_events.freezed.dart';

@freezed
class BluetoothHeadsetEvents with _$BluetoothHeadsetEvents {
  const factory BluetoothHeadsetEvents.loadBluetoothHeadsetEvent() =
      LoadBluetoothHeadsetEvents;

  const factory BluetoothHeadsetEvents.loadBluetoothChangeEvent(
      HeadsetChangedEvent value) = LoadBluetoothChangeEvents;
}
