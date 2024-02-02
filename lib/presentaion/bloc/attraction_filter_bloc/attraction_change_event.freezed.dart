// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attraction_change_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AttractionChangeEvent {
  bool get checked => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  bool get isListScreen => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool checked, int index, String value, bool isListScreen)
        tap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool checked, int index, String value, bool isListScreen)?
        tap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool checked, int index, String value, bool isListScreen)?
        tap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttractionChangeEventData value) tap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttractionChangeEventData value)? tap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttractionChangeEventData value)? tap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttractionChangeEventCopyWith<AttractionChangeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttractionChangeEventCopyWith<$Res> {
  factory $AttractionChangeEventCopyWith(AttractionChangeEvent value,
          $Res Function(AttractionChangeEvent) then) =
      _$AttractionChangeEventCopyWithImpl<$Res, AttractionChangeEvent>;
  @useResult
  $Res call({bool checked, int index, String value, bool isListScreen});
}

/// @nodoc
class _$AttractionChangeEventCopyWithImpl<$Res,
        $Val extends AttractionChangeEvent>
    implements $AttractionChangeEventCopyWith<$Res> {
  _$AttractionChangeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checked = null,
    Object? index = null,
    Object? value = null,
    Object? isListScreen = null,
  }) {
    return _then(_value.copyWith(
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isListScreen: null == isListScreen
          ? _value.isListScreen
          : isListScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttractionChangeEventDataImplCopyWith<$Res>
    implements $AttractionChangeEventCopyWith<$Res> {
  factory _$$AttractionChangeEventDataImplCopyWith(
          _$AttractionChangeEventDataImpl value,
          $Res Function(_$AttractionChangeEventDataImpl) then) =
      __$$AttractionChangeEventDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool checked, int index, String value, bool isListScreen});
}

/// @nodoc
class __$$AttractionChangeEventDataImplCopyWithImpl<$Res>
    extends _$AttractionChangeEventCopyWithImpl<$Res,
        _$AttractionChangeEventDataImpl>
    implements _$$AttractionChangeEventDataImplCopyWith<$Res> {
  __$$AttractionChangeEventDataImplCopyWithImpl(
      _$AttractionChangeEventDataImpl _value,
      $Res Function(_$AttractionChangeEventDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checked = null,
    Object? index = null,
    Object? value = null,
    Object? isListScreen = null,
  }) {
    return _then(_$AttractionChangeEventDataImpl(
      null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      null == isListScreen
          ? _value.isListScreen
          : isListScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AttractionChangeEventDataImpl implements AttractionChangeEventData {
  _$AttractionChangeEventDataImpl(
      this.checked, this.index, this.value, this.isListScreen);

  @override
  final bool checked;
  @override
  final int index;
  @override
  final String value;
  @override
  final bool isListScreen;

  @override
  String toString() {
    return 'AttractionChangeEvent.tap(checked: $checked, index: $index, value: $value, isListScreen: $isListScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttractionChangeEventDataImpl &&
            (identical(other.checked, checked) || other.checked == checked) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isListScreen, isListScreen) ||
                other.isListScreen == isListScreen));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, checked, index, value, isListScreen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttractionChangeEventDataImplCopyWith<_$AttractionChangeEventDataImpl>
      get copyWith => __$$AttractionChangeEventDataImplCopyWithImpl<
          _$AttractionChangeEventDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool checked, int index, String value, bool isListScreen)
        tap,
  }) {
    return tap(checked, index, value, isListScreen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool checked, int index, String value, bool isListScreen)?
        tap,
  }) {
    return tap?.call(checked, index, value, isListScreen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool checked, int index, String value, bool isListScreen)?
        tap,
    required TResult orElse(),
  }) {
    if (tap != null) {
      return tap(checked, index, value, isListScreen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttractionChangeEventData value) tap,
  }) {
    return tap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttractionChangeEventData value)? tap,
  }) {
    return tap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttractionChangeEventData value)? tap,
    required TResult orElse(),
  }) {
    if (tap != null) {
      return tap(this);
    }
    return orElse();
  }
}

abstract class AttractionChangeEventData implements AttractionChangeEvent {
  factory AttractionChangeEventData(
      final bool checked,
      final int index,
      final String value,
      final bool isListScreen) = _$AttractionChangeEventDataImpl;

  @override
  bool get checked;
  @override
  int get index;
  @override
  String get value;
  @override
  bool get isListScreen;
  @override
  @JsonKey(ignore: true)
  _$$AttractionChangeEventDataImplCopyWith<_$AttractionChangeEventDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
