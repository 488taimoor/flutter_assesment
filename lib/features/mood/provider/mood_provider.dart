import 'dart:math';

import 'package:flutter/material.dart';

import '../models/mood_data.dart';

/// Manages the mood wheel state.
///
/// Tracks the thumb angle on the circular ring and
/// computes the current mood based on which quadrant
/// the thumb is in.
class MoodProvider extends ChangeNotifier {
  /// Angle in radians, 0 = right (3 o'clock), measured counter-clockwise.
  /// We convert to a normalized angle for mood mapping.
  double _thumbAngle = -pi / 4; // Start at ~1 o'clock (Calm)

  double get thumbAngle => _thumbAngle;

  /// Updates the thumb angle based on drag position.
  void updateAngle(Offset position, Offset center) {
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;
    _thumbAngle = atan2(dy, dx);
    notifyListeners();
  }

  /// Returns the current mood based on the thumb's quadrant.
  ///
  /// Quadrants (using standard atan2 where 0=right, positive=down):
  /// - Calm: top-right (-pi/2 to 0) → index 0
  /// - Content: bottom-right (0 to pi/2) → index 1
  /// - Peaceful: bottom-left (pi/2 to pi) → index 2
  /// - Happy: top-left (-pi to -pi/2) → index 3
  MoodData get currentMood {
    final angle = _thumbAngle;

    if (angle >= -pi / 2 && angle < 0) {
      return MoodData.moods[0]; // Calm (top-right)
    } else if (angle >= 0 && angle < pi / 2) {
      return MoodData.moods[1]; // Content (bottom-right)
    } else if (angle >= pi / 2 && angle <= pi) {
      return MoodData.moods[2]; // Peaceful (bottom-left)
    } else {
      return MoodData.moods[3]; // Happy (top-left)
    }
  }

  /// X position of thumb on the ring.
  double thumbX(double radius) => radius * cos(_thumbAngle);

  /// Y position of thumb on the ring.
  double thumbY(double radius) => radius * sin(_thumbAngle);
}
