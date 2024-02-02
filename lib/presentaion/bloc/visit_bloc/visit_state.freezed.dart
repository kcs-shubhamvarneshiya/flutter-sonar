// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VisitState {
  List<Attraction> get attractionList => throw _privateConstructorUsedError;
  List<Attraction> get attractionAddList => throw _privateConstructorUsedError;
  int get totalHours => throw _privateConstructorUsedError;
  List<Attraction> get mainAttractionList => throw _privateConstructorUsedError;
  bool get isFiltering => throw _privateConstructorUsedError;
  bool get isExist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VisitStateCopyWith<VisitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitStateCopyWith<$Res> {
  factory $VisitStateCopyWith(
          VisitState value, $Res Function(VisitState) then) =
      _$VisitStateCopyWithImpl<$Res, VisitState>;
  @useResult
  $Res call(
      {List<Attraction> attractionList,
      List<Attraction> attractionAddList,
      int totalHours,
      List<Attraction> mainAttractionList,
      bool isFiltering,
      bool isExist});
}

/// @nodoc
class _$VisitStateCopyWithImpl<$Res, $Val extends VisitState>
    implements $VisitStateCopyWith<$Res> {
  _$VisitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attractionList = null,
    Object? attractionAddList = null,
    Object? totalHours = null,
    Object? mainAttractionList = null,
    Object? isFiltering = null,
    Object? isExist = null,
  }) {
    return _then(_value.copyWith(
      attractionList: null == attractionList
          ? _value.attractionList
          : attractionList // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      attractionAddList: null == attractionAddList
          ? _value.attractionAddList
          : attractionAddList // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as int,
      mainAttractionList: null == mainAttractionList
          ? _value.mainAttractionList
          : mainAttractionList // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      isFiltering: null == isFiltering
          ? _value.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
      isExist: null == isExist
          ? _value.isExist
          : isExist // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitStateImplCopyWith<$Res>
    implements $VisitStateCopyWith<$Res> {
  factory _$$VisitStateImplCopyWith(
          _$VisitStateImpl value, $Res Function(_$VisitStateImpl) then) =
      __$$VisitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Attraction> attractionList,
      List<Attraction> attractionAddList,
      int totalHours,
      List<Attraction> mainAttractionList,
      bool isFiltering,
      bool isExist});
}

/// @nodoc
class __$$VisitStateImplCopyWithImpl<$Res>
    extends _$VisitStateCopyWithImpl<$Res, _$VisitStateImpl>
    implements _$$VisitStateImplCopyWith<$Res> {
  __$$VisitStateImplCopyWithImpl(
      _$VisitStateImpl _value, $Res Function(_$VisitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attractionList = null,
    Object? attractionAddList = null,
    Object? totalHours = null,
    Object? mainAttractionList = null,
    Object? isFiltering = null,
    Object? isExist = null,
  }) {
    return _then(_$VisitStateImpl(
      attractionList: null == attractionList
          ? _value._attractionList
          : attractionList // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      attractionAddList: null == attractionAddList
          ? _value._attractionAddList
          : attractionAddList // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as int,
      mainAttractionList: null == mainAttractionList
          ? _value._mainAttractionList
          : mainAttractionList // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      isFiltering: null == isFiltering
          ? _value.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
      isExist: null == isExist
          ? _value.isExist
          : isExist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VisitStateImpl implements _VisitState {
  const _$VisitStateImpl(
      {required final List<Attraction> attractionList,
      required final List<Attraction> attractionAddList,
      required this.totalHours,
      required final List<Attraction> mainAttractionList,
      required this.isFiltering,
      required this.isExist})
      : _attractionList = attractionList,
        _attractionAddList = attractionAddList,
        _mainAttractionList = mainAttractionList;

  final List<Attraction> _attractionList;
  @override
  List<Attraction> get attractionList {
    if (_attractionList is EqualUnmodifiableListView) return _attractionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attractionList);
  }

  final List<Attraction> _attractionAddList;
  @override
  List<Attraction> get attractionAddList {
    if (_attractionAddList is EqualUnmodifiableListView)
      return _attractionAddList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attractionAddList);
  }

  @override
  final int totalHours;
  final List<Attraction> _mainAttractionList;
  @override
  List<Attraction> get mainAttractionList {
    if (_mainAttractionList is EqualUnmodifiableListView)
      return _mainAttractionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mainAttractionList);
  }

  @override
  final bool isFiltering;
  @override
  final bool isExist;

  @override
  String toString() {
    return 'VisitState(attractionList: $attractionList, attractionAddList: $attractionAddList, totalHours: $totalHours, mainAttractionList: $mainAttractionList, isFiltering: $isFiltering, isExist: $isExist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitStateImpl &&
            const DeepCollectionEquality()
                .equals(other._attractionList, _attractionList) &&
            const DeepCollectionEquality()
                .equals(other._attractionAddList, _attractionAddList) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            const DeepCollectionEquality()
                .equals(other._mainAttractionList, _mainAttractionList) &&
            (identical(other.isFiltering, isFiltering) ||
                other.isFiltering == isFiltering) &&
            (identical(other.isExist, isExist) || other.isExist == isExist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_attractionList),
      const DeepCollectionEquality().hash(_attractionAddList),
      totalHours,
      const DeepCollectionEquality().hash(_mainAttractionList),
      isFiltering,
      isExist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitStateImplCopyWith<_$VisitStateImpl> get copyWith =>
      __$$VisitStateImplCopyWithImpl<_$VisitStateImpl>(this, _$identity);
}

abstract class _VisitState implements VisitState {
  const factory _VisitState(
      {required final List<Attraction> attractionList,
      required final List<Attraction> attractionAddList,
      required final int totalHours,
      required final List<Attraction> mainAttractionList,
      required final bool isFiltering,
      required final bool isExist}) = _$VisitStateImpl;

  @override
  List<Attraction> get attractionList;
  @override
  List<Attraction> get attractionAddList;
  @override
  int get totalHours;
  @override
  List<Attraction> get mainAttractionList;
  @override
  bool get isFiltering;
  @override
  bool get isExist;
  @override
  @JsonKey(ignore: true)
  _$$VisitStateImplCopyWith<_$VisitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
