import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sake/domain/entity/article/input/input_article.dart';
import 'package:sake/domain/entity/article/output/output_article.dart';
import 'package:sake/domain/entity/prefecture/prefecture.dart';
import 'package:sake/domain/entity/sake/sake.dart';
import 'package:sake/domain/entity/user/user.dart';
import 'package:sake/domain/repository/article.dart';
import 'package:sake/domain/repository/prefecture.dart';
import 'package:sake/domain/repository/sake.dart';
import 'package:sake/domain/repository/user.dart';
import 'package:sake/feature/controller/article/state/article_state.dart';
import 'package:sake/feature/infrastructure/article.dart';
import 'package:sake/feature/infrastructure/prefecture.dart';
import 'package:sake/feature/infrastructure/sake.dart';
import 'package:sake/feature/infrastructure/user.dart';

class ArticleController extends StateNotifier<ArticleState> {
  ArticleController({
    required this.userRepository,
    required this.articleRepository,
    required this.prefectureRepository,
    required this.sakeRepository,
  }) : super(const ArticleState(
          lstMasterArticle: [],
          lstUpdArticle: [],
          lstPrefecture: [],
        ));
  // lstMasterArticle: 全ての記事
  // lstUpdArticle: 表示中の記事
  // lstPrefecture: 全ての都道府県

  final UserRepository userRepository;
  final ArticleRepository articleRepository;
  final PrefectureRepository prefectureRepository;
  final SakeRepository sakeRepository;

  // articleの初期状態更新
  Future<void> getArticles({
    required String userId,
  }) async {
    final List<InputArticle> lstIpArticle =
        await articleRepository.getArticles(userId: userId);
    await _getStatePrefectures();

    final List<OutputArticle> lstOpArticle = [];

    for (final InputArticle ipArticle in lstIpArticle) {
      final Sake recSake = await sakeRepository.getSake(
        sakeId: ipArticle.sakeId!,
      );
      final Prefecture recPrefecture = state.lstPrefecture.firstWhere(
        (Prefecture element) => element.prefectureId == recSake.prefectureId,
      );
      final User recUser =
          await userRepository.getUser(userId: ipArticle.userId);

      lstOpArticle.add(
        OutputArticle(
          articleId: ipArticle.articleId,
          sake: recSake,
          imageURL: ipArticle.imageURL,
          contents: ipArticle.contents,
          valuation: ipArticle.valuation,
          favorite: ipArticle.favorite,
          location: recPrefecture.prefectureNameJp,
          contributor: recUser,
          createdAt: ipArticle.createdAt,
          updatedAt: ipArticle.updatedAt,
          deletedAt: ipArticle.deletedAt,
        ),
      );
    }
    state = state.copyWith(
      lstMasterArticle: lstOpArticle,
      lstUpdArticle: lstOpArticle,
    );
  }

  // prefectureの状態更新
  Future<void> _getStatePrefectures() async {
    final List<Prefecture> lstPrefecture =
        await prefectureRepository.getPrefectures();
    state = state.copyWith(
      lstPrefecture: lstPrefecture,
    );
  }

  // 記事の検索
  Future<void> searchArticles({
    required String keyword,
  }) async {
    final List<OutputArticle> lstOpArticle = state.lstMasterArticle
        .where(
          (OutputArticle element) =>
              element.sake.sakeName.contains(keyword) ||
              element.sake.prefectureId.contains(keyword),
        )
        .toList();
    state = state.copyWith(
      lstUpdArticle: lstOpArticle,
    );
  }

  // 検索モードの解除
  Future<void> clearSearch() async {
    state = state.copyWith(
      lstUpdArticle: state.lstMasterArticle,
    );
  }

  // 記事の登録
  Future<void> regArticle({
    required String userId,
    required String sakeName,
    required int valuation,
    required File image,
    required String prefectureId,
    required String contents,
  }) async {
    final Sake sake = Sake(
      sakeId: '',
      sakeName: sakeName,
      prefectureId: prefectureId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: null,
    );
    final Sake recSake = await sakeRepository.regSake(sake: sake);

    final InputArticle recIpArticle = InputArticle(
      articleId: '',
      sakeId: recSake.sakeId,
      imageURL: [image.path],
      contents: contents,
      valuation: valuation,
      favorite: [],
      prefectureId: prefectureId,
      userId: userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: null,
    );

    final InputArticle regIpArticle = await articleRepository.regArticle(
      userId: userId,
      recIpArticle: recIpArticle,
      image: image,
    );

    final OutputArticle regOpArticle = OutputArticle(
      articleId: regIpArticle.articleId,
      sake: recSake,
      imageURL: regIpArticle.imageURL,
      contents: regIpArticle.contents,
      valuation: regIpArticle.valuation,
      favorite: regIpArticle.favorite,
      location: state.lstPrefecture
          .firstWhere(
            (Prefecture element) => element.prefectureId == prefectureId,
          )
          .prefectureNameJp,
      contributor: await userRepository.getUser(userId: userId),
      createdAt: regIpArticle.createdAt,
      updatedAt: regIpArticle.updatedAt,
      deletedAt: regIpArticle.deletedAt,
    );
    state = state.copyWith(
      lstMasterArticle: [...state.lstMasterArticle, regOpArticle],
      lstUpdArticle: [...state.lstUpdArticle, regOpArticle],
    );
  }

  // 写真の選択
  Future<File?> select() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    return pickedFile?.path == null ? null : File(pickedFile!.path);
  }

  // 記事の削除
  Future<void> deleteArticle({
    required String userId,
    required String articleId,
  }) async {
    await articleRepository.delArticle(
      articleId: articleId,
    );
    state = state.copyWith(
      lstMasterArticle: state.lstMasterArticle
          .where((OutputArticle element) => element.articleId != articleId)
          .toList(),
      lstUpdArticle: state.lstUpdArticle
          .where((OutputArticle element) => element.articleId != articleId)
          .toList(),
    );
  }

  // お気に入り
  Future<void> onTapFavorite({
    required String userId,
    required String articleId,
  }) async {
    final List<OutputArticle> lstOpArticle = state.lstMasterArticle;
    final OutputArticle opArticle = lstOpArticle.firstWhere(
      (OutputArticle element) => element.articleId == articleId,
    );
    final List<String> lstFavorite = List.from(opArticle.favorite);
    if (lstFavorite.contains(userId)) {
      lstFavorite.remove(userId);
    } else {
      lstFavorite.add(userId);
    }
    final OutputArticle updOpArticle = OutputArticle(
      articleId: opArticle.articleId,
      sake: opArticle.sake,
      imageURL: opArticle.imageURL,
      contents: opArticle.contents,
      valuation: opArticle.valuation,
      favorite: lstFavorite,
      location: opArticle.location,
      contributor: opArticle.contributor,
      createdAt: opArticle.createdAt,
      updatedAt: opArticle.updatedAt,
      deletedAt: opArticle.deletedAt,
    );
    await articleRepository.updArticleFavorite(
      userId: userId,
      articleId: articleId,
    );
    state = state.copyWith(
      lstMasterArticle: state.lstMasterArticle
          .map(
            (OutputArticle element) =>
                element.articleId == articleId ? updOpArticle : element,
          )
          .toList(),
      lstUpdArticle: state.lstUpdArticle
          .map(
            (OutputArticle element) =>
                element.articleId == articleId ? updOpArticle : element,
          )
          .toList(),
    );
  }
}

final articleControllerProvider =
    StateNotifierProvider<ArticleController, ArticleState>(
  (ref) => ArticleController(
    userRepository: ref.watch(userRepositoryProvider),
    articleRepository: ref.watch(articleRepositoryProvider),
    prefectureRepository: ref.watch(prefectureRepositoryProvider),
    sakeRepository: ref.watch(sakeRepositoryProvider),
  ),
);
