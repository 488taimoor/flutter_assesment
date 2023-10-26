import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  final double borderRadius;
  final Widget child;
  final VoidCallback onPressed;

  const AppCard({
    super.key,
    this.borderRadius = 4,
    this.child = const Text(""),
    required this.onPressed,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: widget.child,
      ),
    );
  }
}
