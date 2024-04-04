import 'dart:io';

import 'package:sake/domain/entity/article/input/input_article.dart';

abstract class ArticleRepository {
  Future<List<InputArticle>> getArticles({
    required String userId,
  });
  Future<InputArticle?> getArticle({
    required String userId,
    required String articleId,
  });
  Future<InputArticle> regArticle({
    required String userId,
    required InputArticle recIpArticle,
    required File image,
  });
  Future<void> updArticle({
    required String userId,
    required InputArticle article,
  });
  Future<void> delArticle({
    required String articleId,
  });
  Future<List<InputArticle>> getMyArticles({
    required String userId,
  });
  Future<void> updArticleFavorite({
    required String userId,
    required String articleId,
  });
}
