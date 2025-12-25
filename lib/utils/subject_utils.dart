import 'package:flutter/material.dart';
import '../models/question.dart';

/// Утилиты для работы с предметами (Subject)
class SubjectUtils {
  /// Получить цвета градиента для предмета
  static List<Color> getSubjectColors(Subject subject) {
    switch (subject) {
      case Subject.mathematics:
        return [Colors.blue.shade400, Colors.blue.shade700];
      case Subject.physics:
        return [Colors.orange.shade400, Colors.orange.shade700];
      case Subject.chemistry:
        return [Colors.green.shade400, Colors.green.shade700];
    }
  }

  /// Получить основной цвет предмета
  static Color getSubjectColor(Subject subject) {
    switch (subject) {
      case Subject.mathematics:
        return Colors.blue;
      case Subject.physics:
        return Colors.orange;
      case Subject.chemistry:
        return Colors.green;
    }
  }

  /// Получить название предмета
  static String getSubjectName(Subject subject) {
    switch (subject) {
      case Subject.mathematics:
        return 'Математика';
      case Subject.physics:
        return 'Физика';
      case Subject.chemistry:
        return 'Химия';
    }
  }

  /// Получить иконку предмета
  static IconData getSubjectIcon(Subject subject) {
    switch (subject) {
      case Subject.mathematics:
        return Icons.calculate;
      case Subject.physics:
        return Icons.science;
      case Subject.chemistry:
        return Icons.eco;
    }
  }
}

