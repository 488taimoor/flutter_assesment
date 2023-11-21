import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/core/utils/page_transitions.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/home_screen.dart';
import 'package:mobile/features/main/presentation/screens/main_screen.dart';
import 'package:mobile/features/main/presentation/screens/mediaLibrary/media_library_screen.dart';
import 'package:mobile/features/main/presentation/screens/more/more_screen.dart';
import 'package:mobile/features/main/presentation/screens/watch/watch_screen.dart';
import 'package:mobile/features/splash/splash_screen.dart';

///Private root Navigator Keys
final _rootNavigatorKey = GlobalKey<NavigatorState>();

///---IMPORTANT---
///For every Bottom Navigation Tab, you need to define `GlobalKey<NavigatorState>`
final _dashboardKey = GlobalKey<NavigatorState>();
final _watchkey = GlobalKey<NavigatorState>();
final _mediaLibrarykey = GlobalKey<NavigatorState>();
final _morekey = GlobalKey<NavigatorState>();

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

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _dashboardKey,
            routes: [
              GoRoute(
                path: PagePath.dashboard,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: HomeScreen(),
                  );
                },
                routes: [

                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _watchkey,
            routes: [
              GoRoute(
                  path: PagePath.watch,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: WatchScreen(),
                  )),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _mediaLibrarykey,
            routes: [
              GoRoute(
                  path: PagePath.library,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: MediaLibraryScreen(),
                  )),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _morekey,
            routes: [
              GoRoute(
                  path: PagePath.more,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: MoreScreen(),
                  )),
            ],
          )
        ],
      ),



    ],
  );
}
