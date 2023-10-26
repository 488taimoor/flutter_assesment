import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';

class AppBarTextButton extends StatelessWidget {
  const AppBarTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.tapTargetSize,
  });

  final VoidCallback onPressed;

  final String text;
  final Color? textColor;
  final MaterialTapTargetSize? tapTargetSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        tapTargetSize: tapTargetSize,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: context.textTheme.labelMedium,
      ),
    );
  }
}
