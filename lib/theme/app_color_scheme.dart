import 'package:flutter/material.dart';

class AppColorSchemes {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    //app barの色
    primary: Color(0xFF66CCFF),
    surfaceTint: Color(0xff884b6b),
    // navigation 戻るボタンの色
    onPrimary: Color(0xFF000000),
    primaryContainer: Color(0xFF333333),
    onPrimaryContainer: Color(0xFF380726),
    // floatingActionButtonの色
    secondary: Color(0xFF662233),
    // floatingActionButtonのプラスの色
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFF333333),
    onSecondaryContainer: Color(0xff291520),
    tertiary: Color(0xFFFFF4FF),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xFF333333),
    onTertiaryContainer: Color(0xff311302),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    //ダイアログの枠の色
    background: Color(0xFFCCEEFF),
    onBackground: Color(0xff21191d),
    surface: Color(0xfff5f5f5),
    onSurface: Color(0xff21191d),
    surfaceVariant: Color(0xFF333333),
    onSurfaceVariant: Color(0xff504349),
    outline: Color(0xFFC4C7CF),
    outlineVariant: Color(0xffd4c2c8),
    shadow: Color(0xff000000),
    scrim: Color(0xFFFF4477),
    inverseSurface: Color(0xff372e32),
    inversePrimary: Color(0xFFFCB0D6),
  );
}
