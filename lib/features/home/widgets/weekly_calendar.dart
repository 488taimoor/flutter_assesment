import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../provider/home_provider.dart';
import 'month_calendar_sheet.dart';

/// Displays the selected date and the M-SU weekly calendar strip.
///
/// The date display and page indicator are tappable to open
/// the month calendar bottom sheet.
class WeeklyCalendar extends StatelessWidget {
  const WeeklyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.lg),

        // "Today, 22 Dec 2024" — dynamic from selectedDate
        Text(
          '${l10n.today}, ${DateFormat('dd MMM yyyy').format(provider.selectedDate)}',
          style: AppTextStyles.bodyLarge,
        ),

        const SizedBox(height: AppSpacing.lg),

        // Day strip
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            provider.weekDays.length,
            (index) => _DayItem(
              label: provider.weekDays[index].label,
              date: provider.weekDays[index].date,
              isSelected: index == provider.selectedDayIndex,
              activityColors: provider.weekDays[index].activityColors,
              onTap: () => provider.selectDay(index),
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // Tappable page indicator — opens month calendar
        Center(
          child: GestureDetector(
            onTap: () => _showMonthCalendar(context),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.cardLight,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showMonthCalendar(BuildContext context) {
    final provider = context.read<HomeProvider>();
    provider.resetCalendarToSelectedDate();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => ChangeNotifierProvider.value(
        value: provider,
        child: const MonthCalendarSheet(),
      ),
    );
  }
}

/// A single day column in the calendar strip.
class _DayItem extends StatelessWidget {
  const _DayItem({
    required this.label,
    required this.date,
    required this.isSelected,
    required this.activityColors,
    required this.onTap,
  });

  final String label;
  final int date;
  final bool isSelected;
  final List<Color> activityColors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Day label (M, TU, W...)
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: isSelected
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Date circle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.transparent : AppColors.unselectedDay,
              border: isSelected
                  ? Border.all(color: AppColors.green, width: 2)
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(
              '$date',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xs),

          // Activity color dots
          SizedBox(
            height: 6,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: activityColors
                  .map((color) => Container(
                        width: 6,
                        height: 6,
                        margin: EdgeInsets.only(
                          right: color != activityColors.last ? 3 : 0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
