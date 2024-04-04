import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/feature/controller/article/article_controller.dart';
import 'package:sake/provider/current_user_provider.dart';
import 'package:sake/router/router_path.dart';
import 'package:sake/theme/app_color_scheme.dart';

class ModalWindow extends HookConsumerWidget {
  const ModalWindow({
    super.key,
    this.isMyArticle = false,
    required this.onTapDel,
    required this.onTapUpd,
    required this.articleId,
  });

  final bool isMyArticle;
  final String articleId;
  final Function() onTapDel;
  final Function() onTapUpd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleProvider = ref.read(articleControllerProvider.notifier);
    final currentUser = ref.watch(currentUserProvider);

    return Container(
      decoration: BoxDecoration(
        color: AppColorSchemes.lightColorScheme.onSecondary,
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColorSchemes.lightColorScheme.background,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const Icon(Icons.share_rounded),
              title: const Text('共有する'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColorSchemes.lightColorScheme.background,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const Icon(Icons.report_problem_rounded),
              title: const Text('報告する'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 8),
          isMyArticle
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColorSchemes.lightColorScheme.background,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.delete_rounded),
                    title: const Text('削除する'),
                    onTap: () {
                      articleProvider.deleteArticle(
                        userId: currentUser.value!.uid,
                        articleId: articleId,
                      );
                      Navigator.pop(context);
                      onTapDel();
                    },
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 8),
          isMyArticle
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColorSchemes.lightColorScheme.background,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.edit_rounded),
                    title: const Text('編集する'),
                    onTap: () {
                      onTapUpd();
                      Navigator.pop(context);
                    },
                  ),
                )
              : const SizedBox(),
          !isMyArticle
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColorSchemes.lightColorScheme.background,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.edit_rounded),
                    title: const Text('この投稿をミュートにする'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
