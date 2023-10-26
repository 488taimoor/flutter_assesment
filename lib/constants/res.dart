import 'package:flutter/material.dart';
import 'package:mobile/constants/sizes.dart';

AppSizes sizes =AppSizes();

void initializeAppResources({required BuildContext context}) {
  sizes = AppSizes();
  sizes.initializeSize(context);
}