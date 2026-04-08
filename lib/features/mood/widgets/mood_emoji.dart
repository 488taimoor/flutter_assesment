import 'package:flutter/material.dart';

import '../models/mood_data.dart';

/// Displays the mood emoji as a PNG image from assets.
///
/// Uses [AnimatedSwitcher] for smooth transitions between moods.
class MoodEmoji extends StatelessWidget {
  const MoodEmoji({super.key, required this.mood});

  final MoodData mood;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ClipRRect(
        key: ValueKey(mood.name),
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          mood.assetPath,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
