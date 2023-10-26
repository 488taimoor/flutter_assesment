import 'dart:async';

import 'package:flutter/widgets.dart';

///***
/// Took reference from after_layout package by flutter community
///
///
mixin WidgetBuiltMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) onBuilt(context);
      },
    );
  }

  FutureOr<void> onBuilt(BuildContext context);
}
