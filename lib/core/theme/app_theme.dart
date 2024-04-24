import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: AppColor.grayscaleDark
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primary,
          elevation: 0,
          titleTextStyle:
              AppTypography.headline.copyWith(color: AppColor.grayscaleWhite),
          foregroundColor: AppColor.grayscaleWhite
        ));
  }
}
