// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserState {
  User get recUser => throw _privateConstructorUsedError;
  List<OutputArticle> get lstUserWithArticle =>
      throw _privateConstructorUsedError;
  List<Prefecture> get lstPrefecture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {User recUser,
      List<OutputArticle> lstUserWithArticle,
      List<Prefecture> lstPrefecture});

  $UserCopyWith<$Res> get recUser;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recUser = null,
    Object? lstUserWithArticle = null,
    Object? lstPrefecture = null,
  }) {
    return _then(_value.copyWith(
      recUser: null == recUser
          ? _value.recUser
          : recUser // ignore: cast_nullable_to_non_nullable
              as User,
      lstUserWithArticle: null == lstUserWithArticle
          ? _value.lstUserWithArticle
          : lstUserWithArticle // ignore: cast_nullable_to_non_nullable
              as List<OutputArticle>,
      lstPrefecture: null == lstPrefecture
          ? _value.lstPrefecture
          : lstPrefecture // ignore: cast_nullable_to_non_nullable
              as List<Prefecture>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get recUser {
    return $UserCopyWith<$Res>(_value.recUser, (value) {
      return _then(_value.copyWith(recUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User recUser,
      List<OutputArticle> lstUserWithArticle,
      List<Prefecture> lstPrefecture});

  @override
  $UserCopyWith<$Res> get recUser;
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recUser = null,
    Object? lstUserWithArticle = null,
    Object? lstPrefecture = null,
  }) {
    return _then(_$UserStateImpl(
      recUser: null == recUser
          ? _value.recUser
          : recUser // ignore: cast_nullable_to_non_nullable
              as User,
      lstUserWithArticle: null == lstUserWithArticle
          ? _value._lstUserWithArticle
          : lstUserWithArticle // ignore: cast_nullable_to_non_nullable
              as List<OutputArticle>,
      lstPrefecture: null == lstPrefecture
          ? _value._lstPrefecture
          : lstPrefecture // ignore: cast_nullable_to_non_nullable
              as List<Prefecture>,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {required this.recUser,
      required final List<OutputArticle> lstUserWithArticle,
      required final List<Prefecture> lstPrefecture})
      : _lstUserWithArticle = lstUserWithArticle,
        _lstPrefecture = lstPrefecture;

  @override
  final User recUser;
  final List<OutputArticle> _lstUserWithArticle;
  @override
  List<OutputArticle> get lstUserWithArticle {
    if (_lstUserWithArticle is EqualUnmodifiableListView)
      return _lstUserWithArticle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lstUserWithArticle);
  }

  final List<Prefecture> _lstPrefecture;
  @override
  List<Prefecture> get lstPrefecture {
    if (_lstPrefecture is EqualUnmodifiableListView) return _lstPrefecture;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lstPrefecture);
  }

  @override
  String toString() {
    return 'UserState(recUser: $recUser, lstUserWithArticle: $lstUserWithArticle, lstPrefecture: $lstPrefecture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.recUser, recUser) || other.recUser == recUser) &&
            const DeepCollectionEquality()
                .equals(other._lstUserWithArticle, _lstUserWithArticle) &&
            const DeepCollectionEquality()
                .equals(other._lstPrefecture, _lstPrefecture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      recUser,
      const DeepCollectionEquality().hash(_lstUserWithArticle),
      const DeepCollectionEquality().hash(_lstPrefecture));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {required final User recUser,
      required final List<OutputArticle> lstUserWithArticle,
      required final List<Prefecture> lstPrefecture}) = _$UserStateImpl;

  @override
  User get recUser;
  @override
  List<OutputArticle> get lstUserWithArticle;
  @override
  List<Prefecture> get lstPrefecture;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
