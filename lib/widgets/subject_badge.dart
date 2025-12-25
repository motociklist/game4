import 'package:flutter/material.dart';
import '../models/question.dart';
import '../utils/subject_utils.dart';

/// Виджет для отображения бейджа предмета
class SubjectBadge extends StatelessWidget {
  final Subject subject;

  const SubjectBadge({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            SubjectUtils.getSubjectIcon(subject),
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            SubjectUtils.getSubjectName(subject),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

