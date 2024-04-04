// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'output_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OutputArticle {
  String get articleId => throw _privateConstructorUsedError;
  Sake get sake => throw _privateConstructorUsedError;
  List<String> get imageURL => throw _privateConstructorUsedError;
  String? get contents => throw _privateConstructorUsedError;
  int get valuation => throw _privateConstructorUsedError;
  List<String> get favorite => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  User get contributor => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OutputArticleCopyWith<OutputArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutputArticleCopyWith<$Res> {
  factory $OutputArticleCopyWith(
          OutputArticle value, $Res Function(OutputArticle) then) =
      _$OutputArticleCopyWithImpl<$Res, OutputArticle>;
  @useResult
  $Res call(
      {String articleId,
      Sake sake,
      List<String> imageURL,
      String? contents,
      int valuation,
      List<String> favorite,
      String location,
      User contributor,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  $SakeCopyWith<$Res> get sake;
  $UserCopyWith<$Res> get contributor;
}

/// @nodoc
class _$OutputArticleCopyWithImpl<$Res, $Val extends OutputArticle>
    implements $OutputArticleCopyWith<$Res> {
  _$OutputArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
    Object? sake = null,
    Object? imageURL = null,
    Object? contents = freezed,
    Object? valuation = null,
    Object? favorite = null,
    Object? location = null,
    Object? contributor = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      articleId: null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
      sake: null == sake
          ? _value.sake
          : sake // ignore: cast_nullable_to_non_nullable
              as Sake,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String?,
      valuation: null == valuation
          ? _value.valuation
          : valuation // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      contributor: null == contributor
          ? _value.contributor
          : contributor // ignore: cast_nullable_to_non_nullable
              as User,
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

  @override
  @pragma('vm:prefer-inline')
  $SakeCopyWith<$Res> get sake {
    return $SakeCopyWith<$Res>(_value.sake, (value) {
      return _then(_value.copyWith(sake: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get contributor {
    return $UserCopyWith<$Res>(_value.contributor, (value) {
      return _then(_value.copyWith(contributor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OutputArticleImplCopyWith<$Res>
    implements $OutputArticleCopyWith<$Res> {
  factory _$$OutputArticleImplCopyWith(
          _$OutputArticleImpl value, $Res Function(_$OutputArticleImpl) then) =
      __$$OutputArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String articleId,
      Sake sake,
      List<String> imageURL,
      String? contents,
      int valuation,
      List<String> favorite,
      String location,
      User contributor,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? deletedAt});

  @override
  $SakeCopyWith<$Res> get sake;
  @override
  $UserCopyWith<$Res> get contributor;
}

/// @nodoc
class __$$OutputArticleImplCopyWithImpl<$Res>
    extends _$OutputArticleCopyWithImpl<$Res, _$OutputArticleImpl>
    implements _$$OutputArticleImplCopyWith<$Res> {
  __$$OutputArticleImplCopyWithImpl(
      _$OutputArticleImpl _value, $Res Function(_$OutputArticleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
    Object? sake = null,
    Object? imageURL = null,
    Object? contents = freezed,
    Object? valuation = null,
    Object? favorite = null,
    Object? location = null,
    Object? contributor = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$OutputArticleImpl(
      articleId: null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String,
      sake: null == sake
          ? _value.sake
          : sake // ignore: cast_nullable_to_non_nullable
              as Sake,
      imageURL: null == imageURL
          ? _value._imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contents: freezed == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String?,
      valuation: null == valuation
          ? _value.valuation
          : valuation // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _value._favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      contributor: null == contributor
          ? _value.contributor
          : contributor // ignore: cast_nullable_to_non_nullable
              as User,
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

class _$OutputArticleImpl implements _OutputArticle {
  const _$OutputArticleImpl(
      {required this.articleId,
      required this.sake,
      required final List<String> imageURL,
      this.contents,
      required this.valuation,
      required final List<String> favorite,
      required this.location,
      required this.contributor,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : _imageURL = imageURL,
        _favorite = favorite;

  @override
  final String articleId;
  @override
  final Sake sake;
  final List<String> _imageURL;
  @override
  List<String> get imageURL {
    if (_imageURL is EqualUnmodifiableListView) return _imageURL;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageURL);
  }

  @override
  final String? contents;
  @override
  final int valuation;
  final List<String> _favorite;
  @override
  List<String> get favorite {
    if (_favorite is EqualUnmodifiableListView) return _favorite;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorite);
  }

  @override
  final String location;
  @override
  final User contributor;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'OutputArticle(articleId: $articleId, sake: $sake, imageURL: $imageURL, contents: $contents, valuation: $valuation, favorite: $favorite, location: $location, contributor: $contributor, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutputArticleImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.sake, sake) || other.sake == sake) &&
            const DeepCollectionEquality().equals(other._imageURL, _imageURL) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.valuation, valuation) ||
                other.valuation == valuation) &&
            const DeepCollectionEquality().equals(other._favorite, _favorite) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.contributor, contributor) ||
                other.contributor == contributor) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      articleId,
      sake,
      const DeepCollectionEquality().hash(_imageURL),
      contents,
      valuation,
      const DeepCollectionEquality().hash(_favorite),
      location,
      contributor,
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutputArticleImplCopyWith<_$OutputArticleImpl> get copyWith =>
      __$$OutputArticleImplCopyWithImpl<_$OutputArticleImpl>(this, _$identity);
}

abstract class _OutputArticle implements OutputArticle {
  const factory _OutputArticle(
      {required final String articleId,
      required final Sake sake,
      required final List<String> imageURL,
      final String? contents,
      required final int valuation,
      required final List<String> favorite,
      required final String location,
      required final User contributor,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? deletedAt}) = _$OutputArticleImpl;

  @override
  String get articleId;
  @override
  Sake get sake;
  @override
  List<String> get imageURL;
  @override
  String? get contents;
  @override
  int get valuation;
  @override
  List<String> get favorite;
  @override
  String get location;
  @override
  User get contributor;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$OutputArticleImplCopyWith<_$OutputArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
