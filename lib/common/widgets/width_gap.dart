import 'package:flutter/material.dart';

class WidthGap extends StatelessWidget {
  final double width;
  const WidthGap({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
