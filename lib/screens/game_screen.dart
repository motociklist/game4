import 'package:flutter/material.dart';
import 'dart:async';
import '../models/question.dart';
import '../data/questions.dart';
import '../screens/result_screen.dart';
import '../utils/subject_utils.dart';
import '../constants/app_constants.dart';
import '../components/gradient_background.dart';
import '../components/question_card.dart';
import '../components/answer_button.dart';
import '../widgets/subject_badge.dart';
import '../widgets/timer_widget.dart';
import '../widgets/score_widget.dart';
import '../widgets/progress_bar.dart';

/// Экран игры
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswerIndex;
  bool isAnswered = false;
  Timer? _timer;
  int timeLeft = AppConstants.questionTimeLimit;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    final allQuestions = QuestionsData.getShuffledQuestions();
    questions = allQuestions.take(AppConstants.totalQuestions).toList();
    _startTimer();
  }

  void _startTimer() {
    timeLeft = AppConstants.questionTimeLimit;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (timeLeft > 0) {
            timeLeft--;
          } else {
            _handleTimeOut();
          }
        });
      }
    });
  }

  void _handleTimeOut() {
    _timer?.cancel();
    if (!isAnswered) {
      setState(() {
        isAnswered = true;
        selectedAnswerIndex = -1; // -1 означает тайм-аут
      });
      Future.delayed(const Duration(seconds: 2), () {
        _nextQuestion();
      });
    }
  }

  void _selectAnswer(int index) {
    if (isAnswered) return;

    setState(() {
      selectedAnswerIndex = index;
      isAnswered = true;
      _timer?.cancel();

      if (index == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        isAnswered = false;
      });
      _startTimer();
    } else {
      _finishGame();
    }
  }

  void _finishGame() {
    _timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          score: score,
          totalQuestions: AppConstants.totalQuestions,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final question = questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      body: GradientBackground(
        colors: SubjectUtils.getSubjectColors(question.subject),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(progress),
              const SizedBox(height: 30),
              SubjectBadge(subject: question.subject),
              const SizedBox(height: 30),
              Expanded(
                child: _buildQuestionContent(question),
              ),
              ScoreWidget(
                score: score,
                totalQuestions: AppConstants.totalQuestions,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double progress) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Вопрос ${currentQuestionIndex + 1}/${questions.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TimerWidget(timeLeft: timeLeft),
            ],
          ),
          const SizedBox(height: 10),
          ProgressBar(progress: progress),
        ],
      ),
    );
  }

  Widget _buildQuestionContent(Question question) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          QuestionCard(question: question.question),
          const SizedBox(height: 30),
          ...List.generate(question.options.length, (index) {
            return AnswerButton(
              answer: question.options[index],
              index: index,
              isSelected: selectedAnswerIndex == index,
              isCorrect: index == question.correctAnswerIndex,
              isAnswered: isAnswered,
              subject: question.subject,
              onTap: () => _selectAnswer(index),
            );
          }),
        ],
      ),
    );
  }
}
