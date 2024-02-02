// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottombar_tap_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ButtonTapEvent {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) tap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? tap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? tap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ButtonTapEventData value) tap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ButtonTapEventData value)? tap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ButtonTapEventData value)? tap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ButtonTapEventCopyWith<ButtonTapEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonTapEventCopyWith<$Res> {
  factory $ButtonTapEventCopyWith(
          ButtonTapEvent value, $Res Function(ButtonTapEvent) then) =
      _$ButtonTapEventCopyWithImpl<$Res, ButtonTapEvent>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$ButtonTapEventCopyWithImpl<$Res, $Val extends ButtonTapEvent>
    implements $ButtonTapEventCopyWith<$Res> {
  _$ButtonTapEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ButtonTapEventDataImplCopyWith<$Res>
    implements $ButtonTapEventCopyWith<$Res> {
  factory _$$ButtonTapEventDataImplCopyWith(_$ButtonTapEventDataImpl value,
          $Res Function(_$ButtonTapEventDataImpl) then) =
      __$$ButtonTapEventDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ButtonTapEventDataImplCopyWithImpl<$Res>
    extends _$ButtonTapEventCopyWithImpl<$Res, _$ButtonTapEventDataImpl>
    implements _$$ButtonTapEventDataImplCopyWith<$Res> {
  __$$ButtonTapEventDataImplCopyWithImpl(_$ButtonTapEventDataImpl _value,
      $Res Function(_$ButtonTapEventDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ButtonTapEventDataImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ButtonTapEventDataImpl implements ButtonTapEventData {
  const _$ButtonTapEventDataImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ButtonTapEvent.tap(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ButtonTapEventDataImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ButtonTapEventDataImplCopyWith<_$ButtonTapEventDataImpl> get copyWith =>
      __$$ButtonTapEventDataImplCopyWithImpl<_$ButtonTapEventDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) tap,
  }) {
    return tap(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? tap,
  }) {
    return tap?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? tap,
    required TResult orElse(),
  }) {
    if (tap != null) {
      return tap(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ButtonTapEventData value) tap,
  }) {
    return tap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ButtonTapEventData value)? tap,
  }) {
    return tap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ButtonTapEventData value)? tap,
    required TResult orElse(),
  }) {
    if (tap != null) {
      return tap(this);
    }
    return orElse();
  }
}

abstract class ButtonTapEventData implements ButtonTapEvent {
  const factory ButtonTapEventData(final int index) = _$ButtonTapEventDataImpl;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$ButtonTapEventDataImplCopyWith<_$ButtonTapEventDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
