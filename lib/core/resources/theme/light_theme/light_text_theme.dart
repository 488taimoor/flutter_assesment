import 'package:flutter/material.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_text.dart';

class LightTextTheme implements AppTextTheme {
  @override
  TextStyle? bodyLarge;

  @override
  TextStyle? bodyMedium;

  @override
  TextStyle? bodySmall;

  @override
  TextStyle? displayLarge;

  @override
  TextStyle? displayMedium;

  @override
  TextStyle? displaySmall;

  @override
  TextStyle? headlineLarge;

  @override
  TextStyle? headlineMedium;

  @override
  TextStyle? headlineSmall;

  @override
  TextStyle? labelLarge;

  @override
  TextStyle? labelMedium;

  @override
  TextStyle? labelSmall;

  @override
  late final TextTheme textThemeData;

  @override
  TextStyle? titleLarge;

  @override
  TextStyle? titleMedium;

  @override
  TextStyle? titleSmall;

  @override
  final Color? primaryTextColor;

  LightTextTheme({this.primaryTextColor}) {
    textThemeData = TextTheme(
      displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          color: primaryTextColor),
      displayMedium: TextStyle(
          fontSize: 45, fontWeight: FontWeight.w700, color: primaryTextColor),
      displaySmall: TextStyle(
          fontSize: 36, fontWeight: FontWeight.w400, color: primaryTextColor),
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.w400, color: primaryTextColor),
      headlineMedium: TextStyle(
          fontSize: 28, fontWeight: FontWeight.w500, color: primaryTextColor),
      headlineSmall: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w400, color: primaryTextColor),
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700, color: primaryTextColor),
      titleMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: primaryTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: primaryTextColor,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        color: primaryTextColor,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: primaryTextColor,
      ),
      labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: primaryTextColor),
      bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: primaryTextColor),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: primaryTextColor),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: primaryTextColor),
    );
  }
}
