import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset('assets/background.png', fit: BoxFit.cover),
        ),
        // Page content on top
        Positioned.fill(child: child),
      ],
    );
  }
}
