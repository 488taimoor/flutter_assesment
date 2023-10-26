import 'package:flutter/material.dart';

class Parent extends StatelessWidget {
  final Widget child;
  const Parent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 1, 20, 20),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
