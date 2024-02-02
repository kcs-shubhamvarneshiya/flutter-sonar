// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_image_slider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonImageSliderState {
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonImageSliderStateCopyWith<CommonImageSliderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonImageSliderStateCopyWith<$Res> {
  factory $CommonImageSliderStateCopyWith(CommonImageSliderState value,
          $Res Function(CommonImageSliderState) then) =
      _$CommonImageSliderStateCopyWithImpl<$Res, CommonImageSliderState>;
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class _$CommonImageSliderStateCopyWithImpl<$Res,
        $Val extends CommonImageSliderState>
    implements $CommonImageSliderStateCopyWith<$Res> {
  _$CommonImageSliderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonImageSliderStateImplCopyWith<$Res>
    implements $CommonImageSliderStateCopyWith<$Res> {
  factory _$$CommonImageSliderStateImplCopyWith(
          _$CommonImageSliderStateImpl value,
          $Res Function(_$CommonImageSliderStateImpl) then) =
      __$$CommonImageSliderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class __$$CommonImageSliderStateImplCopyWithImpl<$Res>
    extends _$CommonImageSliderStateCopyWithImpl<$Res,
        _$CommonImageSliderStateImpl>
    implements _$$CommonImageSliderStateImplCopyWith<$Res> {
  __$$CommonImageSliderStateImplCopyWithImpl(
      _$CommonImageSliderStateImpl _value,
      $Res Function(_$CommonImageSliderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_$CommonImageSliderStateImpl(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CommonImageSliderStateImpl implements _CommonImageSliderState {
  const _$CommonImageSliderStateImpl({required this.currentIndex});

  @override
  final int currentIndex;

  @override
  String toString() {
    return 'CommonImageSliderState(currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonImageSliderStateImpl &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonImageSliderStateImplCopyWith<_$CommonImageSliderStateImpl>
      get copyWith => __$$CommonImageSliderStateImplCopyWithImpl<
          _$CommonImageSliderStateImpl>(this, _$identity);
}

abstract class _CommonImageSliderState implements CommonImageSliderState {
  const factory _CommonImageSliderState({required final int currentIndex}) =
      _$CommonImageSliderStateImpl;

  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$CommonImageSliderStateImplCopyWith<_$CommonImageSliderStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
