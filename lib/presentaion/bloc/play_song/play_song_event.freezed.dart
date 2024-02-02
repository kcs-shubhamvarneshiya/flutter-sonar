// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_song_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaySongEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String videoUrl) playNetworkSongEvent,
    required TResult Function() pauseNetworkSongEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String videoUrl)? playNetworkSongEvent,
    TResult? Function()? pauseNetworkSongEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String videoUrl)? playNetworkSongEvent,
    TResult Function()? pauseNetworkSongEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayNetworkSongEvent value) playNetworkSongEvent,
    required TResult Function(PauseNetworkSongEvent value)
        pauseNetworkSongEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlayNetworkSongEvent value)? playNetworkSongEvent,
    TResult? Function(PauseNetworkSongEvent value)? pauseNetworkSongEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayNetworkSongEvent value)? playNetworkSongEvent,
    TResult Function(PauseNetworkSongEvent value)? pauseNetworkSongEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaySongEventCopyWith<$Res> {
  factory $PlaySongEventCopyWith(
          PlaySongEvent value, $Res Function(PlaySongEvent) then) =
      _$PlaySongEventCopyWithImpl<$Res, PlaySongEvent>;
}

/// @nodoc
class _$PlaySongEventCopyWithImpl<$Res, $Val extends PlaySongEvent>
    implements $PlaySongEventCopyWith<$Res> {
  _$PlaySongEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlayNetworkSongEventImplCopyWith<$Res> {
  factory _$$PlayNetworkSongEventImplCopyWith(_$PlayNetworkSongEventImpl value,
          $Res Function(_$PlayNetworkSongEventImpl) then) =
      __$$PlayNetworkSongEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String videoUrl});
}

/// @nodoc
class __$$PlayNetworkSongEventImplCopyWithImpl<$Res>
    extends _$PlaySongEventCopyWithImpl<$Res, _$PlayNetworkSongEventImpl>
    implements _$$PlayNetworkSongEventImplCopyWith<$Res> {
  __$$PlayNetworkSongEventImplCopyWithImpl(_$PlayNetworkSongEventImpl _value,
      $Res Function(_$PlayNetworkSongEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
  }) {
    return _then(_$PlayNetworkSongEventImpl(
      null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlayNetworkSongEventImpl implements PlayNetworkSongEvent {
  const _$PlayNetworkSongEventImpl(this.videoUrl);

  @override
  final String videoUrl;

  @override
  String toString() {
    return 'PlaySongEvent.playNetworkSongEvent(videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayNetworkSongEventImpl &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayNetworkSongEventImplCopyWith<_$PlayNetworkSongEventImpl>
      get copyWith =>
          __$$PlayNetworkSongEventImplCopyWithImpl<_$PlayNetworkSongEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String videoUrl) playNetworkSongEvent,
    required TResult Function() pauseNetworkSongEvent,
  }) {
    return playNetworkSongEvent(videoUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String videoUrl)? playNetworkSongEvent,
    TResult? Function()? pauseNetworkSongEvent,
  }) {
    return playNetworkSongEvent?.call(videoUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String videoUrl)? playNetworkSongEvent,
    TResult Function()? pauseNetworkSongEvent,
    required TResult orElse(),
  }) {
    if (playNetworkSongEvent != null) {
      return playNetworkSongEvent(videoUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayNetworkSongEvent value) playNetworkSongEvent,
    required TResult Function(PauseNetworkSongEvent value)
        pauseNetworkSongEvent,
  }) {
    return playNetworkSongEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlayNetworkSongEvent value)? playNetworkSongEvent,
    TResult? Function(PauseNetworkSongEvent value)? pauseNetworkSongEvent,
  }) {
    return playNetworkSongEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayNetworkSongEvent value)? playNetworkSongEvent,
    TResult Function(PauseNetworkSongEvent value)? pauseNetworkSongEvent,
    required TResult orElse(),
  }) {
    if (playNetworkSongEvent != null) {
      return playNetworkSongEvent(this);
    }
    return orElse();
  }
}

abstract class PlayNetworkSongEvent implements PlaySongEvent {
  const factory PlayNetworkSongEvent(final String videoUrl) =
      _$PlayNetworkSongEventImpl;

  String get videoUrl;
  @JsonKey(ignore: true)
  _$$PlayNetworkSongEventImplCopyWith<_$PlayNetworkSongEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseNetworkSongEventImplCopyWith<$Res> {
  factory _$$PauseNetworkSongEventImplCopyWith(
          _$PauseNetworkSongEventImpl value,
          $Res Function(_$PauseNetworkSongEventImpl) then) =
      __$$PauseNetworkSongEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseNetworkSongEventImplCopyWithImpl<$Res>
    extends _$PlaySongEventCopyWithImpl<$Res, _$PauseNetworkSongEventImpl>
    implements _$$PauseNetworkSongEventImplCopyWith<$Res> {
  __$$PauseNetworkSongEventImplCopyWithImpl(_$PauseNetworkSongEventImpl _value,
      $Res Function(_$PauseNetworkSongEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PauseNetworkSongEventImpl implements PauseNetworkSongEvent {
  const _$PauseNetworkSongEventImpl();

  @override
  String toString() {
    return 'PlaySongEvent.pauseNetworkSongEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseNetworkSongEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String videoUrl) playNetworkSongEvent,
    required TResult Function() pauseNetworkSongEvent,
  }) {
    return pauseNetworkSongEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String videoUrl)? playNetworkSongEvent,
    TResult? Function()? pauseNetworkSongEvent,
  }) {
    return pauseNetworkSongEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String videoUrl)? playNetworkSongEvent,
    TResult Function()? pauseNetworkSongEvent,
    required TResult orElse(),
  }) {
    if (pauseNetworkSongEvent != null) {
      return pauseNetworkSongEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayNetworkSongEvent value) playNetworkSongEvent,
    required TResult Function(PauseNetworkSongEvent value)
        pauseNetworkSongEvent,
  }) {
    return pauseNetworkSongEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlayNetworkSongEvent value)? playNetworkSongEvent,
    TResult? Function(PauseNetworkSongEvent value)? pauseNetworkSongEvent,
  }) {
    return pauseNetworkSongEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayNetworkSongEvent value)? playNetworkSongEvent,
    TResult Function(PauseNetworkSongEvent value)? pauseNetworkSongEvent,
    required TResult orElse(),
  }) {
    if (pauseNetworkSongEvent != null) {
      return pauseNetworkSongEvent(this);
    }
    return orElse();
  }
}

abstract class PauseNetworkSongEvent implements PlaySongEvent {
  const factory PauseNetworkSongEvent() = _$PauseNetworkSongEventImpl;
}
