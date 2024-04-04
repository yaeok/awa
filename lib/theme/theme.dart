import 'package:flutter/material.dart';
import 'package:sake/theme/app_color_scheme.dart';
import 'package:sake/theme/app_colors.dart';

ThemeData lightTheme() {
  final theme = ThemeData.from(
    useMaterial3: false,
    colorScheme: AppColorSchemes.lightColorScheme,
  );
  return theme.copyWith(
    textTheme: theme.textTheme.apply(
      displayColor: theme.colorScheme.onBackground,
      bodyColor: theme.colorScheme.onBackground,
    ),
    scaffoldBackgroundColor: theme.colorScheme.background,
    canvasColor: theme.colorScheme.surface,
    extensions: const {
      AppColors.light,
    },
    cardTheme: theme.cardTheme.copyWith(
      color: theme.colorScheme.tertiary,
    ),
  );
}
