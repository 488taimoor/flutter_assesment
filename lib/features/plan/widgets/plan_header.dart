import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';

/// "Training Calendar" title with "Save" button.
class PlanHeader extends StatelessWidget {
  const PlanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Training Calendar',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 28.8 / 24,
          ),
        ),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Training plan saved'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Text(
            'Save',
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 22.4 / 18,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
