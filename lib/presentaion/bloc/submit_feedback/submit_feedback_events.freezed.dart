// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_feedback_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitFeedbackEvent {
  List<Record> get record => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Record> record) loadUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Record> record)? loadUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Record> record)? loadUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubmitFeedbackData value) loadUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubmitFeedbackData value)? loadUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubmitFeedbackData value)? loadUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitFeedbackEventCopyWith<SubmitFeedbackEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitFeedbackEventCopyWith<$Res> {
  factory $SubmitFeedbackEventCopyWith(
          SubmitFeedbackEvent value, $Res Function(SubmitFeedbackEvent) then) =
      _$SubmitFeedbackEventCopyWithImpl<$Res, SubmitFeedbackEvent>;
  @useResult
  $Res call({List<Record> record});
}

/// @nodoc
class _$SubmitFeedbackEventCopyWithImpl<$Res, $Val extends SubmitFeedbackEvent>
    implements $SubmitFeedbackEventCopyWith<$Res> {
  _$SubmitFeedbackEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_value.copyWith(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as List<Record>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitFeedbackDataImplCopyWith<$Res>
    implements $SubmitFeedbackEventCopyWith<$Res> {
  factory _$$SubmitFeedbackDataImplCopyWith(_$SubmitFeedbackDataImpl value,
          $Res Function(_$SubmitFeedbackDataImpl) then) =
      __$$SubmitFeedbackDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Record> record});
}

/// @nodoc
class __$$SubmitFeedbackDataImplCopyWithImpl<$Res>
    extends _$SubmitFeedbackEventCopyWithImpl<$Res, _$SubmitFeedbackDataImpl>
    implements _$$SubmitFeedbackDataImplCopyWith<$Res> {
  __$$SubmitFeedbackDataImplCopyWithImpl(_$SubmitFeedbackDataImpl _value,
      $Res Function(_$SubmitFeedbackDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$SubmitFeedbackDataImpl(
      null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<Record>,
    ));
  }
}

/// @nodoc

class _$SubmitFeedbackDataImpl implements SubmitFeedbackData {
  const _$SubmitFeedbackDataImpl(final List<Record> record) : _record = record;

  final List<Record> _record;
  @override
  List<Record> get record {
    if (_record is EqualUnmodifiableListView) return _record;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'SubmitFeedbackEvent.loadUserEvent(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitFeedbackDataImpl &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitFeedbackDataImplCopyWith<_$SubmitFeedbackDataImpl> get copyWith =>
      __$$SubmitFeedbackDataImplCopyWithImpl<_$SubmitFeedbackDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Record> record) loadUserEvent,
  }) {
    return loadUserEvent(record);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Record> record)? loadUserEvent,
  }) {
    return loadUserEvent?.call(record);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Record> record)? loadUserEvent,
    required TResult orElse(),
  }) {
    if (loadUserEvent != null) {
      return loadUserEvent(record);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubmitFeedbackData value) loadUserEvent,
  }) {
    return loadUserEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubmitFeedbackData value)? loadUserEvent,
  }) {
    return loadUserEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubmitFeedbackData value)? loadUserEvent,
    required TResult orElse(),
  }) {
    if (loadUserEvent != null) {
      return loadUserEvent(this);
    }
    return orElse();
  }
}

abstract class SubmitFeedbackData implements SubmitFeedbackEvent {
  const factory SubmitFeedbackData(final List<Record> record) =
      _$SubmitFeedbackDataImpl;

  @override
  List<Record> get record;
  @override
  @JsonKey(ignore: true)
  _$$SubmitFeedbackDataImplCopyWith<_$SubmitFeedbackDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
