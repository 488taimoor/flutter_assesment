import 'package:flutter/material.dart';
import 'package:mobile/app/app.dart';
import 'package:mobile/app/app_config.dart';
import 'package:mobile/core/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setup(
    appConfig: AppConfig.prod(),
  );
  runApp(const MealPlanetApp());
}
