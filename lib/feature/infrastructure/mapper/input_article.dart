import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sake/domain/entity/article/input/input_article.dart';

class InputArticleMapper {
  static Map<String, dynamic> toJSON(InputArticle article) {
    return <String, dynamic>{
      'sakeId': article.sakeId,
      'imageURL': article.imageURL,
      'contents': article.contents,
      'valuation': article.valuation,
      'prefectureId': article.prefectureId,
      'favorite': article.favorite,
      'userId': article.userId,
      'createdAt': article.createdAt,
      'updatedAt': article.updatedAt,
      'deletedAt': article.deletedAt,
    };
  }

  static InputArticle fromJSON(Map<String, dynamic> json, String id) {
    final lstImageUrl = json['imageURL'] as List<dynamic>;
    final lstFavorite = json['favorite'] as List<dynamic>;

    return InputArticle(
      articleId: id,
      sakeId: json['sakeId'] as String?,
      imageURL: lstImageUrl.map((e) => e as String).toList(),
      contents: json['contents'] as String,
      valuation: json['valuation'] as int,
      favorite: lstFavorite.map((e) => e as String).toList(),
      prefectureId: json['prefectureId'] as String,
      userId: json['userId'] as String,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      deletedAt: json['deletedAt'] == null
          ? null
          : (json['deletedAt'] as Timestamp).toDate(),
    );
  }
}
