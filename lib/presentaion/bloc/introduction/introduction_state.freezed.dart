// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'introduction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IntroductionState {
  String get background => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String background) setBackgroundState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String background)? setBackgroundState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String background)? setBackgroundState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetBackgroundState value) setBackgroundState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetBackgroundState value)? setBackgroundState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetBackgroundState value)? setBackgroundState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntroductionStateCopyWith<IntroductionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroductionStateCopyWith<$Res> {
  factory $IntroductionStateCopyWith(
          IntroductionState value, $Res Function(IntroductionState) then) =
      _$IntroductionStateCopyWithImpl<$Res, IntroductionState>;
  @useResult
  $Res call({String background});
}

/// @nodoc
class _$IntroductionStateCopyWithImpl<$Res, $Val extends IntroductionState>
    implements $IntroductionStateCopyWith<$Res> {
  _$IntroductionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? background = null,
  }) {
    return _then(_value.copyWith(
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetBackgroundStateImplCopyWith<$Res>
    implements $IntroductionStateCopyWith<$Res> {
  factory _$$SetBackgroundStateImplCopyWith(_$SetBackgroundStateImpl value,
          $Res Function(_$SetBackgroundStateImpl) then) =
      __$$SetBackgroundStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String background});
}

/// @nodoc
class __$$SetBackgroundStateImplCopyWithImpl<$Res>
    extends _$IntroductionStateCopyWithImpl<$Res, _$SetBackgroundStateImpl>
    implements _$$SetBackgroundStateImplCopyWith<$Res> {
  __$$SetBackgroundStateImplCopyWithImpl(_$SetBackgroundStateImpl _value,
      $Res Function(_$SetBackgroundStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? background = null,
  }) {
    return _then(_$SetBackgroundStateImpl(
      null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetBackgroundStateImpl implements _SetBackgroundState {
  const _$SetBackgroundStateImpl(this.background);

  @override
  final String background;

  @override
  String toString() {
    return 'IntroductionState.setBackgroundState(background: $background)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetBackgroundStateImpl &&
            (identical(other.background, background) ||
                other.background == background));
  }

  @override
  int get hashCode => Object.hash(runtimeType, background);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetBackgroundStateImplCopyWith<_$SetBackgroundStateImpl> get copyWith =>
      __$$SetBackgroundStateImplCopyWithImpl<_$SetBackgroundStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String background) setBackgroundState,
  }) {
    return setBackgroundState(background);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String background)? setBackgroundState,
  }) {
    return setBackgroundState?.call(background);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String background)? setBackgroundState,
    required TResult orElse(),
  }) {
    if (setBackgroundState != null) {
      return setBackgroundState(background);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetBackgroundState value) setBackgroundState,
  }) {
    return setBackgroundState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetBackgroundState value)? setBackgroundState,
  }) {
    return setBackgroundState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetBackgroundState value)? setBackgroundState,
    required TResult orElse(),
  }) {
    if (setBackgroundState != null) {
      return setBackgroundState(this);
    }
    return orElse();
  }
}

abstract class _SetBackgroundState implements IntroductionState {
  const factory _SetBackgroundState(final String background) =
      _$SetBackgroundStateImpl;

  @override
  String get background;
  @override
  @JsonKey(ignore: true)
  _$$SetBackgroundStateImplCopyWith<_$SetBackgroundStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
