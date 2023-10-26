import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/theme/theme_abstraction/app_theme.dart';

abstract class AppThemeManager {
  static ThemeData setTheme(AppTheme appTheme) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: appTheme.textTheme.textThemeData,
        canvasColor: appTheme.colors.canvasColor,
        primaryColor: appTheme.colors.primarySwatch,
        appBarTheme: AppBarTheme(
          backgroundColor: appTheme.colors.appBarColor,
          elevation: 1,
          titleTextStyle: appTheme.textTheme.textThemeData.titleLarge,
          iconTheme: IconThemeData(
            color: appTheme.colors.appBarIconColor,
          ),
        ),
        //TODO: if we use snack bar , we will uncomment this code
        // snackBarTheme: SnackBarThemeData(
        //   backgroundColor: appTheme.colors.,
        //   behavior: SnackBarBehavior.floating,
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: appTheme.colors.buttonTextColor,
          ),
        ),
        navigationBarTheme: const NavigationBarThemeData().copyWith(
          backgroundColor: Colors.white,
          elevation: 10.0,
          shadowColor: AppColors.textColorBlack,
          //TODO: setup this according to use case
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) =>
                  appTheme.textTheme.textThemeData.titleSmall!.copyWith(
                      color: states.contains(MaterialState.selected)
                          ? AppColors.secondaryColor
                          : AppColors.textLightColor)),
        ),
        colorScheme: appTheme.colors.colorScheme,
      );
}
