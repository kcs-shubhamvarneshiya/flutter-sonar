// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectionEvent {
  bool get connectionStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool connectionStatus) connectionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool connectionStatus)? connectionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool connectionStatus)? connectionCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionCheck value) connectionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionCheck value)? connectionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionCheck value)? connectionCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectionEventCopyWith<ConnectionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionEventCopyWith<$Res> {
  factory $ConnectionEventCopyWith(
          ConnectionEvent value, $Res Function(ConnectionEvent) then) =
      _$ConnectionEventCopyWithImpl<$Res, ConnectionEvent>;
  @useResult
  $Res call({bool connectionStatus});
}

/// @nodoc
class _$ConnectionEventCopyWithImpl<$Res, $Val extends ConnectionEvent>
    implements $ConnectionEventCopyWith<$Res> {
  _$ConnectionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectionStatus = null,
  }) {
    return _then(_value.copyWith(
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectionCheckImplCopyWith<$Res>
    implements $ConnectionEventCopyWith<$Res> {
  factory _$$ConnectionCheckImplCopyWith(_$ConnectionCheckImpl value,
          $Res Function(_$ConnectionCheckImpl) then) =
      __$$ConnectionCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool connectionStatus});
}

/// @nodoc
class __$$ConnectionCheckImplCopyWithImpl<$Res>
    extends _$ConnectionEventCopyWithImpl<$Res, _$ConnectionCheckImpl>
    implements _$$ConnectionCheckImplCopyWith<$Res> {
  __$$ConnectionCheckImplCopyWithImpl(
      _$ConnectionCheckImpl _value, $Res Function(_$ConnectionCheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectionStatus = null,
  }) {
    return _then(_$ConnectionCheckImpl(
      null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConnectionCheckImpl implements ConnectionCheck {
  const _$ConnectionCheckImpl(this.connectionStatus);

  @override
  final bool connectionStatus;

  @override
  String toString() {
    return 'ConnectionEvent.connectionCheck(connectionStatus: $connectionStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionCheckImpl &&
            (identical(other.connectionStatus, connectionStatus) ||
                other.connectionStatus == connectionStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connectionStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionCheckImplCopyWith<_$ConnectionCheckImpl> get copyWith =>
      __$$ConnectionCheckImplCopyWithImpl<_$ConnectionCheckImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool connectionStatus) connectionCheck,
  }) {
    return connectionCheck(connectionStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool connectionStatus)? connectionCheck,
  }) {
    return connectionCheck?.call(connectionStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool connectionStatus)? connectionCheck,
    required TResult orElse(),
  }) {
    if (connectionCheck != null) {
      return connectionCheck(connectionStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConnectionCheck value) connectionCheck,
  }) {
    return connectionCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConnectionCheck value)? connectionCheck,
  }) {
    return connectionCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConnectionCheck value)? connectionCheck,
    required TResult orElse(),
  }) {
    if (connectionCheck != null) {
      return connectionCheck(this);
    }
    return orElse();
  }
}

abstract class ConnectionCheck implements ConnectionEvent {
  const factory ConnectionCheck(final bool connectionStatus) =
      _$ConnectionCheckImpl;

  @override
  bool get connectionStatus;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionCheckImplCopyWith<_$ConnectionCheckImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
