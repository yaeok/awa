import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sake/domain/entity/article/output/output_article.dart';
import 'package:sake/domain/entity/prefecture/prefecture.dart';

part 'article_state.freezed.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState({
    required List<OutputArticle> lstMasterArticle,
    required List<OutputArticle> lstUpdArticle,
    required List<Prefecture> lstPrefecture,
  }) = _ArticleState;
}
