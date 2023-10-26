import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/theme/light_theme/light_colors_theme.dart';
import 'package:mobile/core/resources/theme/light_theme/light_text_theme.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_colors.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_text.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_theme.dart';

class AppLightTheme extends AppTheme {
  @override
  late final AppTextTheme textTheme;
  @override
  AppColorsTheme get colors => LightColorsTheme();


  AppLightTheme(){
    textTheme = LightTextTheme(
      primaryTextColor: AppColors.textColorBlack
    );
  }
}
