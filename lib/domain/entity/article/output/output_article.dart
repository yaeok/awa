import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sake/domain/entity/sake/sake.dart';
import 'package:sake/domain/entity/user/user.dart';

part 'output_article.freezed.dart';

@freezed
class OutputArticle with _$OutputArticle {
  const factory OutputArticle({
    required String articleId,
    required Sake sake,
    required List<String> imageURL,
    String? contents,
    required int valuation,
    required List<String> favorite,
    required String location,
    required User contributor,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _OutputArticle;
}
