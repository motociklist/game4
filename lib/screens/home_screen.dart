import 'package:flutter/material.dart';
import '../screens/game_screen.dart';
import '../components/gradient_background.dart';
import '../components/primary_button.dart';

/// Экран главного меню
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        colors: [
          Colors.blue.shade400,
          Colors.purple.shade600,
        ],
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.school,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Викторина по наукам',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Проверьте свои знания по математике, физике и химии!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 60),
                PrimaryButton(
                  text: 'Начать игру',
                  foregroundColor: Colors.purple.shade600,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                _buildSubjectsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectsList() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        children: [
          _SubjectItem(icon: Icons.calculate, name: 'Математика'),
          SizedBox(height: 10),
          _SubjectItem(icon: Icons.science, name: 'Физика'),
          SizedBox(height: 10),
          _SubjectItem(icon: Icons.eco, name: 'Химия'),
        ],
      ),
    );
  }
}

class _SubjectItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const _SubjectItem({
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
