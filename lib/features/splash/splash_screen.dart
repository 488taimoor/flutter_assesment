import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/di/injector.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/core/utils/permission.dart';
import 'package:mobile/data/sources/local/preferences/app_preferences.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Colors for animationMicrosoftTeams-image
  final List _colors = [
    AppColors.accentColor,
    AppColors.primaryColor,
  ];

  int _currentColorIndex = 0;
  late Timer timer;

  // Anime duration in milli sec
  int animationDurationInMilliSec = 500;

// Start the timer
  void _startTimer() {
    // Set up a periodic timer that triggers the color change every 3 seconds
    timer = Timer.periodic(Duration(milliseconds: animationDurationInMilliSec),
        (timer) {
      setState(() {
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initSplashScreen();
    _startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

// Function for init splash screen
  _initSplashScreen() async {
    Future.delayed(const Duration(seconds: 3), () async {

      context.go(PagePath.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double parentHeight = constraints.maxHeight;
        double parentWidth = constraints.maxWidth;
        // Animated container
        return AnimatedContainer(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: parentWidth,
          duration: Duration(milliseconds: animationDurationInMilliSec),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _colors[_currentColorIndex], // Use the current color
                _colors[(_currentColorIndex + 1) %
                    _colors.length], // Use the next color in the list
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: parentHeight * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      width: parentWidth * 0.8,
                      child: Text(
                        context.appStrings.appName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: parentHeight * 0.065,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: parentHeight * 0.015),
                        child: Text(
                          context.appStrings.landingPageTopText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: parentHeight * 0.08),
                width: parentWidth,
                child: Text(
                  context.appStrings.landingPageBottomText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: parentHeight * 0.075,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
