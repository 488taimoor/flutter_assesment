import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../models/day_info.dart';
import '../models/workout_model.dart';

/// Day labels for Monday–Sunday.
const _dayLabels = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];

/// Manages all state for the Home screen.
///
/// The entire calendar system is driven by [_selectedDate].
/// Changing the selected date recalculates the weekly strip,
/// week number, and total weeks in the month.
class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    _rebuildWeek();
  }

  // -- Selected Date (single source of truth) --

  DateTime _selectedDate = DateTime(2024, 12, 22);
  DateTime get selectedDate => _selectedDate;

  // -- Week Strip --

  int _selectedDayIndex = 0;
  int get selectedDayIndex => _selectedDayIndex;

  List<DayInfo> _weekDays = [];
  List<DayInfo> get weekDays => _weekDays;

  /// Selects a day from the weekly strip by index.
  void selectDay(int index) {
    final monday = _getMondayOfWeek(_selectedDate);
    _selectedDate = DateTime(monday.year, monday.month, monday.day + index);
    _selectedDayIndex = index;
    notifyListeners();
  }

  /// Selects a date from the month calendar bottom sheet.
  /// Rebuilds the weekly strip to show the week containing that date.
  void selectDateFromCalendar(int day) {
    _selectedDate = DateTime(_calendarYear, _calendarMonth, day);
    _rebuildWeek();
    notifyListeners();
  }

  /// Rebuilds the weekly strip based on [_selectedDate].
  void _rebuildWeek() {
    final monday = _getMondayOfWeek(_selectedDate);

    _weekDays = List.generate(7, (i) {
      final date = DateTime(monday.year, monday.month, monday.day + i);
      return DayInfo(
        label: _dayLabels[i],
        date: date.day,
        activityColors: _getActivityColors(date),
      );
    });

    _selectedDayIndex = _selectedDate.weekday - 1; // Monday=0 ... Sunday=6
  }

  /// Returns the Monday of the week containing [date].
  DateTime _getMondayOfWeek(DateTime date) {
    return DateTime(date.year, date.month, date.day - (date.weekday - 1));
  }

  // -- Week Number / Total Weeks --

  /// Which week of the month the selected date falls in (1-based).
  int get currentWeek {
    final firstOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final firstMonday = firstOfMonth.subtract(
      Duration(days: (firstOfMonth.weekday - 1)),
    );
    return ((_selectedDate.difference(firstMonday).inDays) ~/ 7) + 1;
  }

  /// Total number of weeks that span the selected month.
  int get totalWeeks {
    final firstOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final lastOfMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0);
    final firstMonday = firstOfMonth.subtract(
      Duration(days: (firstOfMonth.weekday - 1)),
    );
    return ((lastOfMonth.difference(firstMonday).inDays) ~/ 7) + 1;
  }

  // -- Activity Colors (mock data) --

  /// Returns activity dot colors for a given date.
  /// In production this would come from a repository/API.
  List<Color> _getActivityColors(DateTime date) {
    // Demo: assign colors based on weekday
    switch (date.weekday) {
      case DateTime.tuesday:
        return const [AppColors.activityGreen];
      case DateTime.wednesday:
        return const [AppColors.activityGray];
      case DateTime.thursday:
        return const [AppColors.activityBlue];
      case DateTime.saturday:
        return const [AppColors.activityPink];
      default:
        return const [];
    }
  }

  // -- Month Calendar --

  late int _calendarMonth = _selectedDate.month;
  int get calendarMonth => _calendarMonth;

  late int _calendarYear = _selectedDate.year;
  int get calendarYear => _calendarYear;

  /// The day number selected in the calendar grid.
  int get selectedCalendarDay {
    // Only highlight if viewing the same month as the selected date
    if (_calendarMonth == _selectedDate.month &&
        _calendarYear == _selectedDate.year) {
      return _selectedDate.day;
    }
    return -1; // No highlight
  }

  void navigateMonth(int delta) {
    _calendarMonth += delta;
    if (_calendarMonth > 12) {
      _calendarMonth = 1;
      _calendarYear++;
    } else if (_calendarMonth < 1) {
      _calendarMonth = 12;
      _calendarYear--;
    }
    notifyListeners();
  }

  /// Resets the calendar view to the currently selected date's month.
  void resetCalendarToSelectedDate() {
    _calendarMonth = _selectedDate.month;
    _calendarYear = _selectedDate.year;
  }

  /// Number of days in the currently viewed calendar month.
  int get daysInMonth =>
      DateTime(_calendarYear, _calendarMonth + 1, 0).day;

  /// Weekday of the 1st of the currently viewed calendar month (1=Monday).
  int get firstDayWeekday =>
      DateTime(_calendarYear, _calendarMonth, 1).weekday;

  // -- Workouts --

  final List<WorkoutModel> _workouts = [
    WorkoutModel(
      name: 'Upper Body',
      date: DateTime(2024, 12, 22),
      durationMin: 25,
      durationMax: 30,
    ),
  ];
  List<WorkoutModel> get workouts => _workouts;

  // -- Calories --

  final int _caloriesConsumed = 550;
  int get caloriesConsumed => _caloriesConsumed;

  static const int caloriesGoal = 2500;
  int get caloriesRemaining => caloriesGoal - _caloriesConsumed;

  double get caloriesProgress => _caloriesConsumed / caloriesGoal;

  // -- Weight --

  final double _currentWeight = 75.0;
  double get currentWeight => _currentWeight;

  final double _weightChange = 1.6;
  double get weightChange => _weightChange;

  bool get weightIncreased => _weightChange > 0;

  // -- Hydration --

  int _waterIntakeMl = 0;
  int get waterIntakeMl => _waterIntakeMl;

  static const int waterGoalMl = 2000;

  int get hydrationPercent =>
      ((waterIntakeMl / waterGoalMl) * 100).round();

  double get hydrationProgress => _waterIntakeMl / waterGoalMl;

  bool _showWaterSnackbar = false;
  bool get showWaterSnackbar => _showWaterSnackbar;

  void addWater({int ml = 500}) {
    _waterIntakeMl = (_waterIntakeMl + ml).clamp(0, waterGoalMl);
    _showWaterSnackbar = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () {
      _showWaterSnackbar = false;
      notifyListeners();
    });
  }

  // -- Bottom Navigation --

  int _currentNavIndex = 0; // Nutrition tab selected by default
  int get currentNavIndex => _currentNavIndex;

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }
}
