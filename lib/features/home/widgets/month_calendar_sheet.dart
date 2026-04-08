import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../provider/home_provider.dart';

/// Full-month calendar displayed as a modal bottom sheet.
///
/// Shows month/year header with navigation arrows ,
/// day-of-week header, and a 7-column date grid.
class MonthCalendarSheet extends StatelessWidget {
  const MonthCalendarSheet({super.key});

  static const _dayLabels = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final monthDate = DateTime(provider.calendarYear, provider.calendarMonth);
    final monthName = DateFormat('MMM yyyy').format(monthDate);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.xxxl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.cardLight,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Month/year header with arrows
          _MonthHeader(
            monthName: monthName,
            onPrevious: () => provider.navigateMonth(-1),
            onNext: () => provider.navigateMonth(1),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Day-of-week labels
          const _DayOfWeekRow(labels: _dayLabels),

          const SizedBox(height: AppSpacing.md),

          // Date grid
          _DateGrid(
            daysInMonth: provider.daysInMonth,
            firstDayWeekday: provider.firstDayWeekday,
            selectedDay: provider.selectedCalendarDay,
            onDayTap: (day) {
              provider.selectDateFromCalendar(day);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

/// Month name with left/right navigation arrows.
class _MonthHeader extends StatelessWidget {
  const _MonthHeader({
    required this.monthName,
    required this.onPrevious,
    required this.onNext,
  });

  final String monthName;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onPrevious,
          child: const Icon(
            Icons.chevron_left,
            color: AppColors.textPrimary,
            size: 24,
          ),
        ),
        Text(monthName, style: AppTextStyles.heading3),
        GestureDetector(
          onTap: onNext,
          child: const Icon(
            Icons.chevron_right,
            color: AppColors.textPrimary,
            size: 24,
          ),
        ),
      ],
    );
  }
}

/// Row of day-of-week labels (MON, TUE, ...).
class _DayOfWeekRow extends StatelessWidget {
  const _DayOfWeekRow({required this.labels});

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: labels
          .map((label) => SizedBox(
                width: 40,
                child: Text(
                  label,
                  style: AppTextStyles.bodySmall.copyWith(fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ))
          .toList(),
    );
  }
}

/// 7-column grid of date numbers for the month.
class _DateGrid extends StatelessWidget {
  const _DateGrid({
    required this.daysInMonth,
    required this.firstDayWeekday,
    required this.selectedDay,
    required this.onDayTap,
  });

  final int daysInMonth;
  final int firstDayWeekday;
  final int selectedDay;
  final ValueChanged<int> onDayTap;

  @override
  Widget build(BuildContext context) {
    // Build rows of 7 cells
    final rows = <Widget>[];
    // Calculate number of rows needed
    final totalCells = (firstDayWeekday - 1) + daysInMonth;
    final rowCount = (totalCells / 7).ceil();

    for (var row = 0; row < rowCount; row++) {
      final cells = <Widget>[];

      for (var col = 0; col < 7; col++) {
        final cellIndex = row * 7 + col;
        final dayNumber = cellIndex - (firstDayWeekday - 1) + 1;

        if (dayNumber < 1 || dayNumber > daysInMonth) {
          // Empty cell
          cells.add(const SizedBox(width: 40, height: 40));
        } else {
          final isSelected = dayNumber == selectedDay;
          cells.add(
            GestureDetector(
              onTap: () => onDayTap(dayNumber),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: AppColors.green, width: 2)
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$dayNumber',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }
      }

      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: cells,
          ),
        ),
      );
    }

    return Column(children: rows);
  }
}
