import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sake/provider/loading_state_provider.dart';
import 'package:sake/router/go_router.dart';
import 'package:sake/theme/theme.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingStateProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          routerConfig: ref.watch(goRouterProvider),
          builder: (context, child) {
            return Stack(
              children: [
                if (child != null) child,
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ), // ローディング中はインジケーターを表示
              ],
            );
          },
        );
      },
    );
  }
}
