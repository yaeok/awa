import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primaryColor,
  });

  final Color? primaryColor;

  // 拡張したい色を追加する場合はここに追記
  static const light = AppColors(
    primaryColor: Color(0xFFFC9DB8),
  );

  @override
  AppColors copyWith({Color? primaryColor}) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
    );
  }
}
