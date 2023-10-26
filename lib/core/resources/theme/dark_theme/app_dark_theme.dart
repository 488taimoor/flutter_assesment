import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/theme/dark_theme/dark_colors_theme.dart';
import 'package:mobile/core/resources/theme/dark_theme/dark_text_theme.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_colors.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_text.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_theme.dart';

class AppDarkTheme extends AppTheme {
  @override
  late final AppTextTheme textTheme;

  @override
  AppColorsTheme get colors => DarkColorsTheme();

  AppDarkTheme() {
    textTheme = DarkTextTheme(primaryTextColor: AppColors.blackColor);
  }
}
