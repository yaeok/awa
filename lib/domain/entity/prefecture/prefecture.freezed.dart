// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prefecture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Prefecture {
  String get prefectureId => throw _privateConstructorUsedError;
  String get prefectureNameEn => throw _privateConstructorUsedError;
  String get prefectureNameJp => throw _privateConstructorUsedError;
  int get sort => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrefectureCopyWith<Prefecture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrefectureCopyWith<$Res> {
  factory $PrefectureCopyWith(
          Prefecture value, $Res Function(Prefecture) then) =
      _$PrefectureCopyWithImpl<$Res, Prefecture>;
  @useResult
  $Res call(
      {String prefectureId,
      String prefectureNameEn,
      String prefectureNameJp,
      int sort,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$PrefectureCopyWithImpl<$Res, $Val extends Prefecture>
    implements $PrefectureCopyWith<$Res> {
  _$PrefectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefectureId = null,
    Object? prefectureNameEn = null,
    Object? prefectureNameJp = null,
    Object? sort = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      prefectureId: null == prefectureId
          ? _value.prefectureId
          : prefectureId // ignore: cast_nullable_to_non_nullable
              as String,
      prefectureNameEn: null == prefectureNameEn
          ? _value.prefectureNameEn
          : prefectureNameEn // ignore: cast_nullable_to_non_nullable
              as String,
      prefectureNameJp: null == prefectureNameJp
          ? _value.prefectureNameJp
          : prefectureNameJp // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrefectureImplCopyWith<$Res>
    implements $PrefectureCopyWith<$Res> {
  factory _$$PrefectureImplCopyWith(
          _$PrefectureImpl value, $Res Function(_$PrefectureImpl) then) =
      __$$PrefectureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String prefectureId,
      String prefectureNameEn,
      String prefectureNameJp,
      int sort,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$$PrefectureImplCopyWithImpl<$Res>
    extends _$PrefectureCopyWithImpl<$Res, _$PrefectureImpl>
    implements _$$PrefectureImplCopyWith<$Res> {
  __$$PrefectureImplCopyWithImpl(
      _$PrefectureImpl _value, $Res Function(_$PrefectureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefectureId = null,
    Object? prefectureNameEn = null,
    Object? prefectureNameJp = null,
    Object? sort = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$PrefectureImpl(
      prefectureId: null == prefectureId
          ? _value.prefectureId
          : prefectureId // ignore: cast_nullable_to_non_nullable
              as String,
      prefectureNameEn: null == prefectureNameEn
          ? _value.prefectureNameEn
          : prefectureNameEn // ignore: cast_nullable_to_non_nullable
              as String,
      prefectureNameJp: null == prefectureNameJp
          ? _value.prefectureNameJp
          : prefectureNameJp // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PrefectureImpl implements _Prefecture {
  const _$PrefectureImpl(
      {required this.prefectureId,
      required this.prefectureNameEn,
      required this.prefectureNameJp,
      required this.sort,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});

  @override
  final String prefectureId;
  @override
  final String prefectureNameEn;
  @override
  final String prefectureNameJp;
  @override
  final int sort;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Prefecture(prefectureId: $prefectureId, prefectureNameEn: $prefectureNameEn, prefectureNameJp: $prefectureNameJp, sort: $sort, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrefectureImpl &&
            (identical(other.prefectureId, prefectureId) ||
                other.prefectureId == prefectureId) &&
            (identical(other.prefectureNameEn, prefectureNameEn) ||
                other.prefectureNameEn == prefectureNameEn) &&
            (identical(other.prefectureNameJp, prefectureNameJp) ||
                other.prefectureNameJp == prefectureNameJp) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, prefectureId, prefectureNameEn,
      prefectureNameJp, sort, createdAt, updatedAt, deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrefectureImplCopyWith<_$PrefectureImpl> get copyWith =>
      __$$PrefectureImplCopyWithImpl<_$PrefectureImpl>(this, _$identity);
}

abstract class _Prefecture implements Prefecture {
  const factory _Prefecture(
      {required final String prefectureId,
      required final String prefectureNameEn,
      required final String prefectureNameJp,
      required final int sort,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$PrefectureImpl;

  @override
  String get prefectureId;
  @override
  String get prefectureNameEn;
  @override
  String get prefectureNameJp;
  @override
  int get sort;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$PrefectureImplCopyWith<_$PrefectureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
