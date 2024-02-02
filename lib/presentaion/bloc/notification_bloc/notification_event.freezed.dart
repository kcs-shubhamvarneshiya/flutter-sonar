// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLongPress) loadNotificationEvent,
    required TResult Function(String notificationId)
        removeNotificationItemEvent,
    required TResult Function(List<NotificationLog> removeItemList)
        removeSelectedNotificationEvent,
    required TResult Function(
            List<NotificationLog> selectedItemList, bool isLongPress, int index)
        selectedNotificationEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLongPress)? loadNotificationEvent,
    TResult? Function(String notificationId)? removeNotificationItemEvent,
    TResult? Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult? Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLongPress)? loadNotificationEvent,
    TResult Function(String notificationId)? removeNotificationItemEvent,
    TResult Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationLoadEvent value)
        loadNotificationEvent,
    required TResult Function(NotificationRemoveItemEvent value)
        removeNotificationItemEvent,
    required TResult Function(NotificationRemoveSelectedEvent value)
        removeSelectedNotificationEvent,
    required TResult Function(NotificationSelectedEvent value)
        selectedNotificationEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult? Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult? Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult? Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotificationLoadEventImplCopyWith<$Res> {
  factory _$$NotificationLoadEventImplCopyWith(
          _$NotificationLoadEventImpl value,
          $Res Function(_$NotificationLoadEventImpl) then) =
      __$$NotificationLoadEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLongPress});
}

/// @nodoc
class __$$NotificationLoadEventImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$NotificationLoadEventImpl>
    implements _$$NotificationLoadEventImplCopyWith<$Res> {
  __$$NotificationLoadEventImplCopyWithImpl(_$NotificationLoadEventImpl _value,
      $Res Function(_$NotificationLoadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLongPress = null,
  }) {
    return _then(_$NotificationLoadEventImpl(
      null == isLongPress
          ? _value.isLongPress
          : isLongPress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotificationLoadEventImpl implements NotificationLoadEvent {
  const _$NotificationLoadEventImpl(this.isLongPress);

  @override
  final bool isLongPress;

  @override
  String toString() {
    return 'NotificationEvent.loadNotificationEvent(isLongPress: $isLongPress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationLoadEventImpl &&
            (identical(other.isLongPress, isLongPress) ||
                other.isLongPress == isLongPress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLongPress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationLoadEventImplCopyWith<_$NotificationLoadEventImpl>
      get copyWith => __$$NotificationLoadEventImplCopyWithImpl<
          _$NotificationLoadEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLongPress) loadNotificationEvent,
    required TResult Function(String notificationId)
        removeNotificationItemEvent,
    required TResult Function(List<NotificationLog> removeItemList)
        removeSelectedNotificationEvent,
    required TResult Function(
            List<NotificationLog> selectedItemList, bool isLongPress, int index)
        selectedNotificationEvent,
  }) {
    return loadNotificationEvent(isLongPress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLongPress)? loadNotificationEvent,
    TResult? Function(String notificationId)? removeNotificationItemEvent,
    TResult? Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult? Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
  }) {
    return loadNotificationEvent?.call(isLongPress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLongPress)? loadNotificationEvent,
    TResult Function(String notificationId)? removeNotificationItemEvent,
    TResult Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) {
    if (loadNotificationEvent != null) {
      return loadNotificationEvent(isLongPress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationLoadEvent value)
        loadNotificationEvent,
    required TResult Function(NotificationRemoveItemEvent value)
        removeNotificationItemEvent,
    required TResult Function(NotificationRemoveSelectedEvent value)
        removeSelectedNotificationEvent,
    required TResult Function(NotificationSelectedEvent value)
        selectedNotificationEvent,
  }) {
    return loadNotificationEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult? Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult? Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult? Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
  }) {
    return loadNotificationEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) {
    if (loadNotificationEvent != null) {
      return loadNotificationEvent(this);
    }
    return orElse();
  }
}

abstract class NotificationLoadEvent implements NotificationEvent {
  const factory NotificationLoadEvent(final bool isLongPress) =
      _$NotificationLoadEventImpl;

  bool get isLongPress;
  @JsonKey(ignore: true)
  _$$NotificationLoadEventImplCopyWith<_$NotificationLoadEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationRemoveItemEventImplCopyWith<$Res> {
  factory _$$NotificationRemoveItemEventImplCopyWith(
          _$NotificationRemoveItemEventImpl value,
          $Res Function(_$NotificationRemoveItemEventImpl) then) =
      __$$NotificationRemoveItemEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String notificationId});
}

/// @nodoc
class __$$NotificationRemoveItemEventImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res,
        _$NotificationRemoveItemEventImpl>
    implements _$$NotificationRemoveItemEventImplCopyWith<$Res> {
  __$$NotificationRemoveItemEventImplCopyWithImpl(
      _$NotificationRemoveItemEventImpl _value,
      $Res Function(_$NotificationRemoveItemEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
  }) {
    return _then(_$NotificationRemoveItemEventImpl(
      null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotificationRemoveItemEventImpl implements NotificationRemoveItemEvent {
  const _$NotificationRemoveItemEventImpl(this.notificationId);

  @override
  final String notificationId;

  @override
  String toString() {
    return 'NotificationEvent.removeNotificationItemEvent(notificationId: $notificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationRemoveItemEventImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationRemoveItemEventImplCopyWith<_$NotificationRemoveItemEventImpl>
      get copyWith => __$$NotificationRemoveItemEventImplCopyWithImpl<
          _$NotificationRemoveItemEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLongPress) loadNotificationEvent,
    required TResult Function(String notificationId)
        removeNotificationItemEvent,
    required TResult Function(List<NotificationLog> removeItemList)
        removeSelectedNotificationEvent,
    required TResult Function(
            List<NotificationLog> selectedItemList, bool isLongPress, int index)
        selectedNotificationEvent,
  }) {
    return removeNotificationItemEvent(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLongPress)? loadNotificationEvent,
    TResult? Function(String notificationId)? removeNotificationItemEvent,
    TResult? Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult? Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
  }) {
    return removeNotificationItemEvent?.call(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLongPress)? loadNotificationEvent,
    TResult Function(String notificationId)? removeNotificationItemEvent,
    TResult Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) {
    if (removeNotificationItemEvent != null) {
      return removeNotificationItemEvent(notificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationLoadEvent value)
        loadNotificationEvent,
    required TResult Function(NotificationRemoveItemEvent value)
        removeNotificationItemEvent,
    required TResult Function(NotificationRemoveSelectedEvent value)
        removeSelectedNotificationEvent,
    required TResult Function(NotificationSelectedEvent value)
        selectedNotificationEvent,
  }) {
    return removeNotificationItemEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult? Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult? Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult? Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
  }) {
    return removeNotificationItemEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) {
    if (removeNotificationItemEvent != null) {
      return removeNotificationItemEvent(this);
    }
    return orElse();
  }
}

abstract class NotificationRemoveItemEvent implements NotificationEvent {
  const factory NotificationRemoveItemEvent(final String notificationId) =
      _$NotificationRemoveItemEventImpl;

  String get notificationId;
  @JsonKey(ignore: true)
  _$$NotificationRemoveItemEventImplCopyWith<_$NotificationRemoveItemEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationRemoveSelectedEventImplCopyWith<$Res> {
  factory _$$NotificationRemoveSelectedEventImplCopyWith(
          _$NotificationRemoveSelectedEventImpl value,
          $Res Function(_$NotificationRemoveSelectedEventImpl) then) =
      __$$NotificationRemoveSelectedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationLog> removeItemList});
}

/// @nodoc
class __$$NotificationRemoveSelectedEventImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res,
        _$NotificationRemoveSelectedEventImpl>
    implements _$$NotificationRemoveSelectedEventImplCopyWith<$Res> {
  __$$NotificationRemoveSelectedEventImplCopyWithImpl(
      _$NotificationRemoveSelectedEventImpl _value,
      $Res Function(_$NotificationRemoveSelectedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? removeItemList = null,
  }) {
    return _then(_$NotificationRemoveSelectedEventImpl(
      null == removeItemList
          ? _value._removeItemList
          : removeItemList // ignore: cast_nullable_to_non_nullable
              as List<NotificationLog>,
    ));
  }
}

/// @nodoc

class _$NotificationRemoveSelectedEventImpl
    implements NotificationRemoveSelectedEvent {
  const _$NotificationRemoveSelectedEventImpl(
      final List<NotificationLog> removeItemList)
      : _removeItemList = removeItemList;

  final List<NotificationLog> _removeItemList;
  @override
  List<NotificationLog> get removeItemList {
    if (_removeItemList is EqualUnmodifiableListView) return _removeItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removeItemList);
  }

  @override
  String toString() {
    return 'NotificationEvent.removeSelectedNotificationEvent(removeItemList: $removeItemList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationRemoveSelectedEventImpl &&
            const DeepCollectionEquality()
                .equals(other._removeItemList, _removeItemList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_removeItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationRemoveSelectedEventImplCopyWith<
          _$NotificationRemoveSelectedEventImpl>
      get copyWith => __$$NotificationRemoveSelectedEventImplCopyWithImpl<
          _$NotificationRemoveSelectedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLongPress) loadNotificationEvent,
    required TResult Function(String notificationId)
        removeNotificationItemEvent,
    required TResult Function(List<NotificationLog> removeItemList)
        removeSelectedNotificationEvent,
    required TResult Function(
            List<NotificationLog> selectedItemList, bool isLongPress, int index)
        selectedNotificationEvent,
  }) {
    return removeSelectedNotificationEvent(removeItemList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLongPress)? loadNotificationEvent,
    TResult? Function(String notificationId)? removeNotificationItemEvent,
    TResult? Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult? Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
  }) {
    return removeSelectedNotificationEvent?.call(removeItemList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLongPress)? loadNotificationEvent,
    TResult Function(String notificationId)? removeNotificationItemEvent,
    TResult Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) {
    if (removeSelectedNotificationEvent != null) {
      return removeSelectedNotificationEvent(removeItemList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationLoadEvent value)
        loadNotificationEvent,
    required TResult Function(NotificationRemoveItemEvent value)
        removeNotificationItemEvent,
    required TResult Function(NotificationRemoveSelectedEvent value)
        removeSelectedNotificationEvent,
    required TResult Function(NotificationSelectedEvent value)
        selectedNotificationEvent,
  }) {
    return removeSelectedNotificationEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult? Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult? Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult? Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
  }) {
    return removeSelectedNotificationEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) {
    if (removeSelectedNotificationEvent != null) {
      return removeSelectedNotificationEvent(this);
    }
    return orElse();
  }
}

abstract class NotificationRemoveSelectedEvent implements NotificationEvent {
  const factory NotificationRemoveSelectedEvent(
          final List<NotificationLog> removeItemList) =
      _$NotificationRemoveSelectedEventImpl;

  List<NotificationLog> get removeItemList;
  @JsonKey(ignore: true)
  _$$NotificationRemoveSelectedEventImplCopyWith<
          _$NotificationRemoveSelectedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationSelectedEventImplCopyWith<$Res> {
  factory _$$NotificationSelectedEventImplCopyWith(
          _$NotificationSelectedEventImpl value,
          $Res Function(_$NotificationSelectedEventImpl) then) =
      __$$NotificationSelectedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<NotificationLog> selectedItemList, bool isLongPress, int index});
}

/// @nodoc
class __$$NotificationSelectedEventImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res,
        _$NotificationSelectedEventImpl>
    implements _$$NotificationSelectedEventImplCopyWith<$Res> {
  __$$NotificationSelectedEventImplCopyWithImpl(
      _$NotificationSelectedEventImpl _value,
      $Res Function(_$NotificationSelectedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItemList = null,
    Object? isLongPress = null,
    Object? index = null,
  }) {
    return _then(_$NotificationSelectedEventImpl(
      null == selectedItemList
          ? _value._selectedItemList
          : selectedItemList // ignore: cast_nullable_to_non_nullable
              as List<NotificationLog>,
      null == isLongPress
          ? _value.isLongPress
          : isLongPress // ignore: cast_nullable_to_non_nullable
              as bool,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NotificationSelectedEventImpl implements NotificationSelectedEvent {
  const _$NotificationSelectedEventImpl(
      final List<NotificationLog> selectedItemList,
      this.isLongPress,
      this.index)
      : _selectedItemList = selectedItemList;

  final List<NotificationLog> _selectedItemList;
  @override
  List<NotificationLog> get selectedItemList {
    if (_selectedItemList is EqualUnmodifiableListView)
      return _selectedItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItemList);
  }

  @override
  final bool isLongPress;
  @override
  final int index;

  @override
  String toString() {
    return 'NotificationEvent.selectedNotificationEvent(selectedItemList: $selectedItemList, isLongPress: $isLongPress, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSelectedEventImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedItemList, _selectedItemList) &&
            (identical(other.isLongPress, isLongPress) ||
                other.isLongPress == isLongPress) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedItemList),
      isLongPress,
      index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSelectedEventImplCopyWith<_$NotificationSelectedEventImpl>
      get copyWith => __$$NotificationSelectedEventImplCopyWithImpl<
          _$NotificationSelectedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLongPress) loadNotificationEvent,
    required TResult Function(String notificationId)
        removeNotificationItemEvent,
    required TResult Function(List<NotificationLog> removeItemList)
        removeSelectedNotificationEvent,
    required TResult Function(
            List<NotificationLog> selectedItemList, bool isLongPress, int index)
        selectedNotificationEvent,
  }) {
    return selectedNotificationEvent(selectedItemList, isLongPress, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLongPress)? loadNotificationEvent,
    TResult? Function(String notificationId)? removeNotificationItemEvent,
    TResult? Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult? Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
  }) {
    return selectedNotificationEvent?.call(
        selectedItemList, isLongPress, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLongPress)? loadNotificationEvent,
    TResult Function(String notificationId)? removeNotificationItemEvent,
    TResult Function(List<NotificationLog> removeItemList)?
        removeSelectedNotificationEvent,
    TResult Function(List<NotificationLog> selectedItemList, bool isLongPress,
            int index)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) {
    if (selectedNotificationEvent != null) {
      return selectedNotificationEvent(selectedItemList, isLongPress, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationLoadEvent value)
        loadNotificationEvent,
    required TResult Function(NotificationRemoveItemEvent value)
        removeNotificationItemEvent,
    required TResult Function(NotificationRemoveSelectedEvent value)
        removeSelectedNotificationEvent,
    required TResult Function(NotificationSelectedEvent value)
        selectedNotificationEvent,
  }) {
    return selectedNotificationEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult? Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult? Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult? Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
  }) {
    return selectedNotificationEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationLoadEvent value)? loadNotificationEvent,
    TResult Function(NotificationRemoveItemEvent value)?
        removeNotificationItemEvent,
    TResult Function(NotificationRemoveSelectedEvent value)?
        removeSelectedNotificationEvent,
    TResult Function(NotificationSelectedEvent value)?
        selectedNotificationEvent,
    required TResult orElse(),
  }) {
    if (selectedNotificationEvent != null) {
      return selectedNotificationEvent(this);
    }
    return orElse();
  }
}

abstract class NotificationSelectedEvent implements NotificationEvent {
  const factory NotificationSelectedEvent(
      final List<NotificationLog> selectedItemList,
      final bool isLongPress,
      final int index) = _$NotificationSelectedEventImpl;

  List<NotificationLog> get selectedItemList;
  bool get isLongPress;
  int get index;
  @JsonKey(ignore: true)
  _$$NotificationSelectedEventImplCopyWith<_$NotificationSelectedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
