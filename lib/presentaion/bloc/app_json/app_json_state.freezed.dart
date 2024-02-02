// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_json_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppJsonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppJsonModel appJsonData) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AppJsonModel appJsonData)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppJsonModel appJsonData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppJsonLoadingState value) loading,
    required TResult Function(_AppJsonLoadedState value) loaded,
    required TResult Function(_AppJsonErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppJsonLoadingState value)? loading,
    TResult? Function(_AppJsonLoadedState value)? loaded,
    TResult? Function(_AppJsonErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppJsonLoadingState value)? loading,
    TResult Function(_AppJsonLoadedState value)? loaded,
    TResult Function(_AppJsonErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppJsonStateCopyWith<$Res> {
  factory $AppJsonStateCopyWith(
          AppJsonState value, $Res Function(AppJsonState) then) =
      _$AppJsonStateCopyWithImpl<$Res, AppJsonState>;
}

/// @nodoc
class _$AppJsonStateCopyWithImpl<$Res, $Val extends AppJsonState>
    implements $AppJsonStateCopyWith<$Res> {
  _$AppJsonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppJsonLoadingStateImplCopyWith<$Res> {
  factory _$$AppJsonLoadingStateImplCopyWith(_$AppJsonLoadingStateImpl value,
          $Res Function(_$AppJsonLoadingStateImpl) then) =
      __$$AppJsonLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppJsonLoadingStateImplCopyWithImpl<$Res>
    extends _$AppJsonStateCopyWithImpl<$Res, _$AppJsonLoadingStateImpl>
    implements _$$AppJsonLoadingStateImplCopyWith<$Res> {
  __$$AppJsonLoadingStateImplCopyWithImpl(_$AppJsonLoadingStateImpl _value,
      $Res Function(_$AppJsonLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppJsonLoadingStateImpl implements _AppJsonLoadingState {
  const _$AppJsonLoadingStateImpl();

  @override
  String toString() {
    return 'AppJsonState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppJsonLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppJsonModel appJsonData) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AppJsonModel appJsonData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppJsonModel appJsonData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppJsonLoadingState value) loading,
    required TResult Function(_AppJsonLoadedState value) loaded,
    required TResult Function(_AppJsonErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppJsonLoadingState value)? loading,
    TResult? Function(_AppJsonLoadedState value)? loaded,
    TResult? Function(_AppJsonErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppJsonLoadingState value)? loading,
    TResult Function(_AppJsonLoadedState value)? loaded,
    TResult Function(_AppJsonErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AppJsonLoadingState implements AppJsonState {
  const factory _AppJsonLoadingState() = _$AppJsonLoadingStateImpl;
}

/// @nodoc
abstract class _$$AppJsonLoadedStateImplCopyWith<$Res> {
  factory _$$AppJsonLoadedStateImplCopyWith(_$AppJsonLoadedStateImpl value,
          $Res Function(_$AppJsonLoadedStateImpl) then) =
      __$$AppJsonLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppJsonModel appJsonData});
}

/// @nodoc
class __$$AppJsonLoadedStateImplCopyWithImpl<$Res>
    extends _$AppJsonStateCopyWithImpl<$Res, _$AppJsonLoadedStateImpl>
    implements _$$AppJsonLoadedStateImplCopyWith<$Res> {
  __$$AppJsonLoadedStateImplCopyWithImpl(_$AppJsonLoadedStateImpl _value,
      $Res Function(_$AppJsonLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appJsonData = null,
  }) {
    return _then(_$AppJsonLoadedStateImpl(
      null == appJsonData
          ? _value.appJsonData
          : appJsonData // ignore: cast_nullable_to_non_nullable
              as AppJsonModel,
    ));
  }
}

/// @nodoc

class _$AppJsonLoadedStateImpl implements _AppJsonLoadedState {
  const _$AppJsonLoadedStateImpl(this.appJsonData);

  @override
  final AppJsonModel appJsonData;

  @override
  String toString() {
    return 'AppJsonState.loaded(appJsonData: $appJsonData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppJsonLoadedStateImpl &&
            (identical(other.appJsonData, appJsonData) ||
                other.appJsonData == appJsonData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appJsonData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppJsonLoadedStateImplCopyWith<_$AppJsonLoadedStateImpl> get copyWith =>
      __$$AppJsonLoadedStateImplCopyWithImpl<_$AppJsonLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppJsonModel appJsonData) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(appJsonData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AppJsonModel appJsonData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(appJsonData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppJsonModel appJsonData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(appJsonData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppJsonLoadingState value) loading,
    required TResult Function(_AppJsonLoadedState value) loaded,
    required TResult Function(_AppJsonErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppJsonLoadingState value)? loading,
    TResult? Function(_AppJsonLoadedState value)? loaded,
    TResult? Function(_AppJsonErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppJsonLoadingState value)? loading,
    TResult Function(_AppJsonLoadedState value)? loaded,
    TResult Function(_AppJsonErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _AppJsonLoadedState implements AppJsonState {
  const factory _AppJsonLoadedState(final AppJsonModel appJsonData) =
      _$AppJsonLoadedStateImpl;

  AppJsonModel get appJsonData;
  @JsonKey(ignore: true)
  _$$AppJsonLoadedStateImplCopyWith<_$AppJsonLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppJsonErrorStateImplCopyWith<$Res> {
  factory _$$AppJsonErrorStateImplCopyWith(_$AppJsonErrorStateImpl value,
          $Res Function(_$AppJsonErrorStateImpl) then) =
      __$$AppJsonErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AppJsonErrorStateImplCopyWithImpl<$Res>
    extends _$AppJsonStateCopyWithImpl<$Res, _$AppJsonErrorStateImpl>
    implements _$$AppJsonErrorStateImplCopyWith<$Res> {
  __$$AppJsonErrorStateImplCopyWithImpl(_$AppJsonErrorStateImpl _value,
      $Res Function(_$AppJsonErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AppJsonErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppJsonErrorStateImpl implements _AppJsonErrorState {
  const _$AppJsonErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AppJsonState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppJsonErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppJsonErrorStateImplCopyWith<_$AppJsonErrorStateImpl> get copyWith =>
      __$$AppJsonErrorStateImplCopyWithImpl<_$AppJsonErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppJsonModel appJsonData) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AppJsonModel appJsonData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppJsonModel appJsonData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppJsonLoadingState value) loading,
    required TResult Function(_AppJsonLoadedState value) loaded,
    required TResult Function(_AppJsonErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppJsonLoadingState value)? loading,
    TResult? Function(_AppJsonLoadedState value)? loaded,
    TResult? Function(_AppJsonErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppJsonLoadingState value)? loading,
    TResult Function(_AppJsonLoadedState value)? loaded,
    TResult Function(_AppJsonErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AppJsonErrorState implements AppJsonState {
  const factory _AppJsonErrorState(final String error) =
      _$AppJsonErrorStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$AppJsonErrorStateImplCopyWith<_$AppJsonErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$JsonAPIState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppJsonApiModel appJsonAPIData) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AppJsonApiModel appJsonAPIData)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppJsonApiModel appJsonAPIData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JsonAPIStateLoadingState value) loading,
    required TResult Function(_JsonAPIStateLoadedState value) loaded,
    required TResult Function(_JsonAPIStateErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JsonAPIStateLoadingState value)? loading,
    TResult? Function(_JsonAPIStateLoadedState value)? loaded,
    TResult? Function(_JsonAPIStateErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JsonAPIStateLoadingState value)? loading,
    TResult Function(_JsonAPIStateLoadedState value)? loaded,
    TResult Function(_JsonAPIStateErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JsonAPIStateCopyWith<$Res> {
  factory $JsonAPIStateCopyWith(
          JsonAPIState value, $Res Function(JsonAPIState) then) =
      _$JsonAPIStateCopyWithImpl<$Res, JsonAPIState>;
}

/// @nodoc
class _$JsonAPIStateCopyWithImpl<$Res, $Val extends JsonAPIState>
    implements $JsonAPIStateCopyWith<$Res> {
  _$JsonAPIStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$JsonAPIStateLoadingStateImplCopyWith<$Res> {
  factory _$$JsonAPIStateLoadingStateImplCopyWith(
          _$JsonAPIStateLoadingStateImpl value,
          $Res Function(_$JsonAPIStateLoadingStateImpl) then) =
      __$$JsonAPIStateLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JsonAPIStateLoadingStateImplCopyWithImpl<$Res>
    extends _$JsonAPIStateCopyWithImpl<$Res, _$JsonAPIStateLoadingStateImpl>
    implements _$$JsonAPIStateLoadingStateImplCopyWith<$Res> {
  __$$JsonAPIStateLoadingStateImplCopyWithImpl(
      _$JsonAPIStateLoadingStateImpl _value,
      $Res Function(_$JsonAPIStateLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$JsonAPIStateLoadingStateImpl implements _JsonAPIStateLoadingState {
  const _$JsonAPIStateLoadingStateImpl();

  @override
  String toString() {
    return 'JsonAPIState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsonAPIStateLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppJsonApiModel appJsonAPIData) loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AppJsonApiModel appJsonAPIData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppJsonApiModel appJsonAPIData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JsonAPIStateLoadingState value) loading,
    required TResult Function(_JsonAPIStateLoadedState value) loaded,
    required TResult Function(_JsonAPIStateErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JsonAPIStateLoadingState value)? loading,
    TResult? Function(_JsonAPIStateLoadedState value)? loaded,
    TResult? Function(_JsonAPIStateErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JsonAPIStateLoadingState value)? loading,
    TResult Function(_JsonAPIStateLoadedState value)? loaded,
    TResult Function(_JsonAPIStateErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _JsonAPIStateLoadingState implements JsonAPIState {
  const factory _JsonAPIStateLoadingState() = _$JsonAPIStateLoadingStateImpl;
}

/// @nodoc
abstract class _$$JsonAPIStateLoadedStateImplCopyWith<$Res> {
  factory _$$JsonAPIStateLoadedStateImplCopyWith(
          _$JsonAPIStateLoadedStateImpl value,
          $Res Function(_$JsonAPIStateLoadedStateImpl) then) =
      __$$JsonAPIStateLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppJsonApiModel appJsonAPIData});
}

/// @nodoc
class __$$JsonAPIStateLoadedStateImplCopyWithImpl<$Res>
    extends _$JsonAPIStateCopyWithImpl<$Res, _$JsonAPIStateLoadedStateImpl>
    implements _$$JsonAPIStateLoadedStateImplCopyWith<$Res> {
  __$$JsonAPIStateLoadedStateImplCopyWithImpl(
      _$JsonAPIStateLoadedStateImpl _value,
      $Res Function(_$JsonAPIStateLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appJsonAPIData = null,
  }) {
    return _then(_$JsonAPIStateLoadedStateImpl(
      null == appJsonAPIData
          ? _value.appJsonAPIData
          : appJsonAPIData // ignore: cast_nullable_to_non_nullable
              as AppJsonApiModel,
    ));
  }
}

/// @nodoc

class _$JsonAPIStateLoadedStateImpl implements _JsonAPIStateLoadedState {
  const _$JsonAPIStateLoadedStateImpl(this.appJsonAPIData);

  @override
  final AppJsonApiModel appJsonAPIData;

  @override
  String toString() {
    return 'JsonAPIState.loaded(appJsonAPIData: $appJsonAPIData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsonAPIStateLoadedStateImpl &&
            (identical(other.appJsonAPIData, appJsonAPIData) ||
                other.appJsonAPIData == appJsonAPIData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appJsonAPIData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JsonAPIStateLoadedStateImplCopyWith<_$JsonAPIStateLoadedStateImpl>
      get copyWith => __$$JsonAPIStateLoadedStateImplCopyWithImpl<
          _$JsonAPIStateLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppJsonApiModel appJsonAPIData) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(appJsonAPIData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AppJsonApiModel appJsonAPIData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(appJsonAPIData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppJsonApiModel appJsonAPIData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(appJsonAPIData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JsonAPIStateLoadingState value) loading,
    required TResult Function(_JsonAPIStateLoadedState value) loaded,
    required TResult Function(_JsonAPIStateErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JsonAPIStateLoadingState value)? loading,
    TResult? Function(_JsonAPIStateLoadedState value)? loaded,
    TResult? Function(_JsonAPIStateErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JsonAPIStateLoadingState value)? loading,
    TResult Function(_JsonAPIStateLoadedState value)? loaded,
    TResult Function(_JsonAPIStateErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _JsonAPIStateLoadedState implements JsonAPIState {
  const factory _JsonAPIStateLoadedState(final AppJsonApiModel appJsonAPIData) =
      _$JsonAPIStateLoadedStateImpl;

  AppJsonApiModel get appJsonAPIData;
  @JsonKey(ignore: true)
  _$$JsonAPIStateLoadedStateImplCopyWith<_$JsonAPIStateLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JsonAPIStateErrorStateImplCopyWith<$Res> {
  factory _$$JsonAPIStateErrorStateImplCopyWith(
          _$JsonAPIStateErrorStateImpl value,
          $Res Function(_$JsonAPIStateErrorStateImpl) then) =
      __$$JsonAPIStateErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$JsonAPIStateErrorStateImplCopyWithImpl<$Res>
    extends _$JsonAPIStateCopyWithImpl<$Res, _$JsonAPIStateErrorStateImpl>
    implements _$$JsonAPIStateErrorStateImplCopyWith<$Res> {
  __$$JsonAPIStateErrorStateImplCopyWithImpl(
      _$JsonAPIStateErrorStateImpl _value,
      $Res Function(_$JsonAPIStateErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$JsonAPIStateErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JsonAPIStateErrorStateImpl implements _JsonAPIStateErrorState {
  const _$JsonAPIStateErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'JsonAPIState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsonAPIStateErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JsonAPIStateErrorStateImplCopyWith<_$JsonAPIStateErrorStateImpl>
      get copyWith => __$$JsonAPIStateErrorStateImplCopyWithImpl<
          _$JsonAPIStateErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppJsonApiModel appJsonAPIData) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AppJsonApiModel appJsonAPIData)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppJsonApiModel appJsonAPIData)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JsonAPIStateLoadingState value) loading,
    required TResult Function(_JsonAPIStateLoadedState value) loaded,
    required TResult Function(_JsonAPIStateErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JsonAPIStateLoadingState value)? loading,
    TResult? Function(_JsonAPIStateLoadedState value)? loaded,
    TResult? Function(_JsonAPIStateErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JsonAPIStateLoadingState value)? loading,
    TResult Function(_JsonAPIStateLoadedState value)? loaded,
    TResult Function(_JsonAPIStateErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _JsonAPIStateErrorState implements JsonAPIState {
  const factory _JsonAPIStateErrorState(final String error) =
      _$JsonAPIStateErrorStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$JsonAPIStateErrorStateImplCopyWith<_$JsonAPIStateErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
