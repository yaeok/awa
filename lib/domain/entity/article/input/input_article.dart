import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_article.freezed.dart';

@freezed
class InputArticle with _$InputArticle {
  const factory InputArticle({
    required String articleId,
    String? sakeId,
    required List<String> imageURL,
    String? contents,
    required int valuation,
    required List<String> favorite,
    required String prefectureId,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _InputArticle;
}
