import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_typography.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.primary,
            primary: AppColor.primary,
            background: AppColor.background
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.background,
        textTheme: const TextTheme(
            headlineLarge: AppTypography.headline,
            headlineMedium: AppTypography.subtitle1,
            headlineSmall: AppTypography.subtitle2,
            bodyLarge: AppTypography.bodyText1,
            bodyMedium: AppTypography.bodyText2,
            bodySmall: AppTypography.bodyText3));
  }
}
