import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/article/input/input_article.dart';
import 'package:sake/domain/entity/article/output/output_article.dart';
import 'package:sake/domain/entity/prefecture/prefecture.dart';
import 'package:sake/domain/entity/user/user.dart';
import 'package:sake/domain/repository/article.dart';
import 'package:sake/domain/repository/prefecture.dart';
import 'package:sake/domain/repository/sake.dart';
import 'package:sake/domain/repository/user.dart';
import 'package:sake/feature/controller/user/state/user_state.dart';
import 'package:sake/feature/infrastructure/article.dart';
import 'package:sake/feature/infrastructure/prefecture.dart';
import 'package:sake/feature/infrastructure/sake.dart';
import 'package:sake/feature/infrastructure/user.dart';

class UserController extends StateNotifier<UserState> {
  UserController({
    required this.userRepository,
    required this.articleRepository,
    required this.prefectureRepository,
    required this.sakeRepository,
  }) : super(
          UserState(
            recUser: User(
              uid: '',
              email: '',
              username: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
            lstUserWithArticle: [],
            lstPrefecture: [],
          ),
        );

  final UserRepository userRepository;
  final ArticleRepository articleRepository;
  final PrefectureRepository prefectureRepository;
  final SakeRepository sakeRepository;

  Future<void> initializedAccountView({
    required String userId,
  }) async {
    final User recUser = await userRepository.getUser(userId: userId);
    await _getStatePrefectures();

    final List<InputArticle> lstUserWithArticle =
        await articleRepository.getMyArticles(userId: userId);

    final List<OutputArticle> lstOpArticle = [];
    for (final InputArticle ipArticle in lstUserWithArticle) {
      final recSake = await sakeRepository.getSake(
        sakeId: ipArticle.sakeId!,
      );
      final Prefecture recPrefecture = state.lstPrefecture.firstWhere(
        (Prefecture element) => element.prefectureId == recSake.prefectureId,
      );
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
      recUser: recUser,
      lstUserWithArticle: lstOpArticle,
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
}

final userControllerProvider = StateNotifierProvider<UserController, UserState>(
  (ref) => UserController(
    userRepository: ref.watch(userRepositoryProvider),
    articleRepository: ref.watch(articleRepositoryProvider),
    prefectureRepository: ref.watch(prefectureRepositoryProvider),
    sakeRepository: ref.watch(sakeRepositoryProvider),
  ),
);
