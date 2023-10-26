import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiwi/kiwi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/app/app_config.dart';
import 'package:mobile/app/cubit/locale_cubit.dart';
import 'package:mobile/app/cubit/theme_cubit.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/data/sources/local/preferences/app_preferences.dart';
import 'package:mobile/firebase_options.dart';

abstract class AppModule {
  static late KiwiContainer _container;

  static Future<void> setup(KiwiContainer container) async {
    _container = container;
    await _setupFirebase();
    await _setupStorage();
    _setupAppPreferences();
    _setupLoader();
    _registerThemeCubit();
    _registerLocaleCubit();
  }

  static Future<void> _setupFirebase() async {
    if (AppConfig.environment != Environment.dev) {
      //TODO: Need to generate updated firebase option file
      if(kIsWeb){
        await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      }else{
        await Firebase.initializeApp();
      }
    }
  }

  static Future<bool> _setupStorage() async {
    return await GetStorage.init();
  }

  static void _setupAppPreferences() {
    _container.registerSingleton((_) => AppPreferences());
  }

  static void _setupLoader() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.black38
      ..indicatorType = EasyLoadingIndicatorType.rotatingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..boxShadow = <BoxShadow>[]
      ..indicatorColor = AppColors.primaryColor
      ..textColor = AppColors.blackColor
      ..userInteractions = false;
  }

  static void _registerThemeCubit() {
    _container.registerSingleton((_) => ThemeCubit());
  }

  static void _registerLocaleCubit() {
    _container.registerSingleton((_) => LocaleCubit());
  }


}
