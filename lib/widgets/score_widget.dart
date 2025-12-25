import 'package:flutter/material.dart';

/// Виджет для отображения счета
class ScoreWidget extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ScoreWidget({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star, color: Colors.white, size: 28),
          const SizedBox(width: 10),
          Text(
            'Счет: $score/$totalQuestions',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

