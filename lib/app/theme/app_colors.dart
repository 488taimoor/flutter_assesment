import 'package:flutter/material.dart';

/// Centralized color palette for the app.
/// All colors used across the app should be referenced from here.
class AppColors {
  const AppColors._();

  // Backgrounds
  static const Color scaffold = Color(0xFF0A0A0A);
  static const Color card = Color(0xFF1C1C1E);
  static const Color cardLight = Color(0xFF2C2C2E);

  // Primary / Accent
  static const Color teal = Color(0xFF2D9F93);
  static const Color tealDark = Color(0xFF1A6B62);
  static const Color green = Color(0xFF34C759);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textTertiary = Color(0xFF636366);

  // UI Elements
  static const Color divider = Color(0xFF2C2C2E);
  static const Color unselectedDay = Color(0xFF3A3A3C);
  static const Color progressTrack = Color(0xFF3A3A3C);
  static const Color progressFill = Color(0xFF0A84FF);
  static const Color snackbar = Color(0xFF1C3A36);

  // Activity dot colors
  static const Color activityGreen = green;
  static const Color activityGray = Color(0xFF636366);
  static const Color activityBlue = Color(0xFF0A84FF);
  static const Color activityPink = Color(0xFFFF6B6B);

  // Workout category tag colors
  static const Color workoutGreenTag = Color(0x4022C55E);
  static const Color workoutGreenText = Color(0xFF22C55E);
  static const Color workoutPurpleTag = Color(0x408B5CF6);
  static const Color workoutPurpleText = Color(0xFF8B5CF6);

  // Mood wheel gradient colors (clockwise from top)
  static const Color moodOrange = Color(0xFFF59E0B);
  static const Color moodYellowGreen = Color(0xFF84CC16);
  static const Color moodTealLight = Color(0xFF2DD4BF);
  static const Color moodTeal = Color(0xFF14B8A6);
  static const Color moodLavender = Color(0xFFA78BFA);
  static const Color moodPink = Color(0xFFEC4899);
  static const Color moodHotPink = Color(0xFFF43F5E);

  // Mood emoji face colors
  static const Color facePeach = Color(0xFFF5D0B0);
  static const Color faceYellow = Color(0xFFF59E0B);
}
