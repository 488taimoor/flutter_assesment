# Fitness Tracker App

A fitness tracking application built with Flutter, featuring workout tracking, calorie monitoring, weight insights, hydration logging, training calendar with drag & drop, and a mood selector wheel.

**Developer:** Taimoor Khan

---

## App APK

[Download APK](https://github.com/488taimoor/flutter_assesment/releases/download/v1.0/app-release.apk)

---

## App Screenshots

| Nutrition | Calendar | Plan | Mood |
|-----------|----------|------|------|
| ![Nutrition](screenshots/nutrition.png) | ![Calendar](screenshots/calendar.png) | ![Plan](screenshots/plan.png) | ![Mood](screenshots/mood.png) |

## App Video

<!-- Add video link here -->

---

## Dependencies Used & Why

| Package | Why |
|---------|-----|
| `provider` | Used for state management across all screens (home, plan, mood) |
| `google_fonts` | Used for loading the Mulish font family to match the Figma design |
| `flutter_localizations` + `intl` | Used for multi-language support (English & Arabic) |
| `cupertino_icons` | Used for iOS-style icons |

---

## Project Structure

```
lib/
├── main.dart                           # App entry point
│
├── app/                                # App-level configuration
│   ├── app.dart                        # Root MaterialApp with MultiProvider, theme & localization
│   └── theme/
│       ├── app_colors.dart             # Centralized color palette
│       ├── app_text_styles.dart        # Typography styles (Mulish font)
│       └── app_theme.dart              # Dark ThemeData configuration
│
├── core/                               # Shared utilities
│   ├── constants/
│   │   └── app_spacing.dart            # Spacing, padding & radius constants
│   └── extensions/
│       └── context_extensions.dart     # BuildContext helpers (l10n, theme, size)
│
├── common/                             # Reusable UI components
│   └── widgets/
│       ├── app_card.dart               # Dark card container
│       └── section_header.dart         # Section title with optional trailing widget
│
├── features/
│   ├── home/                           # Nutrition/Home tab
│   │   ├── models/
│   │   │   ├── workout_model.dart      # Workout data model
│   │   │   └── day_info.dart           # Calendar day with activity colors
│   │   ├── provider/
│   │   │   └── home_provider.dart      # State: calendar, workouts, insights, navigation
│   │   ├── screens/
│   │   │   └── home_screen.dart        # Shell screen with IndexedStack for tab switching
│   │   └── widgets/
│   │       ├── week_selector.dart      # "Week X/Y" header with bell icon
│   │       ├── weekly_calendar.dart    # Day-of-week calendar strip with colored dots
│   │       ├── month_calendar_sheet.dart # Full month calendar bottom sheet
│   │       ├── workout_card.dart       # Workout item with teal accent border
│   │       ├── calories_card.dart      # Calorie intake with gradient progress bar
│   │       ├── weight_card.dart        # Weight display with change indicator
│   │       ├── hydration_card.dart     # Hydration tracker with water level chart
│   │       └── bottom_nav_bar.dart     # 4-tab bottom navigation with custom icons
│   │
│   ├── plan/                           # Training Calendar tab
│   │   ├── models/
│   │   │   ├── training_workout.dart   # Workout with category tag & color
│   │   │   ├── training_day.dart       # Day with optional workout
│   │   │   └── training_week.dart      # Week with days & computed total minutes
│   │   ├── provider/
│   │   │   └── plan_provider.dart      # State: weeks data, drag & drop logic
│   │   ├── screens/
│   │   │   └── plan_screen.dart        # Training calendar screen
│   │   └── widgets/
│   │       ├── plan_header.dart        # "Training Calendar" + Save button
│   │       ├── week_header.dart        # Week section header with date range
│   │       ├── day_row.dart            # Day row with DragTarget
│   │       └── workout_drag_card.dart  # LongPressDraggable workout card
│   │
│   └── mood/                           # Mood selector tab
│       ├── models/
│       │   └── mood_data.dart          # Mood with name & emoji asset path
│       ├── provider/
│       │   └── mood_provider.dart      # State: thumb angle, current mood
│       ├── screens/
│       │   └── mood_screen.dart        # Mood screen with wheel & continue button
│       └── widgets/
│           ├── mood_wheel.dart         # CustomPainter gradient ring with drag
│           └── mood_emoji.dart         # Animated emoji face display
│
└── l10n/                               # Localization
    ├── app_en.arb                      # English strings
    └── app_ar.arb                      # Arabic strings
```

### Folder Purposes

| Folder | Purpose |
|--------|---------|
| `app/` | Root widget, theming (Mulish font, dark mode), and configuration |
| `core/` | Shared constants and BuildContext extensions |
| `common/widgets/` | Reusable UI components shared across features |
| `features/home/` | Nutrition tab: calendar, workouts, calories, weight, hydration |
| `features/plan/` | Training Calendar tab: weekly schedule with drag & drop |
| `features/mood/` | Mood tab: circular mood wheel with draggable selector |
| `l10n/` | ARB localization files (English + Arabic) |
