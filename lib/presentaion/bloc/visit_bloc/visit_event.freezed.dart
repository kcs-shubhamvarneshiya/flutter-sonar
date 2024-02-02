// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VisitEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVisitEvent,
    required TResult Function() loadVisitActivityEvent,
    required TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)
        addActivityEvent,
    required TResult Function(int attractionId) removeVisitItemEvent,
    required TResult Function() removeAllVisitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVisitEvent,
    TResult? Function()? loadVisitActivityEvent,
    TResult? Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult? Function(int attractionId)? removeVisitItemEvent,
    TResult? Function()? removeAllVisitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVisitEvent,
    TResult Function()? loadVisitActivityEvent,
    TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult Function(int attractionId)? removeVisitItemEvent,
    TResult Function()? removeAllVisitEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VisitLoadEvent value) loadVisitEvent,
    required TResult Function(VisitActivityLoadEvent value)
        loadVisitActivityEvent,
    required TResult Function(VisitAddActivityEvent value) addActivityEvent,
    required TResult Function(VisitRemoveItemEvent value) removeVisitItemEvent,
    required TResult Function(VisitRemoveAllEvent value) removeAllVisitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VisitLoadEvent value)? loadVisitEvent,
    TResult? Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult? Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult? Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult? Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VisitLoadEvent value)? loadVisitEvent,
    TResult Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitEventCopyWith<$Res> {
  factory $VisitEventCopyWith(
          VisitEvent value, $Res Function(VisitEvent) then) =
      _$VisitEventCopyWithImpl<$Res, VisitEvent>;
}

/// @nodoc
class _$VisitEventCopyWithImpl<$Res, $Val extends VisitEvent>
    implements $VisitEventCopyWith<$Res> {
  _$VisitEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$VisitLoadEventImplCopyWith<$Res> {
  factory _$$VisitLoadEventImplCopyWith(_$VisitLoadEventImpl value,
          $Res Function(_$VisitLoadEventImpl) then) =
      __$$VisitLoadEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VisitLoadEventImplCopyWithImpl<$Res>
    extends _$VisitEventCopyWithImpl<$Res, _$VisitLoadEventImpl>
    implements _$$VisitLoadEventImplCopyWith<$Res> {
  __$$VisitLoadEventImplCopyWithImpl(
      _$VisitLoadEventImpl _value, $Res Function(_$VisitLoadEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VisitLoadEventImpl implements VisitLoadEvent {
  const _$VisitLoadEventImpl();

  @override
  String toString() {
    return 'VisitEvent.loadVisitEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VisitLoadEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVisitEvent,
    required TResult Function() loadVisitActivityEvent,
    required TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)
        addActivityEvent,
    required TResult Function(int attractionId) removeVisitItemEvent,
    required TResult Function() removeAllVisitEvent,
  }) {
    return loadVisitEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVisitEvent,
    TResult? Function()? loadVisitActivityEvent,
    TResult? Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult? Function(int attractionId)? removeVisitItemEvent,
    TResult? Function()? removeAllVisitEvent,
  }) {
    return loadVisitEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVisitEvent,
    TResult Function()? loadVisitActivityEvent,
    TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult Function(int attractionId)? removeVisitItemEvent,
    TResult Function()? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (loadVisitEvent != null) {
      return loadVisitEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VisitLoadEvent value) loadVisitEvent,
    required TResult Function(VisitActivityLoadEvent value)
        loadVisitActivityEvent,
    required TResult Function(VisitAddActivityEvent value) addActivityEvent,
    required TResult Function(VisitRemoveItemEvent value) removeVisitItemEvent,
    required TResult Function(VisitRemoveAllEvent value) removeAllVisitEvent,
  }) {
    return loadVisitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VisitLoadEvent value)? loadVisitEvent,
    TResult? Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult? Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult? Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult? Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
  }) {
    return loadVisitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VisitLoadEvent value)? loadVisitEvent,
    TResult Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (loadVisitEvent != null) {
      return loadVisitEvent(this);
    }
    return orElse();
  }
}

abstract class VisitLoadEvent implements VisitEvent {
  const factory VisitLoadEvent() = _$VisitLoadEventImpl;
}

/// @nodoc
abstract class _$$VisitActivityLoadEventImplCopyWith<$Res> {
  factory _$$VisitActivityLoadEventImplCopyWith(
          _$VisitActivityLoadEventImpl value,
          $Res Function(_$VisitActivityLoadEventImpl) then) =
      __$$VisitActivityLoadEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VisitActivityLoadEventImplCopyWithImpl<$Res>
    extends _$VisitEventCopyWithImpl<$Res, _$VisitActivityLoadEventImpl>
    implements _$$VisitActivityLoadEventImplCopyWith<$Res> {
  __$$VisitActivityLoadEventImplCopyWithImpl(
      _$VisitActivityLoadEventImpl _value,
      $Res Function(_$VisitActivityLoadEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VisitActivityLoadEventImpl implements VisitActivityLoadEvent {
  const _$VisitActivityLoadEventImpl();

  @override
  String toString() {
    return 'VisitEvent.loadVisitActivityEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitActivityLoadEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVisitEvent,
    required TResult Function() loadVisitActivityEvent,
    required TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)
        addActivityEvent,
    required TResult Function(int attractionId) removeVisitItemEvent,
    required TResult Function() removeAllVisitEvent,
  }) {
    return loadVisitActivityEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVisitEvent,
    TResult? Function()? loadVisitActivityEvent,
    TResult? Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult? Function(int attractionId)? removeVisitItemEvent,
    TResult? Function()? removeAllVisitEvent,
  }) {
    return loadVisitActivityEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVisitEvent,
    TResult Function()? loadVisitActivityEvent,
    TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult Function(int attractionId)? removeVisitItemEvent,
    TResult Function()? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (loadVisitActivityEvent != null) {
      return loadVisitActivityEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VisitLoadEvent value) loadVisitEvent,
    required TResult Function(VisitActivityLoadEvent value)
        loadVisitActivityEvent,
    required TResult Function(VisitAddActivityEvent value) addActivityEvent,
    required TResult Function(VisitRemoveItemEvent value) removeVisitItemEvent,
    required TResult Function(VisitRemoveAllEvent value) removeAllVisitEvent,
  }) {
    return loadVisitActivityEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VisitLoadEvent value)? loadVisitEvent,
    TResult? Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult? Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult? Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult? Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
  }) {
    return loadVisitActivityEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VisitLoadEvent value)? loadVisitEvent,
    TResult Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (loadVisitActivityEvent != null) {
      return loadVisitActivityEvent(this);
    }
    return orElse();
  }
}

abstract class VisitActivityLoadEvent implements VisitEvent {
  const factory VisitActivityLoadEvent() = _$VisitActivityLoadEventImpl;
}

/// @nodoc
abstract class _$$VisitAddActivityEventImplCopyWith<$Res> {
  factory _$$VisitAddActivityEventImplCopyWith(
          _$VisitAddActivityEventImpl value,
          $Res Function(_$VisitAddActivityEventImpl) then) =
      __$$VisitAddActivityEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Attraction attractionItem, bool isVisit, BuildContext context});
}

/// @nodoc
class __$$VisitAddActivityEventImplCopyWithImpl<$Res>
    extends _$VisitEventCopyWithImpl<$Res, _$VisitAddActivityEventImpl>
    implements _$$VisitAddActivityEventImplCopyWith<$Res> {
  __$$VisitAddActivityEventImplCopyWithImpl(_$VisitAddActivityEventImpl _value,
      $Res Function(_$VisitAddActivityEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attractionItem = null,
    Object? isVisit = null,
    Object? context = null,
  }) {
    return _then(_$VisitAddActivityEventImpl(
      null == attractionItem
          ? _value.attractionItem
          : attractionItem // ignore: cast_nullable_to_non_nullable
              as Attraction,
      null == isVisit
          ? _value.isVisit
          : isVisit // ignore: cast_nullable_to_non_nullable
              as bool,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$VisitAddActivityEventImpl implements VisitAddActivityEvent {
  const _$VisitAddActivityEventImpl(
      this.attractionItem, this.isVisit, this.context);

  @override
  final Attraction attractionItem;
  @override
  final bool isVisit;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'VisitEvent.addActivityEvent(attractionItem: $attractionItem, isVisit: $isVisit, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitAddActivityEventImpl &&
            (identical(other.attractionItem, attractionItem) ||
                other.attractionItem == attractionItem) &&
            (identical(other.isVisit, isVisit) || other.isVisit == isVisit) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, attractionItem, isVisit, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitAddActivityEventImplCopyWith<_$VisitAddActivityEventImpl>
      get copyWith => __$$VisitAddActivityEventImplCopyWithImpl<
          _$VisitAddActivityEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVisitEvent,
    required TResult Function() loadVisitActivityEvent,
    required TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)
        addActivityEvent,
    required TResult Function(int attractionId) removeVisitItemEvent,
    required TResult Function() removeAllVisitEvent,
  }) {
    return addActivityEvent(attractionItem, isVisit, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVisitEvent,
    TResult? Function()? loadVisitActivityEvent,
    TResult? Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult? Function(int attractionId)? removeVisitItemEvent,
    TResult? Function()? removeAllVisitEvent,
  }) {
    return addActivityEvent?.call(attractionItem, isVisit, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVisitEvent,
    TResult Function()? loadVisitActivityEvent,
    TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult Function(int attractionId)? removeVisitItemEvent,
    TResult Function()? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (addActivityEvent != null) {
      return addActivityEvent(attractionItem, isVisit, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VisitLoadEvent value) loadVisitEvent,
    required TResult Function(VisitActivityLoadEvent value)
        loadVisitActivityEvent,
    required TResult Function(VisitAddActivityEvent value) addActivityEvent,
    required TResult Function(VisitRemoveItemEvent value) removeVisitItemEvent,
    required TResult Function(VisitRemoveAllEvent value) removeAllVisitEvent,
  }) {
    return addActivityEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VisitLoadEvent value)? loadVisitEvent,
    TResult? Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult? Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult? Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult? Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
  }) {
    return addActivityEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VisitLoadEvent value)? loadVisitEvent,
    TResult Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (addActivityEvent != null) {
      return addActivityEvent(this);
    }
    return orElse();
  }
}

abstract class VisitAddActivityEvent implements VisitEvent {
  const factory VisitAddActivityEvent(
      final Attraction attractionItem,
      final bool isVisit,
      final BuildContext context) = _$VisitAddActivityEventImpl;

  Attraction get attractionItem;
  bool get isVisit;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$VisitAddActivityEventImplCopyWith<_$VisitAddActivityEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VisitRemoveItemEventImplCopyWith<$Res> {
  factory _$$VisitRemoveItemEventImplCopyWith(_$VisitRemoveItemEventImpl value,
          $Res Function(_$VisitRemoveItemEventImpl) then) =
      __$$VisitRemoveItemEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int attractionId});
}

/// @nodoc
class __$$VisitRemoveItemEventImplCopyWithImpl<$Res>
    extends _$VisitEventCopyWithImpl<$Res, _$VisitRemoveItemEventImpl>
    implements _$$VisitRemoveItemEventImplCopyWith<$Res> {
  __$$VisitRemoveItemEventImplCopyWithImpl(_$VisitRemoveItemEventImpl _value,
      $Res Function(_$VisitRemoveItemEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attractionId = null,
  }) {
    return _then(_$VisitRemoveItemEventImpl(
      null == attractionId
          ? _value.attractionId
          : attractionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VisitRemoveItemEventImpl implements VisitRemoveItemEvent {
  const _$VisitRemoveItemEventImpl(this.attractionId);

  @override
  final int attractionId;

  @override
  String toString() {
    return 'VisitEvent.removeVisitItemEvent(attractionId: $attractionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitRemoveItemEventImpl &&
            (identical(other.attractionId, attractionId) ||
                other.attractionId == attractionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attractionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitRemoveItemEventImplCopyWith<_$VisitRemoveItemEventImpl>
      get copyWith =>
          __$$VisitRemoveItemEventImplCopyWithImpl<_$VisitRemoveItemEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVisitEvent,
    required TResult Function() loadVisitActivityEvent,
    required TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)
        addActivityEvent,
    required TResult Function(int attractionId) removeVisitItemEvent,
    required TResult Function() removeAllVisitEvent,
  }) {
    return removeVisitItemEvent(attractionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVisitEvent,
    TResult? Function()? loadVisitActivityEvent,
    TResult? Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult? Function(int attractionId)? removeVisitItemEvent,
    TResult? Function()? removeAllVisitEvent,
  }) {
    return removeVisitItemEvent?.call(attractionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVisitEvent,
    TResult Function()? loadVisitActivityEvent,
    TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult Function(int attractionId)? removeVisitItemEvent,
    TResult Function()? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (removeVisitItemEvent != null) {
      return removeVisitItemEvent(attractionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VisitLoadEvent value) loadVisitEvent,
    required TResult Function(VisitActivityLoadEvent value)
        loadVisitActivityEvent,
    required TResult Function(VisitAddActivityEvent value) addActivityEvent,
    required TResult Function(VisitRemoveItemEvent value) removeVisitItemEvent,
    required TResult Function(VisitRemoveAllEvent value) removeAllVisitEvent,
  }) {
    return removeVisitItemEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VisitLoadEvent value)? loadVisitEvent,
    TResult? Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult? Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult? Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult? Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
  }) {
    return removeVisitItemEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VisitLoadEvent value)? loadVisitEvent,
    TResult Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (removeVisitItemEvent != null) {
      return removeVisitItemEvent(this);
    }
    return orElse();
  }
}

abstract class VisitRemoveItemEvent implements VisitEvent {
  const factory VisitRemoveItemEvent(final int attractionId) =
      _$VisitRemoveItemEventImpl;

  int get attractionId;
  @JsonKey(ignore: true)
  _$$VisitRemoveItemEventImplCopyWith<_$VisitRemoveItemEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VisitRemoveAllEventImplCopyWith<$Res> {
  factory _$$VisitRemoveAllEventImplCopyWith(_$VisitRemoveAllEventImpl value,
          $Res Function(_$VisitRemoveAllEventImpl) then) =
      __$$VisitRemoveAllEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VisitRemoveAllEventImplCopyWithImpl<$Res>
    extends _$VisitEventCopyWithImpl<$Res, _$VisitRemoveAllEventImpl>
    implements _$$VisitRemoveAllEventImplCopyWith<$Res> {
  __$$VisitRemoveAllEventImplCopyWithImpl(_$VisitRemoveAllEventImpl _value,
      $Res Function(_$VisitRemoveAllEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VisitRemoveAllEventImpl implements VisitRemoveAllEvent {
  const _$VisitRemoveAllEventImpl();

  @override
  String toString() {
    return 'VisitEvent.removeAllVisitEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitRemoveAllEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadVisitEvent,
    required TResult Function() loadVisitActivityEvent,
    required TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)
        addActivityEvent,
    required TResult Function(int attractionId) removeVisitItemEvent,
    required TResult Function() removeAllVisitEvent,
  }) {
    return removeAllVisitEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadVisitEvent,
    TResult? Function()? loadVisitActivityEvent,
    TResult? Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult? Function(int attractionId)? removeVisitItemEvent,
    TResult? Function()? removeAllVisitEvent,
  }) {
    return removeAllVisitEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadVisitEvent,
    TResult Function()? loadVisitActivityEvent,
    TResult Function(
            Attraction attractionItem, bool isVisit, BuildContext context)?
        addActivityEvent,
    TResult Function(int attractionId)? removeVisitItemEvent,
    TResult Function()? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (removeAllVisitEvent != null) {
      return removeAllVisitEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VisitLoadEvent value) loadVisitEvent,
    required TResult Function(VisitActivityLoadEvent value)
        loadVisitActivityEvent,
    required TResult Function(VisitAddActivityEvent value) addActivityEvent,
    required TResult Function(VisitRemoveItemEvent value) removeVisitItemEvent,
    required TResult Function(VisitRemoveAllEvent value) removeAllVisitEvent,
  }) {
    return removeAllVisitEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VisitLoadEvent value)? loadVisitEvent,
    TResult? Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult? Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult? Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult? Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
  }) {
    return removeAllVisitEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VisitLoadEvent value)? loadVisitEvent,
    TResult Function(VisitActivityLoadEvent value)? loadVisitActivityEvent,
    TResult Function(VisitAddActivityEvent value)? addActivityEvent,
    TResult Function(VisitRemoveItemEvent value)? removeVisitItemEvent,
    TResult Function(VisitRemoveAllEvent value)? removeAllVisitEvent,
    required TResult orElse(),
  }) {
    if (removeAllVisitEvent != null) {
      return removeAllVisitEvent(this);
    }
    return orElse();
  }
}

abstract class VisitRemoveAllEvent implements VisitEvent {
  const factory VisitRemoveAllEvent() = _$VisitRemoveAllEventImpl;
}
