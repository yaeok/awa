// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArticleState {
  List<OutputArticle> get lstMasterArticle =>
      throw _privateConstructorUsedError;
  List<OutputArticle> get lstUpdArticle => throw _privateConstructorUsedError;
  List<Prefecture> get lstPrefecture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleStateCopyWith<ArticleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleStateCopyWith<$Res> {
  factory $ArticleStateCopyWith(
          ArticleState value, $Res Function(ArticleState) then) =
      _$ArticleStateCopyWithImpl<$Res, ArticleState>;
  @useResult
  $Res call(
      {List<OutputArticle> lstMasterArticle,
      List<OutputArticle> lstUpdArticle,
      List<Prefecture> lstPrefecture});
}

/// @nodoc
class _$ArticleStateCopyWithImpl<$Res, $Val extends ArticleState>
    implements $ArticleStateCopyWith<$Res> {
  _$ArticleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lstMasterArticle = null,
    Object? lstUpdArticle = null,
    Object? lstPrefecture = null,
  }) {
    return _then(_value.copyWith(
      lstMasterArticle: null == lstMasterArticle
          ? _value.lstMasterArticle
          : lstMasterArticle // ignore: cast_nullable_to_non_nullable
              as List<OutputArticle>,
      lstUpdArticle: null == lstUpdArticle
          ? _value.lstUpdArticle
          : lstUpdArticle // ignore: cast_nullable_to_non_nullable
              as List<OutputArticle>,
      lstPrefecture: null == lstPrefecture
          ? _value.lstPrefecture
          : lstPrefecture // ignore: cast_nullable_to_non_nullable
              as List<Prefecture>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleStateImplCopyWith<$Res>
    implements $ArticleStateCopyWith<$Res> {
  factory _$$ArticleStateImplCopyWith(
          _$ArticleStateImpl value, $Res Function(_$ArticleStateImpl) then) =
      __$$ArticleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OutputArticle> lstMasterArticle,
      List<OutputArticle> lstUpdArticle,
      List<Prefecture> lstPrefecture});
}

/// @nodoc
class __$$ArticleStateImplCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$ArticleStateImpl>
    implements _$$ArticleStateImplCopyWith<$Res> {
  __$$ArticleStateImplCopyWithImpl(
      _$ArticleStateImpl _value, $Res Function(_$ArticleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lstMasterArticle = null,
    Object? lstUpdArticle = null,
    Object? lstPrefecture = null,
  }) {
    return _then(_$ArticleStateImpl(
      lstMasterArticle: null == lstMasterArticle
          ? _value._lstMasterArticle
          : lstMasterArticle // ignore: cast_nullable_to_non_nullable
              as List<OutputArticle>,
      lstUpdArticle: null == lstUpdArticle
          ? _value._lstUpdArticle
          : lstUpdArticle // ignore: cast_nullable_to_non_nullable
              as List<OutputArticle>,
      lstPrefecture: null == lstPrefecture
          ? _value._lstPrefecture
          : lstPrefecture // ignore: cast_nullable_to_non_nullable
              as List<Prefecture>,
    ));
  }
}

/// @nodoc

class _$ArticleStateImpl implements _ArticleState {
  const _$ArticleStateImpl(
      {required final List<OutputArticle> lstMasterArticle,
      required final List<OutputArticle> lstUpdArticle,
      required final List<Prefecture> lstPrefecture})
      : _lstMasterArticle = lstMasterArticle,
        _lstUpdArticle = lstUpdArticle,
        _lstPrefecture = lstPrefecture;

  final List<OutputArticle> _lstMasterArticle;
  @override
  List<OutputArticle> get lstMasterArticle {
    if (_lstMasterArticle is EqualUnmodifiableListView)
      return _lstMasterArticle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lstMasterArticle);
  }

  final List<OutputArticle> _lstUpdArticle;
  @override
  List<OutputArticle> get lstUpdArticle {
    if (_lstUpdArticle is EqualUnmodifiableListView) return _lstUpdArticle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lstUpdArticle);
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
    return 'ArticleState(lstMasterArticle: $lstMasterArticle, lstUpdArticle: $lstUpdArticle, lstPrefecture: $lstPrefecture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleStateImpl &&
            const DeepCollectionEquality()
                .equals(other._lstMasterArticle, _lstMasterArticle) &&
            const DeepCollectionEquality()
                .equals(other._lstUpdArticle, _lstUpdArticle) &&
            const DeepCollectionEquality()
                .equals(other._lstPrefecture, _lstPrefecture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lstMasterArticle),
      const DeepCollectionEquality().hash(_lstUpdArticle),
      const DeepCollectionEquality().hash(_lstPrefecture));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleStateImplCopyWith<_$ArticleStateImpl> get copyWith =>
      __$$ArticleStateImplCopyWithImpl<_$ArticleStateImpl>(this, _$identity);
}

abstract class _ArticleState implements ArticleState {
  const factory _ArticleState(
      {required final List<OutputArticle> lstMasterArticle,
      required final List<OutputArticle> lstUpdArticle,
      required final List<Prefecture> lstPrefecture}) = _$ArticleStateImpl;

  @override
  List<OutputArticle> get lstMasterArticle;
  @override
  List<OutputArticle> get lstUpdArticle;
  @override
  List<Prefecture> get lstPrefecture;
  @override
  @JsonKey(ignore: true)
  _$$ArticleStateImplCopyWith<_$ArticleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
