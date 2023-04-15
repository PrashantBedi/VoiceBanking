import "package:flutter/material.dart";

import "../theme/app_theme.dart";
import "app_color.dart";
import "app_colors.dart";

extension AppThemeContextExtension on BuildContext {
  Color getColor(AppColor key) {
    return AppThemeWrapper().getColor(key);
  }

  bool get isDark => AppThemeWrapper().isDarkTheme();
}

class AppThemeWrapper {
  AppThemeWrapper();

  Color getColor(AppColor key) {
    return _themeColorsMap[AppTheme.currentTheme][key];
  }

  bool isDarkTheme() {
    return AppTheme.currentTheme == ThemeMode.dark;
  }

  final Map<ThemeMode, dynamic> _themeColorsMap = {
    ThemeMode.light: {
      AppColor.transparent: AppColors.transparent,
      AppColor.icon: AppColors.iconLight,
      AppColor.primary: AppColors.primary,
      AppColor.textChatBox: AppColors.textChatBox,
    },
  };
}
