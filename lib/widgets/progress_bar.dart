import 'package:flutter/material.dart';

/// Виджет прогресс-бара
class ProgressBar extends StatelessWidget {
  final double progress;
  final String? label;

  const ProgressBar({
    super.key,
    required this.progress,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              label!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.white.withOpacity(0.3),
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          minHeight: 8,
        ),
      ],
    );
  }
}

