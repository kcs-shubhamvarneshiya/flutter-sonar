// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_song_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaySongState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playerInitialState,
    required TResult Function(AudioPlayer assetsPlayer, String videoUrl)
        playNetworkSongState,
    required TResult Function(AudioPlayer assetsPlayer) pauseNetworkSongState,
    required TResult Function(String error) errorNetworkSongState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playerInitialState,
    TResult? Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult? Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult? Function(String error)? errorNetworkSongState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playerInitialState,
    TResult Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult Function(String error)? errorNetworkSongState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayerInitialState value) playerInitialState,
    required TResult Function(_PlayNetworkSongState value) playNetworkSongState,
    required TResult Function(_PauseNetworkSongState value)
        pauseNetworkSongState,
    required TResult Function(_ErrorNetworkSongState value)
        errorNetworkSongState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlayerInitialState value)? playerInitialState,
    TResult? Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult? Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult? Function(_ErrorNetworkSongState value)? errorNetworkSongState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayerInitialState value)? playerInitialState,
    TResult Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult Function(_ErrorNetworkSongState value)? errorNetworkSongState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaySongStateCopyWith<$Res> {
  factory $PlaySongStateCopyWith(
          PlaySongState value, $Res Function(PlaySongState) then) =
      _$PlaySongStateCopyWithImpl<$Res, PlaySongState>;
}

/// @nodoc
class _$PlaySongStateCopyWithImpl<$Res, $Val extends PlaySongState>
    implements $PlaySongStateCopyWith<$Res> {
  _$PlaySongStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlayerInitialStateImplCopyWith<$Res> {
  factory _$$PlayerInitialStateImplCopyWith(_$PlayerInitialStateImpl value,
          $Res Function(_$PlayerInitialStateImpl) then) =
      __$$PlayerInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayerInitialStateImplCopyWithImpl<$Res>
    extends _$PlaySongStateCopyWithImpl<$Res, _$PlayerInitialStateImpl>
    implements _$$PlayerInitialStateImplCopyWith<$Res> {
  __$$PlayerInitialStateImplCopyWithImpl(_$PlayerInitialStateImpl _value,
      $Res Function(_$PlayerInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlayerInitialStateImpl implements _PlayerInitialState {
  const _$PlayerInitialStateImpl();

  @override
  String toString() {
    return 'PlaySongState.playerInitialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlayerInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playerInitialState,
    required TResult Function(AudioPlayer assetsPlayer, String videoUrl)
        playNetworkSongState,
    required TResult Function(AudioPlayer assetsPlayer) pauseNetworkSongState,
    required TResult Function(String error) errorNetworkSongState,
  }) {
    return playerInitialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playerInitialState,
    TResult? Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult? Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult? Function(String error)? errorNetworkSongState,
  }) {
    return playerInitialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playerInitialState,
    TResult Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult Function(String error)? errorNetworkSongState,
    required TResult orElse(),
  }) {
    if (playerInitialState != null) {
      return playerInitialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayerInitialState value) playerInitialState,
    required TResult Function(_PlayNetworkSongState value) playNetworkSongState,
    required TResult Function(_PauseNetworkSongState value)
        pauseNetworkSongState,
    required TResult Function(_ErrorNetworkSongState value)
        errorNetworkSongState,
  }) {
    return playerInitialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlayerInitialState value)? playerInitialState,
    TResult? Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult? Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult? Function(_ErrorNetworkSongState value)? errorNetworkSongState,
  }) {
    return playerInitialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayerInitialState value)? playerInitialState,
    TResult Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult Function(_ErrorNetworkSongState value)? errorNetworkSongState,
    required TResult orElse(),
  }) {
    if (playerInitialState != null) {
      return playerInitialState(this);
    }
    return orElse();
  }
}

abstract class _PlayerInitialState implements PlaySongState {
  const factory _PlayerInitialState() = _$PlayerInitialStateImpl;
}

/// @nodoc
abstract class _$$PlayNetworkSongStateImplCopyWith<$Res> {
  factory _$$PlayNetworkSongStateImplCopyWith(_$PlayNetworkSongStateImpl value,
          $Res Function(_$PlayNetworkSongStateImpl) then) =
      __$$PlayNetworkSongStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AudioPlayer assetsPlayer, String videoUrl});
}

/// @nodoc
class __$$PlayNetworkSongStateImplCopyWithImpl<$Res>
    extends _$PlaySongStateCopyWithImpl<$Res, _$PlayNetworkSongStateImpl>
    implements _$$PlayNetworkSongStateImplCopyWith<$Res> {
  __$$PlayNetworkSongStateImplCopyWithImpl(_$PlayNetworkSongStateImpl _value,
      $Res Function(_$PlayNetworkSongStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetsPlayer = null,
    Object? videoUrl = null,
  }) {
    return _then(_$PlayNetworkSongStateImpl(
      null == assetsPlayer
          ? _value.assetsPlayer
          : assetsPlayer // ignore: cast_nullable_to_non_nullable
              as AudioPlayer,
      null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlayNetworkSongStateImpl implements _PlayNetworkSongState {
  const _$PlayNetworkSongStateImpl(this.assetsPlayer, this.videoUrl);

  @override
  final AudioPlayer assetsPlayer;
  @override
  final String videoUrl;

  @override
  String toString() {
    return 'PlaySongState.playNetworkSongState(assetsPlayer: $assetsPlayer, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayNetworkSongStateImpl &&
            (identical(other.assetsPlayer, assetsPlayer) ||
                other.assetsPlayer == assetsPlayer) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assetsPlayer, videoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayNetworkSongStateImplCopyWith<_$PlayNetworkSongStateImpl>
      get copyWith =>
          __$$PlayNetworkSongStateImplCopyWithImpl<_$PlayNetworkSongStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playerInitialState,
    required TResult Function(AudioPlayer assetsPlayer, String videoUrl)
        playNetworkSongState,
    required TResult Function(AudioPlayer assetsPlayer) pauseNetworkSongState,
    required TResult Function(String error) errorNetworkSongState,
  }) {
    return playNetworkSongState(assetsPlayer, videoUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playerInitialState,
    TResult? Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult? Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult? Function(String error)? errorNetworkSongState,
  }) {
    return playNetworkSongState?.call(assetsPlayer, videoUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playerInitialState,
    TResult Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult Function(String error)? errorNetworkSongState,
    required TResult orElse(),
  }) {
    if (playNetworkSongState != null) {
      return playNetworkSongState(assetsPlayer, videoUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayerInitialState value) playerInitialState,
    required TResult Function(_PlayNetworkSongState value) playNetworkSongState,
    required TResult Function(_PauseNetworkSongState value)
        pauseNetworkSongState,
    required TResult Function(_ErrorNetworkSongState value)
        errorNetworkSongState,
  }) {
    return playNetworkSongState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlayerInitialState value)? playerInitialState,
    TResult? Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult? Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult? Function(_ErrorNetworkSongState value)? errorNetworkSongState,
  }) {
    return playNetworkSongState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayerInitialState value)? playerInitialState,
    TResult Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult Function(_ErrorNetworkSongState value)? errorNetworkSongState,
    required TResult orElse(),
  }) {
    if (playNetworkSongState != null) {
      return playNetworkSongState(this);
    }
    return orElse();
  }
}

abstract class _PlayNetworkSongState implements PlaySongState {
  const factory _PlayNetworkSongState(
          final AudioPlayer assetsPlayer, final String videoUrl) =
      _$PlayNetworkSongStateImpl;

  AudioPlayer get assetsPlayer;
  String get videoUrl;
  @JsonKey(ignore: true)
  _$$PlayNetworkSongStateImplCopyWith<_$PlayNetworkSongStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseNetworkSongStateImplCopyWith<$Res> {
  factory _$$PauseNetworkSongStateImplCopyWith(
          _$PauseNetworkSongStateImpl value,
          $Res Function(_$PauseNetworkSongStateImpl) then) =
      __$$PauseNetworkSongStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AudioPlayer assetsPlayer});
}

/// @nodoc
class __$$PauseNetworkSongStateImplCopyWithImpl<$Res>
    extends _$PlaySongStateCopyWithImpl<$Res, _$PauseNetworkSongStateImpl>
    implements _$$PauseNetworkSongStateImplCopyWith<$Res> {
  __$$PauseNetworkSongStateImplCopyWithImpl(_$PauseNetworkSongStateImpl _value,
      $Res Function(_$PauseNetworkSongStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetsPlayer = null,
  }) {
    return _then(_$PauseNetworkSongStateImpl(
      null == assetsPlayer
          ? _value.assetsPlayer
          : assetsPlayer // ignore: cast_nullable_to_non_nullable
              as AudioPlayer,
    ));
  }
}

/// @nodoc

class _$PauseNetworkSongStateImpl implements _PauseNetworkSongState {
  const _$PauseNetworkSongStateImpl(this.assetsPlayer);

  @override
  final AudioPlayer assetsPlayer;

  @override
  String toString() {
    return 'PlaySongState.pauseNetworkSongState(assetsPlayer: $assetsPlayer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseNetworkSongStateImpl &&
            (identical(other.assetsPlayer, assetsPlayer) ||
                other.assetsPlayer == assetsPlayer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assetsPlayer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseNetworkSongStateImplCopyWith<_$PauseNetworkSongStateImpl>
      get copyWith => __$$PauseNetworkSongStateImplCopyWithImpl<
          _$PauseNetworkSongStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playerInitialState,
    required TResult Function(AudioPlayer assetsPlayer, String videoUrl)
        playNetworkSongState,
    required TResult Function(AudioPlayer assetsPlayer) pauseNetworkSongState,
    required TResult Function(String error) errorNetworkSongState,
  }) {
    return pauseNetworkSongState(assetsPlayer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playerInitialState,
    TResult? Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult? Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult? Function(String error)? errorNetworkSongState,
  }) {
    return pauseNetworkSongState?.call(assetsPlayer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playerInitialState,
    TResult Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult Function(String error)? errorNetworkSongState,
    required TResult orElse(),
  }) {
    if (pauseNetworkSongState != null) {
      return pauseNetworkSongState(assetsPlayer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayerInitialState value) playerInitialState,
    required TResult Function(_PlayNetworkSongState value) playNetworkSongState,
    required TResult Function(_PauseNetworkSongState value)
        pauseNetworkSongState,
    required TResult Function(_ErrorNetworkSongState value)
        errorNetworkSongState,
  }) {
    return pauseNetworkSongState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlayerInitialState value)? playerInitialState,
    TResult? Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult? Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult? Function(_ErrorNetworkSongState value)? errorNetworkSongState,
  }) {
    return pauseNetworkSongState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayerInitialState value)? playerInitialState,
    TResult Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult Function(_ErrorNetworkSongState value)? errorNetworkSongState,
    required TResult orElse(),
  }) {
    if (pauseNetworkSongState != null) {
      return pauseNetworkSongState(this);
    }
    return orElse();
  }
}

abstract class _PauseNetworkSongState implements PlaySongState {
  const factory _PauseNetworkSongState(final AudioPlayer assetsPlayer) =
      _$PauseNetworkSongStateImpl;

  AudioPlayer get assetsPlayer;
  @JsonKey(ignore: true)
  _$$PauseNetworkSongStateImplCopyWith<_$PauseNetworkSongStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorNetworkSongStateImplCopyWith<$Res> {
  factory _$$ErrorNetworkSongStateImplCopyWith(
          _$ErrorNetworkSongStateImpl value,
          $Res Function(_$ErrorNetworkSongStateImpl) then) =
      __$$ErrorNetworkSongStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorNetworkSongStateImplCopyWithImpl<$Res>
    extends _$PlaySongStateCopyWithImpl<$Res, _$ErrorNetworkSongStateImpl>
    implements _$$ErrorNetworkSongStateImplCopyWith<$Res> {
  __$$ErrorNetworkSongStateImplCopyWithImpl(_$ErrorNetworkSongStateImpl _value,
      $Res Function(_$ErrorNetworkSongStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorNetworkSongStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorNetworkSongStateImpl implements _ErrorNetworkSongState {
  const _$ErrorNetworkSongStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PlaySongState.errorNetworkSongState(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorNetworkSongStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorNetworkSongStateImplCopyWith<_$ErrorNetworkSongStateImpl>
      get copyWith => __$$ErrorNetworkSongStateImplCopyWithImpl<
          _$ErrorNetworkSongStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playerInitialState,
    required TResult Function(AudioPlayer assetsPlayer, String videoUrl)
        playNetworkSongState,
    required TResult Function(AudioPlayer assetsPlayer) pauseNetworkSongState,
    required TResult Function(String error) errorNetworkSongState,
  }) {
    return errorNetworkSongState(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playerInitialState,
    TResult? Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult? Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult? Function(String error)? errorNetworkSongState,
  }) {
    return errorNetworkSongState?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playerInitialState,
    TResult Function(AudioPlayer assetsPlayer, String videoUrl)?
        playNetworkSongState,
    TResult Function(AudioPlayer assetsPlayer)? pauseNetworkSongState,
    TResult Function(String error)? errorNetworkSongState,
    required TResult orElse(),
  }) {
    if (errorNetworkSongState != null) {
      return errorNetworkSongState(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PlayerInitialState value) playerInitialState,
    required TResult Function(_PlayNetworkSongState value) playNetworkSongState,
    required TResult Function(_PauseNetworkSongState value)
        pauseNetworkSongState,
    required TResult Function(_ErrorNetworkSongState value)
        errorNetworkSongState,
  }) {
    return errorNetworkSongState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PlayerInitialState value)? playerInitialState,
    TResult? Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult? Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult? Function(_ErrorNetworkSongState value)? errorNetworkSongState,
  }) {
    return errorNetworkSongState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PlayerInitialState value)? playerInitialState,
    TResult Function(_PlayNetworkSongState value)? playNetworkSongState,
    TResult Function(_PauseNetworkSongState value)? pauseNetworkSongState,
    TResult Function(_ErrorNetworkSongState value)? errorNetworkSongState,
    required TResult orElse(),
  }) {
    if (errorNetworkSongState != null) {
      return errorNetworkSongState(this);
    }
    return orElse();
  }
}

abstract class _ErrorNetworkSongState implements PlaySongState {
  const factory _ErrorNetworkSongState(final String error) =
      _$ErrorNetworkSongStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorNetworkSongStateImplCopyWith<_$ErrorNetworkSongStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
