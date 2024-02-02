// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'introduction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IntroductionEvent {
  String get screen => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String screen) screenChangeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String screen)? screenChangeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String screen)? screenChangeEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenChangeEvent value) screenChangeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenChangeEvent value)? screenChangeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenChangeEvent value)? screenChangeEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntroductionEventCopyWith<IntroductionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroductionEventCopyWith<$Res> {
  factory $IntroductionEventCopyWith(
          IntroductionEvent value, $Res Function(IntroductionEvent) then) =
      _$IntroductionEventCopyWithImpl<$Res, IntroductionEvent>;
  @useResult
  $Res call({String screen});
}

/// @nodoc
class _$IntroductionEventCopyWithImpl<$Res, $Val extends IntroductionEvent>
    implements $IntroductionEventCopyWith<$Res> {
  _$IntroductionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = null,
  }) {
    return _then(_value.copyWith(
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreenChangeEventImplCopyWith<$Res>
    implements $IntroductionEventCopyWith<$Res> {
  factory _$$ScreenChangeEventImplCopyWith(_$ScreenChangeEventImpl value,
          $Res Function(_$ScreenChangeEventImpl) then) =
      __$$ScreenChangeEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String screen});
}

/// @nodoc
class __$$ScreenChangeEventImplCopyWithImpl<$Res>
    extends _$IntroductionEventCopyWithImpl<$Res, _$ScreenChangeEventImpl>
    implements _$$ScreenChangeEventImplCopyWith<$Res> {
  __$$ScreenChangeEventImplCopyWithImpl(_$ScreenChangeEventImpl _value,
      $Res Function(_$ScreenChangeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = null,
  }) {
    return _then(_$ScreenChangeEventImpl(
      null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScreenChangeEventImpl implements ScreenChangeEvent {
  const _$ScreenChangeEventImpl(this.screen);

  @override
  final String screen;

  @override
  String toString() {
    return 'IntroductionEvent.screenChangeEvent(screen: $screen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenChangeEventImpl &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreenChangeEventImplCopyWith<_$ScreenChangeEventImpl> get copyWith =>
      __$$ScreenChangeEventImplCopyWithImpl<_$ScreenChangeEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String screen) screenChangeEvent,
  }) {
    return screenChangeEvent(screen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String screen)? screenChangeEvent,
  }) {
    return screenChangeEvent?.call(screen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String screen)? screenChangeEvent,
    required TResult orElse(),
  }) {
    if (screenChangeEvent != null) {
      return screenChangeEvent(screen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScreenChangeEvent value) screenChangeEvent,
  }) {
    return screenChangeEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScreenChangeEvent value)? screenChangeEvent,
  }) {
    return screenChangeEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScreenChangeEvent value)? screenChangeEvent,
    required TResult orElse(),
  }) {
    if (screenChangeEvent != null) {
      return screenChangeEvent(this);
    }
    return orElse();
  }
}

abstract class ScreenChangeEvent implements IntroductionEvent {
  const factory ScreenChangeEvent(final String screen) =
      _$ScreenChangeEventImpl;

  @override
  String get screen;
  @override
  @JsonKey(ignore: true)
  _$$ScreenChangeEventImplCopyWith<_$ScreenChangeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
