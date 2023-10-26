import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/core/utils/page_transitions.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/home_screen.dart';
import 'package:mobile/features/splash/splash_screen.dart';

///Private root Navigator Keys
final _rootNavigatorKey = GlobalKey<NavigatorState>();

///---IMPORTANT---
///For every Bottom Navigation Tab, you need to define `GlobalKey<NavigatorState>`
final _homeKey = GlobalKey<NavigatorState>();
final _myPlans = GlobalKey<NavigatorState>();
final _wellness = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();

  static final Map<String?, GoRouterState> _savedStateMap = {};

  static final router = GoRouter(
    initialLocation: PagePath.splash,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: PagePath.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: PagePath.noInternetConnection,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
          state.pageKey,
          const Placeholder(), //const NoInternetConnectionScreen(),
        ),
      ),
      GoRoute(
        path: PagePath.home,
        pageBuilder: (context, state) {
          _savedStateMap[state.path] =
              _savedStateMap[state.path] ?? state;
          return const NoTransitionPage(
            child: HomeScreen(),
          );
        },

      ),


    ],
  );
}
