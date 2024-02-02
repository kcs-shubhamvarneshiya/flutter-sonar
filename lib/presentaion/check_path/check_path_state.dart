import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_path_state.freezed.dart';

@freezed
class CheckPathAvailableState with _$CheckPathAvailableState {
  const factory CheckPathAvailableState({required bool value}) = _CheckPathAvailableState;
  factory CheckPathAvailableState.initial() => const CheckPathAvailableState(value: false);
}