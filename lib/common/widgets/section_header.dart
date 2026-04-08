import 'package:flutter/material.dart';

import '../../app/theme/app_text_styles.dart';
import '../../core/constants/app_spacing.dart';

/// Reusable section title widget (e.g., "Workouts", "My Insights").
///
/// Optionally displays a trailing widget (e.g., weather info).
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
  });

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.xxl,
        bottom: AppSpacing.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.heading2.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 28.8 / 24,
              color: const Color(0xFFEBEBEB),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
