// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_json_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppJsonEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAppJsonEvent value) loadUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAppJsonEvent value)? loadUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAppJsonEvent value)? loadUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppJsonEventCopyWith<$Res> {
  factory $AppJsonEventCopyWith(
          AppJsonEvent value, $Res Function(AppJsonEvent) then) =
      _$AppJsonEventCopyWithImpl<$Res, AppJsonEvent>;
}

/// @nodoc
class _$AppJsonEventCopyWithImpl<$Res, $Val extends AppJsonEvent>
    implements $AppJsonEventCopyWith<$Res> {
  _$AppJsonEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadAppJsonEventImplCopyWith<$Res> {
  factory _$$LoadAppJsonEventImplCopyWith(_$LoadAppJsonEventImpl value,
          $Res Function(_$LoadAppJsonEventImpl) then) =
      __$$LoadAppJsonEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadAppJsonEventImplCopyWithImpl<$Res>
    extends _$AppJsonEventCopyWithImpl<$Res, _$LoadAppJsonEventImpl>
    implements _$$LoadAppJsonEventImplCopyWith<$Res> {
  __$$LoadAppJsonEventImplCopyWithImpl(_$LoadAppJsonEventImpl _value,
      $Res Function(_$LoadAppJsonEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadAppJsonEventImpl implements LoadAppJsonEvent {
  const _$LoadAppJsonEventImpl();

  @override
  String toString() {
    return 'AppJsonEvent.loadUserEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadAppJsonEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUserEvent,
  }) {
    return loadUserEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUserEvent,
  }) {
    return loadUserEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUserEvent,
    required TResult orElse(),
  }) {
    if (loadUserEvent != null) {
      return loadUserEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAppJsonEvent value) loadUserEvent,
  }) {
    return loadUserEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAppJsonEvent value)? loadUserEvent,
  }) {
    return loadUserEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAppJsonEvent value)? loadUserEvent,
    required TResult orElse(),
  }) {
    if (loadUserEvent != null) {
      return loadUserEvent(this);
    }
    return orElse();
  }
}

abstract class LoadAppJsonEvent implements AppJsonEvent {
  const factory LoadAppJsonEvent() = _$LoadAppJsonEventImpl;
}
