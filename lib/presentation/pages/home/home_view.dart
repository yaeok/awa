import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/feature/controller/article/article_controller.dart';
import 'package:sake/presentation/widgets/round_rect_button.dart';
import 'package:sake/presentation/widgets/sake_list_card.dart';
import 'package:sake/presentation/widgets/search_icon.dart';
import 'package:sake/provider/current_user_provider.dart';
import 'package:sake/router/router_path.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    final articleProvider = ref.watch(articleControllerProvider);
    final currentUser = ref.watch(currentUserProvider);
    final isLoading = useState(true);
    void search(String strKeyword) {
      ref
          .read(articleControllerProvider.notifier)
          .searchArticles(keyword: strKeyword);
    }

    useEffect(() {
      Future<void> initialized() async {
        await ref.read(articleControllerProvider.notifier).getArticles(
              userId: currentUser.value!.uid,
            );
        isLoading.value = false;
      }

      initialized();
      return null;
    }, const []);

    if (isLoading.value) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: textEditingController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          hintText: '検索ワード',
                        ),
                        onFieldSubmitted: search,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      context.go(RouterPath.accountViewRoute);
                    },
                    icon: const Icon(Icons.settings),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: articleProvider.lstPrefecture
                      .expand(
                        (value) => [
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              SearchIcon(
                                size: 75,
                                iconSize: 50,
                                onPressed: () {
                                  search(value.prefectureId);
                                },
                              ),
                              const SizedBox(height: 4),
                              Text(
                                value.prefectureNameJp.toString(),
                              ),
                            ],
                          )
                        ],
                      )
                      .toList(),
                ),
              ),
              articleProvider.lstUpdArticle.isEmpty
                  ? Column(
                      children: [
                        const SizedBox(height: 32),
                        const Center(
                          child: Text(
                            '検索結果がありません。',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                            width: 150,
                            child: RoundRectButton(
                              title: '全て表示',
                              onPressed: () {
                                ref
                                    .read(articleControllerProvider.notifier)
                                    .clearSearch();
                              },
                            )),
                      ],
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: ListView.builder(
                          itemCount: articleProvider.lstUpdArticle.length,
                          itemBuilder: (context, index) {
                            final article =
                                articleProvider.lstUpdArticle[index];
                            return ArticleListCard(
                              recOpArticle: article,
                              onTap: () {
                                context.go(
                                  RouterPath.articleDetailViewFromHomeRoute,
                                  extra: article,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go(RouterPath.articleRegViewRoute);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
