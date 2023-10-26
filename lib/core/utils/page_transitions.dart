import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTransitions {
  static const _transitionDuration = Duration(milliseconds: 400);

  static CustomTransitionPage buildPageWithSlideTransition(
      LocalKey pageKey, Widget page, {Duration? duration}) {
    return CustomTransitionPage(
      key: pageKey,
      child: page,
      transitionDuration: duration ?? _transitionDuration,
      transitionsBuilder: (_, animation, __, child) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.ease,
          ),
        ),
        child: child,
      ),
    );
  }

  static CustomTransitionPage buildPageWithSlideInFromBottomTransition(
      LocalKey pageKey, Widget page, {Duration? duration}) {
    return CustomTransitionPage(
      key: pageKey,
      child: page,
      transitionDuration: duration ?? _transitionDuration,
      transitionsBuilder: (_, animation, __, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage buildPageWithFadeTransition(
      LocalKey pageKey, Widget page, {Duration? duration}) {
    return CustomTransitionPage(
      key: pageKey,
      child: page,
      transitionDuration: duration ?? const Duration(milliseconds: 1600),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeIn,
          ),
          child: child,
        );
      },
    );
  }
}
