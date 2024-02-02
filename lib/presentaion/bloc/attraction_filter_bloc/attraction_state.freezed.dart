// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attraction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AttractionState {
  bool get checked => throw _privateConstructorUsedError;
  int? get currentIndex => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  List<Attraction> get attractionList => throw _privateConstructorUsedError;
  Set<String?> get attractionTypeList => throw _privateConstructorUsedError;
  bool get isFiltering => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttractionStateCopyWith<AttractionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttractionStateCopyWith<$Res> {
  factory $AttractionStateCopyWith(
          AttractionState value, $Res Function(AttractionState) then) =
      _$AttractionStateCopyWithImpl<$Res, AttractionState>;
  @useResult
  $Res call(
      {bool checked,
      int? currentIndex,
      String? value,
      List<Attraction> attractionList,
      Set<String?> attractionTypeList,
      bool isFiltering});
}

/// @nodoc
class _$AttractionStateCopyWithImpl<$Res, $Val extends AttractionState>
    implements $AttractionStateCopyWith<$Res> {
  _$AttractionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checked = null,
    Object? currentIndex = freezed,
    Object? value = freezed,
    Object? attractionList = null,
    Object? attractionTypeList = null,
    Object? isFiltering = null,
  }) {
    return _then(_value.copyWith(
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: freezed == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      attractionList: null == attractionList
          ? _value.attractionList
          : attractionList // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      attractionTypeList: null == attractionTypeList
          ? _value.attractionTypeList
          : attractionTypeList // ignore: cast_nullable_to_non_nullable
              as Set<String?>,
      isFiltering: null == isFiltering
          ? _value.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttractionStateImplCopyWith<$Res>
    implements $AttractionStateCopyWith<$Res> {
  factory _$$AttractionStateImplCopyWith(_$AttractionStateImpl value,
          $Res Function(_$AttractionStateImpl) then) =
      __$$AttractionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool checked,
      int? currentIndex,
      String? value,
      List<Attraction> attractionList,
      Set<String?> attractionTypeList,
      bool isFiltering});
}

/// @nodoc
class __$$AttractionStateImplCopyWithImpl<$Res>
    extends _$AttractionStateCopyWithImpl<$Res, _$AttractionStateImpl>
    implements _$$AttractionStateImplCopyWith<$Res> {
  __$$AttractionStateImplCopyWithImpl(
      _$AttractionStateImpl _value, $Res Function(_$AttractionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checked = null,
    Object? currentIndex = freezed,
    Object? value = freezed,
    Object? attractionList = null,
    Object? attractionTypeList = null,
    Object? isFiltering = null,
  }) {
    return _then(_$AttractionStateImpl(
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: freezed == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      attractionList: null == attractionList
          ? _value._attractionList
          : attractionList // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      attractionTypeList: null == attractionTypeList
          ? _value._attractionTypeList
          : attractionTypeList // ignore: cast_nullable_to_non_nullable
              as Set<String?>,
      isFiltering: null == isFiltering
          ? _value.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AttractionStateImpl implements _AttractionState {
  const _$AttractionStateImpl(
      {required this.checked,
      this.currentIndex,
      this.value,
      required final List<Attraction> attractionList,
      required final Set<String?> attractionTypeList,
      required this.isFiltering})
      : _attractionList = attractionList,
        _attractionTypeList = attractionTypeList;

  @override
  final bool checked;
  @override
  final int? currentIndex;
  @override
  final String? value;
  final List<Attraction> _attractionList;
  @override
  List<Attraction> get attractionList {
    if (_attractionList is EqualUnmodifiableListView) return _attractionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attractionList);
  }

  final Set<String?> _attractionTypeList;
  @override
  Set<String?> get attractionTypeList {
    if (_attractionTypeList is EqualUnmodifiableSetView)
      return _attractionTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_attractionTypeList);
  }

  @override
  final bool isFiltering;

  @override
  String toString() {
    return 'AttractionState(checked: $checked, currentIndex: $currentIndex, value: $value, attractionList: $attractionList, attractionTypeList: $attractionTypeList, isFiltering: $isFiltering)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttractionStateImpl &&
            (identical(other.checked, checked) || other.checked == checked) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality()
                .equals(other._attractionList, _attractionList) &&
            const DeepCollectionEquality()
                .equals(other._attractionTypeList, _attractionTypeList) &&
            (identical(other.isFiltering, isFiltering) ||
                other.isFiltering == isFiltering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      checked,
      currentIndex,
      value,
      const DeepCollectionEquality().hash(_attractionList),
      const DeepCollectionEquality().hash(_attractionTypeList),
      isFiltering);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttractionStateImplCopyWith<_$AttractionStateImpl> get copyWith =>
      __$$AttractionStateImplCopyWithImpl<_$AttractionStateImpl>(
          this, _$identity);
}

abstract class _AttractionState implements AttractionState {
  const factory _AttractionState(
      {required final bool checked,
      final int? currentIndex,
      final String? value,
      required final List<Attraction> attractionList,
      required final Set<String?> attractionTypeList,
      required final bool isFiltering}) = _$AttractionStateImpl;

  @override
  bool get checked;
  @override
  int? get currentIndex;
  @override
  String? get value;
  @override
  List<Attraction> get attractionList;
  @override
  Set<String?> get attractionTypeList;
  @override
  bool get isFiltering;
  @override
  @JsonKey(ignore: true)
  _$$AttractionStateImplCopyWith<_$AttractionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
