import 'package:flutter/material.dart';

/// Компонент градиентного фона
class GradientBackground extends StatelessWidget {
  final List<Color> colors;
  final Widget child;

  const GradientBackground({
    super.key,
    required this.colors,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: child,
    );
  }
}

