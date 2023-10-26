import 'package:flutter/material.dart';

enum ToastGravity { bottom, center, top }

class Toast {
  static void show({
    required BuildContext context,
    required Widget widget,
    int? duration,
    ToastGravity gravity = ToastGravity.bottom,
  }) {
    _ToastView.dismiss();
    _ToastView.createViewToast(context, duration, gravity, widget);
  }

  static void dismiss() {
    _ToastView.dismiss();
  }
}

class _ToastView {
  static final _ToastView _singleton = _ToastView._internal();

  factory _ToastView() {
    return _singleton;
  }

  _ToastView._internal();

  static OverlayState? overlayState;
  static late OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createViewToast(
    BuildContext context,
    int? duration,
    ToastGravity gravity,
    Widget widget,
  ) async {
    overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => _ToastWidget(
              widget: widget,
              gravity: gravity,
            ));
    _isVisible = true;
    overlayState?.insert(_overlayEntry);
    await Future.delayed(Duration(seconds: duration ?? 3));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry.remove();
  }
}

class _ToastWidget extends StatelessWidget {
  const _ToastWidget({
    Key? key,
    required this.widget,
    required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final ToastGravity gravity;

  @override
  Widget build(BuildContext context) {
    AlignmentDirectional alignment;
    if (gravity == ToastGravity.top) {
      alignment = AlignmentDirectional.topCenter;
    } else if (gravity == ToastGravity.bottom) {
      alignment = AlignmentDirectional.bottomCenter;
    } else {
      alignment = AlignmentDirectional.center;
    }
    return SafeArea(
        child: Align(
      alignment: alignment,
      child: widget,
    ));
  }
}
