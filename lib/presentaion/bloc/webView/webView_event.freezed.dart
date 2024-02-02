// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webView_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WebViewEvent {
  bool get isError => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isError, String code) webViewClickEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isError, String code)? webViewClickEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isError, String code)? webViewClickEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WebViewClickEvent value) webViewClickEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WebViewClickEvent value)? webViewClickEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WebViewClickEvent value)? webViewClickEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebViewEventCopyWith<WebViewEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebViewEventCopyWith<$Res> {
  factory $WebViewEventCopyWith(
          WebViewEvent value, $Res Function(WebViewEvent) then) =
      _$WebViewEventCopyWithImpl<$Res, WebViewEvent>;
  @useResult
  $Res call({bool isError, String code});
}

/// @nodoc
class _$WebViewEventCopyWithImpl<$Res, $Val extends WebViewEvent>
    implements $WebViewEventCopyWith<$Res> {
  _$WebViewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebViewClickEventImplCopyWith<$Res>
    implements $WebViewEventCopyWith<$Res> {
  factory _$$WebViewClickEventImplCopyWith(_$WebViewClickEventImpl value,
          $Res Function(_$WebViewClickEventImpl) then) =
      __$$WebViewClickEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isError, String code});
}

/// @nodoc
class __$$WebViewClickEventImplCopyWithImpl<$Res>
    extends _$WebViewEventCopyWithImpl<$Res, _$WebViewClickEventImpl>
    implements _$$WebViewClickEventImplCopyWith<$Res> {
  __$$WebViewClickEventImplCopyWithImpl(_$WebViewClickEventImpl _value,
      $Res Function(_$WebViewClickEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = null,
    Object? code = null,
  }) {
    return _then(_$WebViewClickEventImpl(
      null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WebViewClickEventImpl implements WebViewClickEvent {
  const _$WebViewClickEventImpl(this.isError, this.code);

  @override
  final bool isError;
  @override
  final String code;

  @override
  String toString() {
    return 'WebViewEvent.webViewClickEvent(isError: $isError, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebViewClickEventImpl &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isError, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebViewClickEventImplCopyWith<_$WebViewClickEventImpl> get copyWith =>
      __$$WebViewClickEventImplCopyWithImpl<_$WebViewClickEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isError, String code) webViewClickEvent,
  }) {
    return webViewClickEvent(isError, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isError, String code)? webViewClickEvent,
  }) {
    return webViewClickEvent?.call(isError, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isError, String code)? webViewClickEvent,
    required TResult orElse(),
  }) {
    if (webViewClickEvent != null) {
      return webViewClickEvent(isError, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WebViewClickEvent value) webViewClickEvent,
  }) {
    return webViewClickEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WebViewClickEvent value)? webViewClickEvent,
  }) {
    return webViewClickEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WebViewClickEvent value)? webViewClickEvent,
    required TResult orElse(),
  }) {
    if (webViewClickEvent != null) {
      return webViewClickEvent(this);
    }
    return orElse();
  }
}

abstract class WebViewClickEvent implements WebViewEvent {
  const factory WebViewClickEvent(final bool isError, final String code) =
      _$WebViewClickEventImpl;

  @override
  bool get isError;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$WebViewClickEventImplCopyWith<_$WebViewClickEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
