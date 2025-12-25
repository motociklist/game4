import 'package:flutter/material.dart';

/// Константы приложения
class AppConstants {
  // Игровые настройки
  static const int totalQuestions = 10;
  static const int questionTimeLimit = 30; // секунд
  static const double winThreshold = 0.6; // 60% для победы

  // Цвета
  static const Color primaryBlue = Color(0xFF4A90E2);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFE53935);
  static const Color warningOrange = Color(0xFFFF9800);

  // Размеры
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 15.0;
  static const double largeBorderRadius = 25.0;
}

