import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/resources/theme/light_theme/app_light_theme.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_theme_manager.dart';



class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppThemeManager.setTheme(AppLightTheme()));

  void setTheme(ThemeData themeData) => emit(themeData);
}
