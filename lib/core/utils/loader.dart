import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/resources/colors.dart';
import 'back_button_interceptor.dart';

class Loader {
  static const _backButtonListenerName = 'my_back_button';

  static void show(
      {String title = '',
      bool userInteraction = false,
      bool dismissible = false}) async {
    EasyLoading.show(
        indicator: Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        ),
        dismissOnTap: dismissible);

    ///***
    ///
    /// To disable hard back button on loading
    BackButtonInterceptor.add((bool stopDefaultButtonEvent, RouteInfo info) {
      return true;
    }, name: _backButtonListenerName);
  }

  static void hide() async {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();

      ///***
      ///
      /// To enable hard back button after loading
      BackButtonInterceptor.removeByName(_backButtonListenerName);
    }
  }
}
