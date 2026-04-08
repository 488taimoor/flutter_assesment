import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../provider/mood_provider.dart';
import '../widgets/mood_wheel.dart';

/// Mood selection screen with a circular mood wheel.
///
/// Features a subtle top glow effect and a draggable mood selector.
class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MoodProvider>();
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Stack(
        children: [
          // Background glow image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/Group 119.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: AppSpacing.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.lg),

                  // Title
                  Text(l10n.mood, style: AppTextStyles.heading1),

                  const SizedBox(height: AppSpacing.lg),

                  // Subtitle with left padding
                  Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.sm),
                    child: Text(
                      l10n.startYourDay,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xs),

                  // Question
                  Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.sm),
                    child: Text(l10n.howFeeling, style: AppTextStyles.heading2),
                  ),

                  const Spacer(),

                  // Mood wheel
                  const Center(child: MoodWheel()),

                  const SizedBox(height: AppSpacing.xxl),

                  // Mood label
                  Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        provider.currentMood.name,
                        key: ValueKey(provider.currentMood.name),
                        style: AppTextStyles.heading1,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Continue button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.textPrimary,
                        foregroundColor: AppColors.scaffold,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text(l10n.continueButton),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
