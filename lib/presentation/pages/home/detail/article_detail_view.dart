import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sake/domain/entity/article/output/output_article.dart';
import 'package:sake/feature/controller/article/article_controller.dart';
import 'package:sake/presentation/widgets/pop_menu_button.dart';
import 'package:sake/provider/current_user_provider.dart';
import 'package:sake/router/router_path.dart';
import 'package:sake/theme/app_color_scheme.dart';

class ArticleDetailView extends HookConsumerWidget {
  const ArticleDetailView({
    Key? key,
    required this.recOpArticle,
  }) : super(key: key);

  final OutputArticle recOpArticle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final articleProvider = ref.watch(articleControllerProvider);
    final bool isFavorite = articleProvider.lstUpdArticle
        .where((element) => element.articleId == recOpArticle.articleId)
        .first
        .favorite
        .contains(currentUser.value!.uid);
    String formattedDate =
        DateFormat('yyyy/MM/dd').format(recOpArticle.createdAt);
    return Scaffold(
      backgroundColor: AppColorSchemes.lightColorScheme.surface,
      appBar: AppBar(
        title: Text(recOpArticle.sake.sakeName),
        backgroundColor: AppColorSchemes.lightColorScheme.surface,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColorSchemes.lightColorScheme.surface,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            child: Icon(
                              Icons.local_bar,
                              size: 18,
                              color: AppColorSchemes.lightColorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            recOpArticle.contributor.username.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: IconButton(
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return ModalWindow(
                                isMyArticle: currentUser.value!.uid ==
                                    recOpArticle.contributor.uid,
                                articleId: recOpArticle.articleId,
                                onTapDel: () {
                                  context.pop();
                                },
                                onTapUpd: () {
                                  context.go(
                                    RouterPath.articleUpdViewFromHomeRoute,
                                    extra: recOpArticle,
                                  );
                                },
                              );
                            },
                          ),
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColorSchemes.lightColorScheme.surface,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        recOpArticle.sake.sakeName,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColorSchemes.lightColorScheme.background,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          recOpArticle.location,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColorSchemes.lightColorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColorSchemes.lightColorScheme.inverseSurface,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      recOpArticle.imageURL[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColorSchemes.lightColorScheme.surface,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color:
                                        AppColorSchemes.lightColorScheme.scrim,
                                  )
                                : const Icon(Icons.favorite_border_outlined),
                            iconSize: 28,
                            color: AppColorSchemes.lightColorScheme.onPrimary,
                            onPressed: () {
                              ref
                                  .read(articleControllerProvider.notifier)
                                  .onTapFavorite(
                                    userId: currentUser.value!.uid,
                                    articleId: recOpArticle.articleId,
                                  );
                            },
                          ),
                        ],
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColorSchemes.lightColorScheme.surface,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recOpArticle.contributor.username.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
                        child: Text(
                          recOpArticle.contents.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColorSchemes.lightColorScheme.surface,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '評価',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            for (int i = 0; i < recOpArticle.valuation; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 25,
                              ),
                            for (int i = 0; i < 5 - recOpArticle.valuation; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.grey,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
