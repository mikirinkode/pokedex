import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_typography.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        primaryColor: AppColor.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.grayscaleWhite,
        textTheme: const TextTheme(
            headlineLarge: AppTypography.headline,
            headlineMedium: AppTypography.subtitle1,
            headlineSmall: AppTypography.subtitle2,
            bodyLarge: AppTypography.bodyText1,
            bodyMedium: AppTypography.bodyText2,
            bodySmall: AppTypography.bodyText3),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primary,
          elevation: 0,
          titleTextStyle:
              AppTypography.headline.copyWith(color: AppColor.grayscaleWhite),
          foregroundColor: AppColor.grayscaleWhite
        ));
  }
}
