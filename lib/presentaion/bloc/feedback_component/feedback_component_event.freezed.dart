// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_component_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedbackComponentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedValue) loadOnChangeRadioEvent,
    required TResult Function(bool checkValue, int index)
        loadOnChangeCheckBoxEvent,
    required TResult Function(List<Option> optionList) loadOptionListEvent,
    required TResult Function(List<FeedbackOptions> optionItemList)
        setOptionItemEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult? Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult? Function(List<Option> optionList)? loadOptionListEvent,
    TResult? Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult Function(List<Option> optionList)? loadOptionListEvent,
    TResult Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedbackOnChangeRadioEvent value)
        loadOnChangeRadioEvent,
    required TResult Function(FeedbackOnChangeCheckBoxEvent value)
        loadOnChangeCheckBoxEvent,
    required TResult Function(FeedbackOptionListEvent value)
        loadOptionListEvent,
    required TResult Function(FeedbackOptionItemEvent value) setOptionItemEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult? Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult? Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult? Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackComponentEventCopyWith<$Res> {
  factory $FeedbackComponentEventCopyWith(FeedbackComponentEvent value,
          $Res Function(FeedbackComponentEvent) then) =
      _$FeedbackComponentEventCopyWithImpl<$Res, FeedbackComponentEvent>;
}

/// @nodoc
class _$FeedbackComponentEventCopyWithImpl<$Res,
        $Val extends FeedbackComponentEvent>
    implements $FeedbackComponentEventCopyWith<$Res> {
  _$FeedbackComponentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FeedbackOnChangeRadioEventImplCopyWith<$Res> {
  factory _$$FeedbackOnChangeRadioEventImplCopyWith(
          _$FeedbackOnChangeRadioEventImpl value,
          $Res Function(_$FeedbackOnChangeRadioEventImpl) then) =
      __$$FeedbackOnChangeRadioEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedValue});
}

/// @nodoc
class __$$FeedbackOnChangeRadioEventImplCopyWithImpl<$Res>
    extends _$FeedbackComponentEventCopyWithImpl<$Res,
        _$FeedbackOnChangeRadioEventImpl>
    implements _$$FeedbackOnChangeRadioEventImplCopyWith<$Res> {
  __$$FeedbackOnChangeRadioEventImplCopyWithImpl(
      _$FeedbackOnChangeRadioEventImpl _value,
      $Res Function(_$FeedbackOnChangeRadioEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedValue = null,
  }) {
    return _then(_$FeedbackOnChangeRadioEventImpl(
      null == selectedValue
          ? _value.selectedValue
          : selectedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FeedbackOnChangeRadioEventImpl implements FeedbackOnChangeRadioEvent {
  const _$FeedbackOnChangeRadioEventImpl(this.selectedValue);

  @override
  final String selectedValue;

  @override
  String toString() {
    return 'FeedbackComponentEvent.loadOnChangeRadioEvent(selectedValue: $selectedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackOnChangeRadioEventImpl &&
            (identical(other.selectedValue, selectedValue) ||
                other.selectedValue == selectedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackOnChangeRadioEventImplCopyWith<_$FeedbackOnChangeRadioEventImpl>
      get copyWith => __$$FeedbackOnChangeRadioEventImplCopyWithImpl<
          _$FeedbackOnChangeRadioEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedValue) loadOnChangeRadioEvent,
    required TResult Function(bool checkValue, int index)
        loadOnChangeCheckBoxEvent,
    required TResult Function(List<Option> optionList) loadOptionListEvent,
    required TResult Function(List<FeedbackOptions> optionItemList)
        setOptionItemEvent,
  }) {
    return loadOnChangeRadioEvent(selectedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult? Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult? Function(List<Option> optionList)? loadOptionListEvent,
    TResult? Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
  }) {
    return loadOnChangeRadioEvent?.call(selectedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult Function(List<Option> optionList)? loadOptionListEvent,
    TResult Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
    required TResult orElse(),
  }) {
    if (loadOnChangeRadioEvent != null) {
      return loadOnChangeRadioEvent(selectedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedbackOnChangeRadioEvent value)
        loadOnChangeRadioEvent,
    required TResult Function(FeedbackOnChangeCheckBoxEvent value)
        loadOnChangeCheckBoxEvent,
    required TResult Function(FeedbackOptionListEvent value)
        loadOptionListEvent,
    required TResult Function(FeedbackOptionItemEvent value) setOptionItemEvent,
  }) {
    return loadOnChangeRadioEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult? Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult? Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult? Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
  }) {
    return loadOnChangeRadioEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
    required TResult orElse(),
  }) {
    if (loadOnChangeRadioEvent != null) {
      return loadOnChangeRadioEvent(this);
    }
    return orElse();
  }
}

abstract class FeedbackOnChangeRadioEvent implements FeedbackComponentEvent {
  const factory FeedbackOnChangeRadioEvent(final String selectedValue) =
      _$FeedbackOnChangeRadioEventImpl;

  String get selectedValue;
  @JsonKey(ignore: true)
  _$$FeedbackOnChangeRadioEventImplCopyWith<_$FeedbackOnChangeRadioEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FeedbackOnChangeCheckBoxEventImplCopyWith<$Res> {
  factory _$$FeedbackOnChangeCheckBoxEventImplCopyWith(
          _$FeedbackOnChangeCheckBoxEventImpl value,
          $Res Function(_$FeedbackOnChangeCheckBoxEventImpl) then) =
      __$$FeedbackOnChangeCheckBoxEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool checkValue, int index});
}

/// @nodoc
class __$$FeedbackOnChangeCheckBoxEventImplCopyWithImpl<$Res>
    extends _$FeedbackComponentEventCopyWithImpl<$Res,
        _$FeedbackOnChangeCheckBoxEventImpl>
    implements _$$FeedbackOnChangeCheckBoxEventImplCopyWith<$Res> {
  __$$FeedbackOnChangeCheckBoxEventImplCopyWithImpl(
      _$FeedbackOnChangeCheckBoxEventImpl _value,
      $Res Function(_$FeedbackOnChangeCheckBoxEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkValue = null,
    Object? index = null,
  }) {
    return _then(_$FeedbackOnChangeCheckBoxEventImpl(
      null == checkValue
          ? _value.checkValue
          : checkValue // ignore: cast_nullable_to_non_nullable
              as bool,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FeedbackOnChangeCheckBoxEventImpl
    implements FeedbackOnChangeCheckBoxEvent {
  const _$FeedbackOnChangeCheckBoxEventImpl(this.checkValue, this.index);

  @override
  final bool checkValue;
  @override
  final int index;

  @override
  String toString() {
    return 'FeedbackComponentEvent.loadOnChangeCheckBoxEvent(checkValue: $checkValue, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackOnChangeCheckBoxEventImpl &&
            (identical(other.checkValue, checkValue) ||
                other.checkValue == checkValue) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkValue, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackOnChangeCheckBoxEventImplCopyWith<
          _$FeedbackOnChangeCheckBoxEventImpl>
      get copyWith => __$$FeedbackOnChangeCheckBoxEventImplCopyWithImpl<
          _$FeedbackOnChangeCheckBoxEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedValue) loadOnChangeRadioEvent,
    required TResult Function(bool checkValue, int index)
        loadOnChangeCheckBoxEvent,
    required TResult Function(List<Option> optionList) loadOptionListEvent,
    required TResult Function(List<FeedbackOptions> optionItemList)
        setOptionItemEvent,
  }) {
    return loadOnChangeCheckBoxEvent(checkValue, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult? Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult? Function(List<Option> optionList)? loadOptionListEvent,
    TResult? Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
  }) {
    return loadOnChangeCheckBoxEvent?.call(checkValue, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult Function(List<Option> optionList)? loadOptionListEvent,
    TResult Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
    required TResult orElse(),
  }) {
    if (loadOnChangeCheckBoxEvent != null) {
      return loadOnChangeCheckBoxEvent(checkValue, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedbackOnChangeRadioEvent value)
        loadOnChangeRadioEvent,
    required TResult Function(FeedbackOnChangeCheckBoxEvent value)
        loadOnChangeCheckBoxEvent,
    required TResult Function(FeedbackOptionListEvent value)
        loadOptionListEvent,
    required TResult Function(FeedbackOptionItemEvent value) setOptionItemEvent,
  }) {
    return loadOnChangeCheckBoxEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult? Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult? Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult? Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
  }) {
    return loadOnChangeCheckBoxEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
    required TResult orElse(),
  }) {
    if (loadOnChangeCheckBoxEvent != null) {
      return loadOnChangeCheckBoxEvent(this);
    }
    return orElse();
  }
}

abstract class FeedbackOnChangeCheckBoxEvent implements FeedbackComponentEvent {
  const factory FeedbackOnChangeCheckBoxEvent(
          final bool checkValue, final int index) =
      _$FeedbackOnChangeCheckBoxEventImpl;

  bool get checkValue;
  int get index;
  @JsonKey(ignore: true)
  _$$FeedbackOnChangeCheckBoxEventImplCopyWith<
          _$FeedbackOnChangeCheckBoxEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FeedbackOptionListEventImplCopyWith<$Res> {
  factory _$$FeedbackOptionListEventImplCopyWith(
          _$FeedbackOptionListEventImpl value,
          $Res Function(_$FeedbackOptionListEventImpl) then) =
      __$$FeedbackOptionListEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Option> optionList});
}

/// @nodoc
class __$$FeedbackOptionListEventImplCopyWithImpl<$Res>
    extends _$FeedbackComponentEventCopyWithImpl<$Res,
        _$FeedbackOptionListEventImpl>
    implements _$$FeedbackOptionListEventImplCopyWith<$Res> {
  __$$FeedbackOptionListEventImplCopyWithImpl(
      _$FeedbackOptionListEventImpl _value,
      $Res Function(_$FeedbackOptionListEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionList = null,
  }) {
    return _then(_$FeedbackOptionListEventImpl(
      null == optionList
          ? _value._optionList
          : optionList // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// @nodoc

class _$FeedbackOptionListEventImpl implements FeedbackOptionListEvent {
  const _$FeedbackOptionListEventImpl(final List<Option> optionList)
      : _optionList = optionList;

  final List<Option> _optionList;
  @override
  List<Option> get optionList {
    if (_optionList is EqualUnmodifiableListView) return _optionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionList);
  }

  @override
  String toString() {
    return 'FeedbackComponentEvent.loadOptionListEvent(optionList: $optionList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackOptionListEventImpl &&
            const DeepCollectionEquality()
                .equals(other._optionList, _optionList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_optionList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackOptionListEventImplCopyWith<_$FeedbackOptionListEventImpl>
      get copyWith => __$$FeedbackOptionListEventImplCopyWithImpl<
          _$FeedbackOptionListEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedValue) loadOnChangeRadioEvent,
    required TResult Function(bool checkValue, int index)
        loadOnChangeCheckBoxEvent,
    required TResult Function(List<Option> optionList) loadOptionListEvent,
    required TResult Function(List<FeedbackOptions> optionItemList)
        setOptionItemEvent,
  }) {
    return loadOptionListEvent(optionList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult? Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult? Function(List<Option> optionList)? loadOptionListEvent,
    TResult? Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
  }) {
    return loadOptionListEvent?.call(optionList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult Function(List<Option> optionList)? loadOptionListEvent,
    TResult Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
    required TResult orElse(),
  }) {
    if (loadOptionListEvent != null) {
      return loadOptionListEvent(optionList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedbackOnChangeRadioEvent value)
        loadOnChangeRadioEvent,
    required TResult Function(FeedbackOnChangeCheckBoxEvent value)
        loadOnChangeCheckBoxEvent,
    required TResult Function(FeedbackOptionListEvent value)
        loadOptionListEvent,
    required TResult Function(FeedbackOptionItemEvent value) setOptionItemEvent,
  }) {
    return loadOptionListEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult? Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult? Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult? Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
  }) {
    return loadOptionListEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
    required TResult orElse(),
  }) {
    if (loadOptionListEvent != null) {
      return loadOptionListEvent(this);
    }
    return orElse();
  }
}

abstract class FeedbackOptionListEvent implements FeedbackComponentEvent {
  const factory FeedbackOptionListEvent(final List<Option> optionList) =
      _$FeedbackOptionListEventImpl;

  List<Option> get optionList;
  @JsonKey(ignore: true)
  _$$FeedbackOptionListEventImplCopyWith<_$FeedbackOptionListEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FeedbackOptionItemEventImplCopyWith<$Res> {
  factory _$$FeedbackOptionItemEventImplCopyWith(
          _$FeedbackOptionItemEventImpl value,
          $Res Function(_$FeedbackOptionItemEventImpl) then) =
      __$$FeedbackOptionItemEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FeedbackOptions> optionItemList});
}

/// @nodoc
class __$$FeedbackOptionItemEventImplCopyWithImpl<$Res>
    extends _$FeedbackComponentEventCopyWithImpl<$Res,
        _$FeedbackOptionItemEventImpl>
    implements _$$FeedbackOptionItemEventImplCopyWith<$Res> {
  __$$FeedbackOptionItemEventImplCopyWithImpl(
      _$FeedbackOptionItemEventImpl _value,
      $Res Function(_$FeedbackOptionItemEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionItemList = null,
  }) {
    return _then(_$FeedbackOptionItemEventImpl(
      null == optionItemList
          ? _value._optionItemList
          : optionItemList // ignore: cast_nullable_to_non_nullable
              as List<FeedbackOptions>,
    ));
  }
}

/// @nodoc

class _$FeedbackOptionItemEventImpl implements FeedbackOptionItemEvent {
  const _$FeedbackOptionItemEventImpl(
      final List<FeedbackOptions> optionItemList)
      : _optionItemList = optionItemList;

  final List<FeedbackOptions> _optionItemList;
  @override
  List<FeedbackOptions> get optionItemList {
    if (_optionItemList is EqualUnmodifiableListView) return _optionItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionItemList);
  }

  @override
  String toString() {
    return 'FeedbackComponentEvent.setOptionItemEvent(optionItemList: $optionItemList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackOptionItemEventImpl &&
            const DeepCollectionEquality()
                .equals(other._optionItemList, _optionItemList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_optionItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackOptionItemEventImplCopyWith<_$FeedbackOptionItemEventImpl>
      get copyWith => __$$FeedbackOptionItemEventImplCopyWithImpl<
          _$FeedbackOptionItemEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedValue) loadOnChangeRadioEvent,
    required TResult Function(bool checkValue, int index)
        loadOnChangeCheckBoxEvent,
    required TResult Function(List<Option> optionList) loadOptionListEvent,
    required TResult Function(List<FeedbackOptions> optionItemList)
        setOptionItemEvent,
  }) {
    return setOptionItemEvent(optionItemList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult? Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult? Function(List<Option> optionList)? loadOptionListEvent,
    TResult? Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
  }) {
    return setOptionItemEvent?.call(optionItemList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedValue)? loadOnChangeRadioEvent,
    TResult Function(bool checkValue, int index)? loadOnChangeCheckBoxEvent,
    TResult Function(List<Option> optionList)? loadOptionListEvent,
    TResult Function(List<FeedbackOptions> optionItemList)? setOptionItemEvent,
    required TResult orElse(),
  }) {
    if (setOptionItemEvent != null) {
      return setOptionItemEvent(optionItemList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedbackOnChangeRadioEvent value)
        loadOnChangeRadioEvent,
    required TResult Function(FeedbackOnChangeCheckBoxEvent value)
        loadOnChangeCheckBoxEvent,
    required TResult Function(FeedbackOptionListEvent value)
        loadOptionListEvent,
    required TResult Function(FeedbackOptionItemEvent value) setOptionItemEvent,
  }) {
    return setOptionItemEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult? Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult? Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult? Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
  }) {
    return setOptionItemEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedbackOnChangeRadioEvent value)? loadOnChangeRadioEvent,
    TResult Function(FeedbackOnChangeCheckBoxEvent value)?
        loadOnChangeCheckBoxEvent,
    TResult Function(FeedbackOptionListEvent value)? loadOptionListEvent,
    TResult Function(FeedbackOptionItemEvent value)? setOptionItemEvent,
    required TResult orElse(),
  }) {
    if (setOptionItemEvent != null) {
      return setOptionItemEvent(this);
    }
    return orElse();
  }
}

abstract class FeedbackOptionItemEvent implements FeedbackComponentEvent {
  const factory FeedbackOptionItemEvent(
          final List<FeedbackOptions> optionItemList) =
      _$FeedbackOptionItemEventImpl;

  List<FeedbackOptions> get optionItemList;
  @JsonKey(ignore: true)
  _$$FeedbackOptionItemEventImplCopyWith<_$FeedbackOptionItemEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
