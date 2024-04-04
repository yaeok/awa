import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/article/input/input_article.dart';
import 'package:sake/domain/repository/article.dart';
import 'package:sake/feature/infrastructure/firestore/firestore.dart';
import 'package:sake/feature/infrastructure/mapper/input_article.dart';
import 'package:sake/feature/infrastructure/util/image_compressor.dart';

class IArticleRepository extends ArticleRepository {
  IArticleRepository();

  final firestore = FirebaseFirestore.instance;
  final articleDB = Firestore.article;

  @override
  Future<InputArticle?> getArticle({
    required String userId,
    required String articleId,
  }) async {
    return articleDB.doc(articleId).get().then(
      (doc) {
        if (doc.exists) {
          return InputArticleMapper.fromJSON(doc.data()!, doc.id);
        }
      },
    );
  }

  @override
  Future<List<InputArticle>> getArticles({
    required String userId,
  }) async {
    final List<InputArticle> lstIpArticle = [];
    await articleDB.where('deletedAt', isNull: true).get().then(
      (querySnapshot) {
        for (var doc in querySnapshot.docs) {
          lstIpArticle.add(
            InputArticleMapper.fromJSON(doc.data(), doc.id),
          );
        }
      },
    );
    return Future.value(lstIpArticle);
  }

  @override
  Future<InputArticle> regArticle({
    required String userId,
    required InputArticle recIpArticle,
    required File image,
  }) async {
    final url = await _uploadImage(image: image, userId: userId);
    final id = articleDB.doc().id;
    final InputArticle inputArticle = InputArticle(
      articleId: id,
      sakeId: recIpArticle.sakeId,
      imageURL: [url],
      contents: recIpArticle.contents,
      valuation: recIpArticle.valuation,
      favorite: recIpArticle.favorite,
      prefectureId: recIpArticle.prefectureId,
      userId: recIpArticle.userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: null,
    );
    await articleDB.doc(id).set(
          InputArticleMapper.toJSON(inputArticle),
        );
    return inputArticle;
  }

  @override
  Future<void> updArticle({
    required String userId,
    required InputArticle article,
  }) {
    // TODO: implement updArticle
    throw UnimplementedError();
  }

  @override
  Future<void> delArticle({
    required String articleId,
  }) async {
    await articleDB.doc(articleId).update({
      'deletedAt': DateTime.now(),
    });
  }

  Future<String> _uploadImage(
      {required File image, required String userId}) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final data = await ImageCompressor().compress(
        File(image.path).readAsBytesSync(),
        1 * 1024 * 1024,
      );
      final storageRef =
          FirebaseStorage.instance.ref().child('articles/$userId/$fileName');
      await storageRef.putData(data);
      final imageUrl = await storageRef.getDownloadURL();

      return imageUrl;
    } catch (e) {
      throw Exception('Failed to upload image$e');
    }
  }

  @override
  Future<List<InputArticle>> getMyArticles({
    required String userId,
  }) async {
    final List<InputArticle> lstIpArticle = [];
    await articleDB
        .where('userId', isEqualTo: userId)
        .where('deletedAt', isNull: true)
        .get()
        .then(
      (querySnapshot) {
        for (var doc in querySnapshot.docs) {
          lstIpArticle.add(
            InputArticleMapper.fromJSON(doc.data(), doc.id),
          );
        }
      },
    );
    return Future.value(lstIpArticle);
  }

  @override
  Future<void> updArticleFavorite({
    required String userId,
    required String articleId,
  }) async {
    await articleDB.doc(articleId).update({
      'favorite': FieldValue.arrayUnion([userId]),
    });
  }
}

final articleRepositoryProvider = Provider<IArticleRepository>(
  (ref) => IArticleRepository(),
);
