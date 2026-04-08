import 'package:flutter/material.dart';

/// Consistent spacing values used across the app.
class AppSpacing {
  const AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: lg);

  static const double cardRadius = 16;
  static const double cardRadiusSm = 12;
}
