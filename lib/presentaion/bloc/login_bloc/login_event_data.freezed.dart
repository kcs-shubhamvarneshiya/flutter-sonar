// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEventData {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadEvent,
    required TResult Function() logoutEvent,
    required TResult Function() connectionEvent,
    required TResult Function(int progress) progressEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadEvent,
    TResult? Function()? logoutEvent,
    TResult? Function()? connectionEvent,
    TResult? Function(int progress)? progressEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadEvent,
    TResult Function()? logoutEvent,
    TResult Function()? connectionEvent,
    TResult Function(int progress)? progressEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginValidateEventData value) loadEvent,
    required TResult Function(LogoutEventData value) logoutEvent,
    required TResult Function(ConnectionEventCheckData value) connectionEvent,
    required TResult Function(ConnectionProgressEventData value) progressEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginValidateEventData value)? loadEvent,
    TResult? Function(LogoutEventData value)? logoutEvent,
    TResult? Function(ConnectionEventCheckData value)? connectionEvent,
    TResult? Function(ConnectionProgressEventData value)? progressEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginValidateEventData value)? loadEvent,
    TResult Function(LogoutEventData value)? logoutEvent,
    TResult Function(ConnectionEventCheckData value)? connectionEvent,
    TResult Function(ConnectionProgressEventData value)? progressEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventDataCopyWith<$Res> {
  factory $LoginEventDataCopyWith(
          LoginEventData value, $Res Function(LoginEventData) then) =
      _$LoginEventDataCopyWithImpl<$Res, LoginEventData>;
}

/// @nodoc
class _$LoginEventDataCopyWithImpl<$Res, $Val extends LoginEventData>
    implements $LoginEventDataCopyWith<$Res> {
  _$LoginEventDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginValidateEventDataImplCopyWith<$Res> {
  factory _$$LoginValidateEventDataImplCopyWith(
          _$LoginValidateEventDataImpl value,
          $Res Function(_$LoginValidateEventDataImpl) then) =
      __$$LoginValidateEventDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginValidateEventDataImplCopyWithImpl<$Res>
    extends _$LoginEventDataCopyWithImpl<$Res, _$LoginValidateEventDataImpl>
    implements _$$LoginValidateEventDataImplCopyWith<$Res> {
  __$$LoginValidateEventDataImplCopyWithImpl(
      _$LoginValidateEventDataImpl _value,
      $Res Function(_$LoginValidateEventDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginValidateEventDataImpl implements LoginValidateEventData {
  const _$LoginValidateEventDataImpl();

  @override
  String toString() {
    return 'LoginEventData.loadEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginValidateEventDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadEvent,
    required TResult Function() logoutEvent,
    required TResult Function() connectionEvent,
    required TResult Function(int progress) progressEvent,
  }) {
    return loadEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadEvent,
    TResult? Function()? logoutEvent,
    TResult? Function()? connectionEvent,
    TResult? Function(int progress)? progressEvent,
  }) {
    return loadEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadEvent,
    TResult Function()? logoutEvent,
    TResult Function()? connectionEvent,
    TResult Function(int progress)? progressEvent,
    required TResult orElse(),
  }) {
    if (loadEvent != null) {
      return loadEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginValidateEventData value) loadEvent,
    required TResult Function(LogoutEventData value) logoutEvent,
    required TResult Function(ConnectionEventCheckData value) connectionEvent,
    required TResult Function(ConnectionProgressEventData value) progressEvent,
  }) {
    return loadEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginValidateEventData value)? loadEvent,
    TResult? Function(LogoutEventData value)? logoutEvent,
    TResult? Function(ConnectionEventCheckData value)? connectionEvent,
    TResult? Function(ConnectionProgressEventData value)? progressEvent,
  }) {
    return loadEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginValidateEventData value)? loadEvent,
    TResult Function(LogoutEventData value)? logoutEvent,
    TResult Function(ConnectionEventCheckData value)? connectionEvent,
    TResult Function(ConnectionProgressEventData value)? progressEvent,
    required TResult orElse(),
  }) {
    if (loadEvent != null) {
      return loadEvent(this);
    }
    return orElse();
  }
}

abstract class LoginValidateEventData implements LoginEventData {
  const factory LoginValidateEventData() = _$LoginValidateEventDataImpl;
}

/// @nodoc
abstract class _$$LogoutEventDataImplCopyWith<$Res> {
  factory _$$LogoutEventDataImplCopyWith(_$LogoutEventDataImpl value,
          $Res Function(_$LogoutEventDataImpl) then) =
      __$$LogoutEventDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutEventDataImplCopyWithImpl<$Res>
    extends _$LoginEventDataCopyWithImpl<$Res, _$LogoutEventDataImpl>
    implements _$$LogoutEventDataImplCopyWith<$Res> {
  __$$LogoutEventDataImplCopyWithImpl(
      _$LogoutEventDataImpl _value, $Res Function(_$LogoutEventDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutEventDataImpl implements LogoutEventData {
  const _$LogoutEventDataImpl();

  @override
  String toString() {
    return 'LoginEventData.logoutEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutEventDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadEvent,
    required TResult Function() logoutEvent,
    required TResult Function() connectionEvent,
    required TResult Function(int progress) progressEvent,
  }) {
    return logoutEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadEvent,
    TResult? Function()? logoutEvent,
    TResult? Function()? connectionEvent,
    TResult? Function(int progress)? progressEvent,
  }) {
    return logoutEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadEvent,
    TResult Function()? logoutEvent,
    TResult Function()? connectionEvent,
    TResult Function(int progress)? progressEvent,
    required TResult orElse(),
  }) {
    if (logoutEvent != null) {
      return logoutEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginValidateEventData value) loadEvent,
    required TResult Function(LogoutEventData value) logoutEvent,
    required TResult Function(ConnectionEventCheckData value) connectionEvent,
    required TResult Function(ConnectionProgressEventData value) progressEvent,
  }) {
    return logoutEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginValidateEventData value)? loadEvent,
    TResult? Function(LogoutEventData value)? logoutEvent,
    TResult? Function(ConnectionEventCheckData value)? connectionEvent,
    TResult? Function(ConnectionProgressEventData value)? progressEvent,
  }) {
    return logoutEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginValidateEventData value)? loadEvent,
    TResult Function(LogoutEventData value)? logoutEvent,
    TResult Function(ConnectionEventCheckData value)? connectionEvent,
    TResult Function(ConnectionProgressEventData value)? progressEvent,
    required TResult orElse(),
  }) {
    if (logoutEvent != null) {
      return logoutEvent(this);
    }
    return orElse();
  }
}

abstract class LogoutEventData implements LoginEventData {
  const factory LogoutEventData() = _$LogoutEventDataImpl;
}

/// @nodoc
abstract class _$$ConnectionEventCheckDataImplCopyWith<$Res> {
  factory _$$ConnectionEventCheckDataImplCopyWith(
          _$ConnectionEventCheckDataImpl value,
          $Res Function(_$ConnectionEventCheckDataImpl) then) =
      __$$ConnectionEventCheckDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionEventCheckDataImplCopyWithImpl<$Res>
    extends _$LoginEventDataCopyWithImpl<$Res, _$ConnectionEventCheckDataImpl>
    implements _$$ConnectionEventCheckDataImplCopyWith<$Res> {
  __$$ConnectionEventCheckDataImplCopyWithImpl(
      _$ConnectionEventCheckDataImpl _value,
      $Res Function(_$ConnectionEventCheckDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectionEventCheckDataImpl implements ConnectionEventCheckData {
  const _$ConnectionEventCheckDataImpl();

  @override
  String toString() {
    return 'LoginEventData.connectionEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionEventCheckDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadEvent,
    required TResult Function() logoutEvent,
    required TResult Function() connectionEvent,
    required TResult Function(int progress) progressEvent,
  }) {
    return connectionEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadEvent,
    TResult? Function()? logoutEvent,
    TResult? Function()? connectionEvent,
    TResult? Function(int progress)? progressEvent,
  }) {
    return connectionEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadEvent,
    TResult Function()? logoutEvent,
    TResult Function()? connectionEvent,
    TResult Function(int progress)? progressEvent,
    required TResult orElse(),
  }) {
    if (connectionEvent != null) {
      return connectionEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginValidateEventData value) loadEvent,
    required TResult Function(LogoutEventData value) logoutEvent,
    required TResult Function(ConnectionEventCheckData value) connectionEvent,
    required TResult Function(ConnectionProgressEventData value) progressEvent,
  }) {
    return connectionEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginValidateEventData value)? loadEvent,
    TResult? Function(LogoutEventData value)? logoutEvent,
    TResult? Function(ConnectionEventCheckData value)? connectionEvent,
    TResult? Function(ConnectionProgressEventData value)? progressEvent,
  }) {
    return connectionEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginValidateEventData value)? loadEvent,
    TResult Function(LogoutEventData value)? logoutEvent,
    TResult Function(ConnectionEventCheckData value)? connectionEvent,
    TResult Function(ConnectionProgressEventData value)? progressEvent,
    required TResult orElse(),
  }) {
    if (connectionEvent != null) {
      return connectionEvent(this);
    }
    return orElse();
  }
}

abstract class ConnectionEventCheckData implements LoginEventData {
  const factory ConnectionEventCheckData() = _$ConnectionEventCheckDataImpl;
}

/// @nodoc
abstract class _$$ConnectionProgressEventDataImplCopyWith<$Res> {
  factory _$$ConnectionProgressEventDataImplCopyWith(
          _$ConnectionProgressEventDataImpl value,
          $Res Function(_$ConnectionProgressEventDataImpl) then) =
      __$$ConnectionProgressEventDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int progress});
}

/// @nodoc
class __$$ConnectionProgressEventDataImplCopyWithImpl<$Res>
    extends _$LoginEventDataCopyWithImpl<$Res,
        _$ConnectionProgressEventDataImpl>
    implements _$$ConnectionProgressEventDataImplCopyWith<$Res> {
  __$$ConnectionProgressEventDataImplCopyWithImpl(
      _$ConnectionProgressEventDataImpl _value,
      $Res Function(_$ConnectionProgressEventDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$ConnectionProgressEventDataImpl(
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ConnectionProgressEventDataImpl implements ConnectionProgressEventData {
  const _$ConnectionProgressEventDataImpl(this.progress);

  @override
  final int progress;

  @override
  String toString() {
    return 'LoginEventData.progressEvent(progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionProgressEventDataImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionProgressEventDataImplCopyWith<_$ConnectionProgressEventDataImpl>
      get copyWith => __$$ConnectionProgressEventDataImplCopyWithImpl<
          _$ConnectionProgressEventDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadEvent,
    required TResult Function() logoutEvent,
    required TResult Function() connectionEvent,
    required TResult Function(int progress) progressEvent,
  }) {
    return progressEvent(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadEvent,
    TResult? Function()? logoutEvent,
    TResult? Function()? connectionEvent,
    TResult? Function(int progress)? progressEvent,
  }) {
    return progressEvent?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadEvent,
    TResult Function()? logoutEvent,
    TResult Function()? connectionEvent,
    TResult Function(int progress)? progressEvent,
    required TResult orElse(),
  }) {
    if (progressEvent != null) {
      return progressEvent(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginValidateEventData value) loadEvent,
    required TResult Function(LogoutEventData value) logoutEvent,
    required TResult Function(ConnectionEventCheckData value) connectionEvent,
    required TResult Function(ConnectionProgressEventData value) progressEvent,
  }) {
    return progressEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginValidateEventData value)? loadEvent,
    TResult? Function(LogoutEventData value)? logoutEvent,
    TResult? Function(ConnectionEventCheckData value)? connectionEvent,
    TResult? Function(ConnectionProgressEventData value)? progressEvent,
  }) {
    return progressEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginValidateEventData value)? loadEvent,
    TResult Function(LogoutEventData value)? logoutEvent,
    TResult Function(ConnectionEventCheckData value)? connectionEvent,
    TResult Function(ConnectionProgressEventData value)? progressEvent,
    required TResult orElse(),
  }) {
    if (progressEvent != null) {
      return progressEvent(this);
    }
    return orElse();
  }
}

abstract class ConnectionProgressEventData implements LoginEventData {
  const factory ConnectionProgressEventData(final int progress) =
      _$ConnectionProgressEventDataImpl;

  int get progress;
  @JsonKey(ignore: true)
  _$$ConnectionProgressEventDataImplCopyWith<_$ConnectionProgressEventDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
