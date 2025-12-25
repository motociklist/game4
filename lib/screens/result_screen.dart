import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../constants/app_constants.dart';
import '../components/gradient_background.dart';
import '../components/primary_button.dart';

/// Экран результатов
class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  bool get isWin {
    return score >= (totalQuestions * AppConstants.winThreshold).round();
  }

  String get resultText {
    if (score == totalQuestions) {
      return 'Идеально!';
    } else if (isWin) {
      return 'Поздравляем!';
    } else {
      return 'Попробуйте еще раз!';
    }
  }

  String get resultDescription {
    if (score == totalQuestions) {
      return 'Вы ответили правильно на все вопросы! Вы настоящий гений!';
    } else if (isWin) {
      return 'Отличный результат! Вы хорошо знаете предметы!';
    } else {
      return 'Не расстраивайтесь! Продолжайте учиться и попробуйте снова!';
    }
  }

  Color get resultColor {
    if (isWin) {
      return AppConstants.successGreen;
    } else {
      return AppConstants.warningOrange;
    }
  }

  List<Color> get gradientColors {
    if (isWin) {
      return [Colors.green.shade400, Colors.green.shade700];
    } else {
      return [Colors.orange.shade400, Colors.orange.shade700];
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (score / totalQuestions * 100).round();

    return Scaffold(
      body: GradientBackground(
        colors: gradientColors,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildResultIcon(),
                  const SizedBox(height: 40),
                  _buildResultText(),
                  const SizedBox(height: 50),
                  _buildScoreCard(percentage),
                  const SizedBox(height: 50),
                  _buildActionButtons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultIcon() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(
        isWin ? Icons.celebration : Icons.school,
        size: 80,
        color: resultColor,
      ),
    );
  }

  Widget _buildResultText() {
    return Column(
      children: [
        Text(
          resultText,
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          resultDescription,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildScoreCard(int percentage) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Ваш результат',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            '$score / $totalQuestions',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: resultColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$percentage%',
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: score / totalQuestions,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(resultColor),
            minHeight: 10,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
          text: 'Главная',
          icon: Icons.home,
          backgroundColor: Colors.white,
          foregroundColor: resultColor,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
        const SizedBox(width: 20),
        PrimaryButton(
          text: 'Играть снова',
          icon: Icons.refresh,
          backgroundColor: Colors.white,
          foregroundColor: resultColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
