// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_component_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedbackComponentState {
  String get selectedValue => throw _privateConstructorUsedError;
  bool get checkState => throw _privateConstructorUsedError;
  int get checkedIndex => throw _privateConstructorUsedError;
  List<Option> get optionList => throw _privateConstructorUsedError;
  List<MultiSelectItem<Option>> get optionItemList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedbackComponentStateCopyWith<FeedbackComponentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackComponentStateCopyWith<$Res> {
  factory $FeedbackComponentStateCopyWith(FeedbackComponentState value,
          $Res Function(FeedbackComponentState) then) =
      _$FeedbackComponentStateCopyWithImpl<$Res, FeedbackComponentState>;
  @useResult
  $Res call(
      {String selectedValue,
      bool checkState,
      int checkedIndex,
      List<Option> optionList,
      List<MultiSelectItem<Option>> optionItemList});
}

/// @nodoc
class _$FeedbackComponentStateCopyWithImpl<$Res,
        $Val extends FeedbackComponentState>
    implements $FeedbackComponentStateCopyWith<$Res> {
  _$FeedbackComponentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedValue = null,
    Object? checkState = null,
    Object? checkedIndex = null,
    Object? optionList = null,
    Object? optionItemList = null,
  }) {
    return _then(_value.copyWith(
      selectedValue: null == selectedValue
          ? _value.selectedValue
          : selectedValue // ignore: cast_nullable_to_non_nullable
              as String,
      checkState: null == checkState
          ? _value.checkState
          : checkState // ignore: cast_nullable_to_non_nullable
              as bool,
      checkedIndex: null == checkedIndex
          ? _value.checkedIndex
          : checkedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      optionList: null == optionList
          ? _value.optionList
          : optionList // ignore: cast_nullable_to_non_nullable
              as List<Option>,
      optionItemList: null == optionItemList
          ? _value.optionItemList
          : optionItemList // ignore: cast_nullable_to_non_nullable
              as List<MultiSelectItem<Option>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackComponentStateImplCopyWith<$Res>
    implements $FeedbackComponentStateCopyWith<$Res> {
  factory _$$FeedbackComponentStateImplCopyWith(
          _$FeedbackComponentStateImpl value,
          $Res Function(_$FeedbackComponentStateImpl) then) =
      __$$FeedbackComponentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String selectedValue,
      bool checkState,
      int checkedIndex,
      List<Option> optionList,
      List<MultiSelectItem<Option>> optionItemList});
}

/// @nodoc
class __$$FeedbackComponentStateImplCopyWithImpl<$Res>
    extends _$FeedbackComponentStateCopyWithImpl<$Res,
        _$FeedbackComponentStateImpl>
    implements _$$FeedbackComponentStateImplCopyWith<$Res> {
  __$$FeedbackComponentStateImplCopyWithImpl(
      _$FeedbackComponentStateImpl _value,
      $Res Function(_$FeedbackComponentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedValue = null,
    Object? checkState = null,
    Object? checkedIndex = null,
    Object? optionList = null,
    Object? optionItemList = null,
  }) {
    return _then(_$FeedbackComponentStateImpl(
      selectedValue: null == selectedValue
          ? _value.selectedValue
          : selectedValue // ignore: cast_nullable_to_non_nullable
              as String,
      checkState: null == checkState
          ? _value.checkState
          : checkState // ignore: cast_nullable_to_non_nullable
              as bool,
      checkedIndex: null == checkedIndex
          ? _value.checkedIndex
          : checkedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      optionList: null == optionList
          ? _value._optionList
          : optionList // ignore: cast_nullable_to_non_nullable
              as List<Option>,
      optionItemList: null == optionItemList
          ? _value._optionItemList
          : optionItemList // ignore: cast_nullable_to_non_nullable
              as List<MultiSelectItem<Option>>,
    ));
  }
}

/// @nodoc

class _$FeedbackComponentStateImpl implements _FeedbackComponentState {
  const _$FeedbackComponentStateImpl(
      {required this.selectedValue,
      required this.checkState,
      required this.checkedIndex,
      required final List<Option> optionList,
      required final List<MultiSelectItem<Option>> optionItemList})
      : _optionList = optionList,
        _optionItemList = optionItemList;

  @override
  final String selectedValue;
  @override
  final bool checkState;
  @override
  final int checkedIndex;
  final List<Option> _optionList;
  @override
  List<Option> get optionList {
    if (_optionList is EqualUnmodifiableListView) return _optionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionList);
  }

  final List<MultiSelectItem<Option>> _optionItemList;
  @override
  List<MultiSelectItem<Option>> get optionItemList {
    if (_optionItemList is EqualUnmodifiableListView) return _optionItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionItemList);
  }

  @override
  String toString() {
    return 'FeedbackComponentState(selectedValue: $selectedValue, checkState: $checkState, checkedIndex: $checkedIndex, optionList: $optionList, optionItemList: $optionItemList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackComponentStateImpl &&
            (identical(other.selectedValue, selectedValue) ||
                other.selectedValue == selectedValue) &&
            (identical(other.checkState, checkState) ||
                other.checkState == checkState) &&
            (identical(other.checkedIndex, checkedIndex) ||
                other.checkedIndex == checkedIndex) &&
            const DeepCollectionEquality()
                .equals(other._optionList, _optionList) &&
            const DeepCollectionEquality()
                .equals(other._optionItemList, _optionItemList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedValue,
      checkState,
      checkedIndex,
      const DeepCollectionEquality().hash(_optionList),
      const DeepCollectionEquality().hash(_optionItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackComponentStateImplCopyWith<_$FeedbackComponentStateImpl>
      get copyWith => __$$FeedbackComponentStateImplCopyWithImpl<
          _$FeedbackComponentStateImpl>(this, _$identity);
}

abstract class _FeedbackComponentState implements FeedbackComponentState {
  const factory _FeedbackComponentState(
          {required final String selectedValue,
          required final bool checkState,
          required final int checkedIndex,
          required final List<Option> optionList,
          required final List<MultiSelectItem<Option>> optionItemList}) =
      _$FeedbackComponentStateImpl;

  @override
  String get selectedValue;
  @override
  bool get checkState;
  @override
  int get checkedIndex;
  @override
  List<Option> get optionList;
  @override
  List<MultiSelectItem<Option>> get optionItemList;
  @override
  @JsonKey(ignore: true)
  _$$FeedbackComponentStateImplCopyWith<_$FeedbackComponentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
