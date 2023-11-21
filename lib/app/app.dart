import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile/app/app_router.dart';
import 'package:mobile/app/cubit/locale_cubit.dart';
import 'package:mobile/app/cubit/theme_cubit.dart';
import 'package:mobile/core/di/injector.dart';
import 'package:mobile/core/resources/resources.dart';
import 'package:mobile/core/resources/strings.dart';
import 'package:mobile/constants/res.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/home_screen_cubit.dart';
import 'package:mobile/features/main/presentation/screens/main_screen.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class MealPlanetApp extends StatefulWidget {
  const MealPlanetApp({super.key});

  static BuildContext? get appContext =>
      AppRouter.router.routerDelegate.navigatorKey.currentContext;

  @override
  State<MealPlanetApp> createState() => _MealPlanetAppState();
}

class _MealPlanetAppState extends State<MealPlanetApp> {
  @override
  Widget build(BuildContext context) {
    initializeAppResources(context: context);
    setSystemPreferences();
    return MultiBlocProvider(
      providers: appProviders,
      child: Builder(
        builder: (context) {
          final currentTheme = context.watch<ThemeCubit>().state;
          final currentLocale = context.watch<LocaleCubit>().state;
          return MaterialApp.router(
            title: Strings.appName,
            theme: currentTheme,
            debugShowCheckedModeBanner: false,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routerDelegate: AppRouter.router.routerDelegate,
            locale: currentLocale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }

  ///
  /// Register all app cubits instances here
  get appProviders => [
        BlocProvider<LocaleCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<ThemeCubit>(lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<HomeScreenCubit>(
            lazy: true, create: (_) => Injector.resolve()),
    BlocProvider<NavBarCubit>(
        lazy: true, create: (_) => Injector.resolve()),
      ];

  Future<void> setSystemPreferences() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.textColorWhite,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.primaryColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
  }
}
