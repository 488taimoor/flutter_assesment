import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_colors.dart';

class LightColorsTheme implements AppColorsTheme {
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

  LightColorsTheme() {
    appBarColor = Colors.white;
    canvasColor = AppColors.blackBackGround;
    appBarIconColor = AppColors.primaryColor; // AppColors.primaryBlack;
    primarySwatch = AppColors.primaryColor;
    colorScheme = const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.blackSecondary,
      error: AppColors.redWarning,
    );
    brightness = Brightness.light;
    buttonTextColor = Colors.white;
  }
}
