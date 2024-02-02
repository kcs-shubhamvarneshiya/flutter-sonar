// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_path_exist_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckPathExistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() exist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? exist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? exist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckPathExistEventData value) exist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckPathExistEventData value)? exist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckPathExistEventData value)? exist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckPathExistEventCopyWith<$Res> {
  factory $CheckPathExistEventCopyWith(
          CheckPathExistEvent value, $Res Function(CheckPathExistEvent) then) =
      _$CheckPathExistEventCopyWithImpl<$Res, CheckPathExistEvent>;
}

/// @nodoc
class _$CheckPathExistEventCopyWithImpl<$Res, $Val extends CheckPathExistEvent>
    implements $CheckPathExistEventCopyWith<$Res> {
  _$CheckPathExistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckPathExistEventDataImplCopyWith<$Res> {
  factory _$$CheckPathExistEventDataImplCopyWith(
          _$CheckPathExistEventDataImpl value,
          $Res Function(_$CheckPathExistEventDataImpl) then) =
      __$$CheckPathExistEventDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckPathExistEventDataImplCopyWithImpl<$Res>
    extends _$CheckPathExistEventCopyWithImpl<$Res,
        _$CheckPathExistEventDataImpl>
    implements _$$CheckPathExistEventDataImplCopyWith<$Res> {
  __$$CheckPathExistEventDataImplCopyWithImpl(
      _$CheckPathExistEventDataImpl _value,
      $Res Function(_$CheckPathExistEventDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckPathExistEventDataImpl implements CheckPathExistEventData {
  const _$CheckPathExistEventDataImpl();

  @override
  String toString() {
    return 'CheckPathExistEvent.exist()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckPathExistEventDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() exist,
  }) {
    return exist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? exist,
  }) {
    return exist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? exist,
    required TResult orElse(),
  }) {
    if (exist != null) {
      return exist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckPathExistEventData value) exist,
  }) {
    return exist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckPathExistEventData value)? exist,
  }) {
    return exist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckPathExistEventData value)? exist,
    required TResult orElse(),
  }) {
    if (exist != null) {
      return exist(this);
    }
    return orElse();
  }
}

abstract class CheckPathExistEventData implements CheckPathExistEvent {
  const factory CheckPathExistEventData() = _$CheckPathExistEventDataImpl;
}
