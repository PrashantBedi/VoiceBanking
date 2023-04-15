import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";

import "../colors/app_colors.dart";

class AppTheme {
  static ThemeMode currentTheme =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

  static final ThemeData lightTheme = ThemeData(
    // scaffoldBackgroundColor: AppColors.backgroundLight,
    // appBarTheme: const AppBarTheme(
      // color: AppColors.primary,
    //   iconTheme: IconThemeData(
    //     color: AppColors.black,
    //   ),
    // ),
    // colorScheme: const ColorScheme.light(
    //   primary: AppColors.secondaryLight,
    //   onPrimary: AppColors.black,
    //   secondary: AppColors.secondaryLight,
    //   onSecondary: AppColors.black,
    //   error: AppColors.primaryLight,
    //   onError: AppColors.error,
    //   background: AppColors.backgroundLight,
    //   onBackground: AppColors.black,
    //   surface: AppColors.backgroundLight,
    //   onSurface: AppColors.black,
    // ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontFamily: "SF Pro Text",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: "SF Pro Text",
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.normal,
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.normal,
      ),
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontFamily: "SF Pro Text",
      ),
      labelSmall: TextStyle(
        fontSize: 18,
        fontFamily: "SF Pro Text",
        fontStyle: FontStyle.normal,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 22,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    // scaffoldBackgroundColor: AppColors.backgroundDark,
    // appBarTheme: const AppBarTheme(
    //   color: AppColors.backgroundDark,
    //   iconTheme: IconThemeData(
    //     color: AppColors.white,
    //   ),
    // ),
    // colorScheme: const ColorScheme.dark(
    //   primary: AppColors.secondaryDark,
    //   onPrimary: AppColors.white,
    //   secondary: AppColors.secondaryDark,
    //   onSecondary: AppColors.white,
    //   error: AppColors.primaryDark,
    //   onError: AppColors.error,
    //   background: AppColors.backgroundDark,
    //   onBackground: AppColors.white,
    //   surface: AppColors.backgroundDark,
    //   onSurface: AppColors.white,
    // ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontFamily: "SF Pro Text",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: "SF Pro Text",
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.normal,
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.normal,
      ),
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontFamily: "SF Pro Text",
      ),
      labelSmall: TextStyle(
        fontSize: 18,
        fontFamily: "SF Pro Text",
        fontStyle: FontStyle.normal,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 22,
        fontFamily: "SF Pro Text",
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
