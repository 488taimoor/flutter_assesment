import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_colors.dart';

class DarkColorsTheme implements AppColorsTheme {
  @override
  Color? appBarColor;

  @override
  Color? appBarIconColor;

  @override
  Brightness? brightness;

  @override
  Color? buttonTextColor;

  @override
  Color? canvasColor;

  @override
  ColorScheme? colorScheme;

  @override
  Color? primarySwatch;

  DarkColorsTheme() {
    appBarColor = Colors.white;
    canvasColor = AppColors.blackBackGround;
    appBarIconColor = AppColors.primaryColor;
    primarySwatch = AppColors.primaryColor;
    colorScheme = const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.blackSecondary,
      error: AppColors.redWarning,
    );
    brightness = Brightness.dark;
    buttonTextColor = Colors.white;
  }
}
