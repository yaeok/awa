import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/domain/entity/article/output/output_article.dart';
import 'package:sake/presentation/pages/account/account_view.dart';
import 'package:sake/presentation/pages/auth/email_sign_in_view.dart';
import 'package:sake/presentation/pages/auth/email_sign_up_view.dart';
import 'package:sake/presentation/pages/auth/email_verify_view.dart';
import 'package:sake/presentation/pages/home/detail/article_detail_view.dart';
import 'package:sake/presentation/pages/home/home_view.dart';
import 'package:sake/presentation/pages/home/register/article_reg_view.dart';
import 'package:sake/presentation/pages/home/update/article_upd_view.dart';
import 'package:sake/provider/current_user_provider.dart';
import 'package:sake/router/router_path.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(currentUserProvider);

    return GoRouter(
      initialLocation: RouterPath.homeViewRoute,
      routes: [
        // メールアドレスサインアップ画面
        GoRoute(
          path: RouterPath.signUpView,
          builder: (context, state) => const EmailSignUpView(),
        ),
        // メールアドレスサインイン画面
        GoRoute(
          path: RouterPath.signInView,
          builder: (context, state) => const EmailSignInView(),
        ),
        // メールアドレス確認画面
        GoRoute(
          path: RouterPath.verifyEmailView,
          builder: (context, state) => const EmailVerifyView(),
        ),
        GoRoute(
          path: RouterPath.homeViewRoute,
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
              path: RouterPath.accountView,
              builder: (context, state) => const AccountView(),
              routes: [
                GoRoute(
                  path: RouterPath.articleDetailView,
                  builder: (context, state) => ArticleDetailView(
                    recOpArticle: state.extra as OutputArticle,
                  ),
                ),
                GoRoute(
                  path: RouterPath.articleUpdView,
                  builder: (context, state) => ArticleUpdView(
                    recOpArticle: state.extra as OutputArticle,
                  ),
                ),
              ],
            ),
            GoRoute(
              path: RouterPath.articleRegView,
              builder: (context, state) => const ArticleRegView(),
            ),
            GoRoute(
              path: RouterPath.articleDetailView,
              builder: (context, state) => ArticleDetailView(
                recOpArticle: state.extra as OutputArticle,
              ),
              routes: [
                GoRoute(
                  path: RouterPath.articleUpdView,
                  builder: (context, state) => ArticleUpdView(
                    recOpArticle: state.extra as OutputArticle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) async {
        await authState.value?.reload();
        final isAuth = authState.value != null;
        final emailVerified = authState.value?.emailVerified ?? false;

        if (!isAuth && state.fullPath != RouterPath.signInView) {
          // サインインしていない and ログイン画面にいる場合
          return RouterPath.signUpView;
        } else if (!isAuth && state.fullPath != RouterPath.signUpView) {
          // サインインしていない and 新規登録画面にいる場合
          return RouterPath.signInView;
          // メールアドレスが認証されていない場合
        } else if (isAuth && !emailVerified) {
          // サインインしている and メールアドレスが認証されていない場合
          return RouterPath.verifyEmailView;
        }

        final isState = state.fullPath == RouterPath.signInView ||
            state.fullPath == RouterPath.signUpView;

        // ログイン画面 or 新規登録画面にいる場合は、何も返さない
        if (!isState) {
          return null;
        }
      },
    );
  },
);
