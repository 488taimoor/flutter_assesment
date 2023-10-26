import 'package:flutter/material.dart';

abstract class AppTextTheme {
  AppTextTheme({this.primaryTextColor});

  final Color? primaryTextColor;
  late final TextTheme textThemeData;
  TextStyle? displayLarge;
  TextStyle? displayMedium;
  TextStyle? displaySmall;
  TextStyle? headlineLarge;
  TextStyle? headlineMedium;
  TextStyle? headlineSmall;
  TextStyle? titleLarge;
  TextStyle? titleMedium;
  TextStyle? titleSmall;
  TextStyle? labelLarge;
  TextStyle? labelMedium;
  TextStyle? labelSmall;
  TextStyle? bodyLarge;
  TextStyle? bodyMedium;
  TextStyle? bodySmall;
}
