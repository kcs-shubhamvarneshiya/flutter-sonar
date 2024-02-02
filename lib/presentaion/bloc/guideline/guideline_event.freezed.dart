// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guideline_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GuidelineEvent {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) onItemTapEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? onItemTapEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? onItemTapEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GuidelineTapEvent value) onItemTapEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GuidelineTapEvent value)? onItemTapEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GuidelineTapEvent value)? onItemTapEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GuidelineEventCopyWith<GuidelineEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuidelineEventCopyWith<$Res> {
  factory $GuidelineEventCopyWith(
          GuidelineEvent value, $Res Function(GuidelineEvent) then) =
      _$GuidelineEventCopyWithImpl<$Res, GuidelineEvent>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$GuidelineEventCopyWithImpl<$Res, $Val extends GuidelineEvent>
    implements $GuidelineEventCopyWith<$Res> {
  _$GuidelineEventCopyWithImpl(this._value, this._then);

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
abstract class _$$GuidelineTapEventImplCopyWith<$Res>
    implements $GuidelineEventCopyWith<$Res> {
  factory _$$GuidelineTapEventImplCopyWith(_$GuidelineTapEventImpl value,
          $Res Function(_$GuidelineTapEventImpl) then) =
      __$$GuidelineTapEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$GuidelineTapEventImplCopyWithImpl<$Res>
    extends _$GuidelineEventCopyWithImpl<$Res, _$GuidelineTapEventImpl>
    implements _$$GuidelineTapEventImplCopyWith<$Res> {
  __$$GuidelineTapEventImplCopyWithImpl(_$GuidelineTapEventImpl _value,
      $Res Function(_$GuidelineTapEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$GuidelineTapEventImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GuidelineTapEventImpl implements GuidelineTapEvent {
  const _$GuidelineTapEventImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'GuidelineEvent.onItemTapEvent(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuidelineTapEventImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuidelineTapEventImplCopyWith<_$GuidelineTapEventImpl> get copyWith =>
      __$$GuidelineTapEventImplCopyWithImpl<_$GuidelineTapEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) onItemTapEvent,
  }) {
    return onItemTapEvent(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? onItemTapEvent,
  }) {
    return onItemTapEvent?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? onItemTapEvent,
    required TResult orElse(),
  }) {
    if (onItemTapEvent != null) {
      return onItemTapEvent(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GuidelineTapEvent value) onItemTapEvent,
  }) {
    return onItemTapEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GuidelineTapEvent value)? onItemTapEvent,
  }) {
    return onItemTapEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GuidelineTapEvent value)? onItemTapEvent,
    required TResult orElse(),
  }) {
    if (onItemTapEvent != null) {
      return onItemTapEvent(this);
    }
    return orElse();
  }
}

abstract class GuidelineTapEvent implements GuidelineEvent {
  const factory GuidelineTapEvent(final int index) = _$GuidelineTapEventImpl;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$GuidelineTapEventImplCopyWith<_$GuidelineTapEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
