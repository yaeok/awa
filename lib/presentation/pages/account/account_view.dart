import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/feature/controller/auth/auth_controller.dart';
import 'package:sake/feature/controller/user/user_controller.dart';
import 'package:sake/presentation/widgets/sake_list_card.dart';
import 'package:sake/provider/current_user_provider.dart';
import 'package:sake/router/router_path.dart';
import 'package:sake/theme/app_color_scheme.dart';

class AccountView extends HookConsumerWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final currentUserInfo = ref.watch(userControllerProvider);
    final loadingState = useState(true);
    // final isEdit = useState(false);

    useEffect(() {
      Future<void> initialized() async {
        try {
          await ref
              .read(userControllerProvider.notifier)
              .initializedAccountView(userId: currentUser.value!.uid);
        } finally {
          loadingState.value = false;
        }
      }

      initialized();
      return null;
    }, const []);

    if (loadingState.value) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColorSchemes.lightColorScheme.primary,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColorSchemes.lightColorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColorSchemes.lightColorScheme.surface,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color:
                          AppColorSchemes.lightColorScheme.secondaryContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentUserInfo.recUser.username.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('ログアウト'),
              onTap: () {
                ref.read(authControllerProvider.notifier).signOut();
              },
            ),
            ListTile(
              leading: const Icon(Icons.description_rounded),
              title: const Text('プライバシーポリシー'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.description_rounded),
              title: const Text('利用規約'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: AppColorSchemes.lightColorScheme.primary,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColorSchemes.lightColorScheme.surface,
                      child: Icon(
                        Icons.person,
                        size: 20,
                        color:
                            AppColorSchemes.lightColorScheme.secondaryContainer,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      currentUserInfo.recUser.username.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {
                //     isEdit.value = !isEdit.value;
                //   },
                //   icon: const Icon(Icons.edit),
                // ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 8,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColorSchemes.lightColorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '投稿記事',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${currentUserInfo.lstUserWithArticle.length}件',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final recOpArticle = currentUserInfo.lstUserWithArticle[index];
                return ArticleListCard(
                  recOpArticle: recOpArticle,
                  onTap: () {
                    context.go(
                      RouterPath.articleDetailViewFromAccountRoute,
                      extra: recOpArticle,
                    );
                  },
                );
              },
              childCount: currentUserInfo.lstUserWithArticle.length,
            ),
          ),
        ],
      ),
    );
  }
}
