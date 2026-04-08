import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// App-wide ThemeData configuration.
class AppTheme {
  const AppTheme._();

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.scaffold,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.teal,
          surface: AppColors.card,
          onSurface: AppColors.textPrimary,
        ),
        textTheme: GoogleFonts.mulishTextTheme(ThemeData.dark().textTheme),
        cardTheme: const CardThemeData(
          color: AppColors.card,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.scaffold,
          selectedItemColor: AppColors.textPrimary,
          unselectedItemColor: AppColors.textTertiary,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.scaffold,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      );
}
