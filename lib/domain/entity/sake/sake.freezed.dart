// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Sake {
  String get sakeId => throw _privateConstructorUsedError;
  String get sakeName => throw _privateConstructorUsedError;
  String get prefectureId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SakeCopyWith<Sake> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SakeCopyWith<$Res> {
  factory $SakeCopyWith(Sake value, $Res Function(Sake) then) =
      _$SakeCopyWithImpl<$Res, Sake>;
  @useResult
  $Res call(
      {String sakeId,
      String sakeName,
      String prefectureId,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$SakeCopyWithImpl<$Res, $Val extends Sake>
    implements $SakeCopyWith<$Res> {
  _$SakeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sakeId = null,
    Object? sakeName = null,
    Object? prefectureId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      sakeId: null == sakeId
          ? _value.sakeId
          : sakeId // ignore: cast_nullable_to_non_nullable
              as String,
      sakeName: null == sakeName
          ? _value.sakeName
          : sakeName // ignore: cast_nullable_to_non_nullable
              as String,
      prefectureId: null == prefectureId
          ? _value.prefectureId
          : prefectureId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$SakeImplCopyWith<$Res> implements $SakeCopyWith<$Res> {
  factory _$$SakeImplCopyWith(
          _$SakeImpl value, $Res Function(_$SakeImpl) then) =
      __$$SakeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sakeId,
      String sakeName,
      String prefectureId,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$$SakeImplCopyWithImpl<$Res>
    extends _$SakeCopyWithImpl<$Res, _$SakeImpl>
    implements _$$SakeImplCopyWith<$Res> {
  __$$SakeImplCopyWithImpl(_$SakeImpl _value, $Res Function(_$SakeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sakeId = null,
    Object? sakeName = null,
    Object? prefectureId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$SakeImpl(
      sakeId: null == sakeId
          ? _value.sakeId
          : sakeId // ignore: cast_nullable_to_non_nullable
              as String,
      sakeName: null == sakeName
          ? _value.sakeName
          : sakeName // ignore: cast_nullable_to_non_nullable
              as String,
      prefectureId: null == prefectureId
          ? _value.prefectureId
          : prefectureId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$SakeImpl implements _Sake {
  const _$SakeImpl(
      {required this.sakeId,
      required this.sakeName,
      required this.prefectureId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});

  @override
  final String sakeId;
  @override
  final String sakeName;
  @override
  final String prefectureId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Sake(sakeId: $sakeId, sakeName: $sakeName, prefectureId: $prefectureId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SakeImpl &&
            (identical(other.sakeId, sakeId) || other.sakeId == sakeId) &&
            (identical(other.sakeName, sakeName) ||
                other.sakeName == sakeName) &&
            (identical(other.prefectureId, prefectureId) ||
                other.prefectureId == prefectureId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sakeId, sakeName, prefectureId,
      createdAt, updatedAt, deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SakeImplCopyWith<_$SakeImpl> get copyWith =>
      __$$SakeImplCopyWithImpl<_$SakeImpl>(this, _$identity);
}

abstract class _Sake implements Sake {
  const factory _Sake(
      {required final String sakeId,
      required final String sakeName,
      required final String prefectureId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$SakeImpl;

  @override
  String get sakeId;
  @override
  String get sakeName;
  @override
  String get prefectureId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$SakeImplCopyWith<_$SakeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
