import 'package:flutter/material.dart';
import '../models/question.dart';
import '../utils/subject_utils.dart';

/// Компонент кнопки ответа
class AnswerButton extends StatelessWidget {
  final String answer;
  final int index;
  final bool isSelected;
  final bool isCorrect;
  final bool isAnswered;
  final Subject subject;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.answer,
    required this.index,
    required this.isSelected,
    required this.isCorrect,
    required this.isAnswered,
    required this.subject,
    required this.onTap,
  });

  Color? _getBackgroundColor() {
    if (isAnswered) {
      if (isCorrect) {
        return Colors.green.shade400;
      } else if (isSelected && !isCorrect) {
        return Colors.red.shade400;
      } else if (isSelected) {
        return Colors.grey.shade300;
      } else {
        return Colors.white;
      }
    }
    return Colors.white;
  }

  Color _getTextColor() {
    if (isAnswered && (isCorrect || (isSelected && !isCorrect))) {
      return Colors.white;
    }
    return Colors.black87;
  }

  IconData? _getIcon() {
    if (isAnswered) {
      if (isCorrect) {
        return Icons.check_circle;
      } else if (isSelected && !isCorrect) {
        return Icons.cancel;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBackgroundColor();
    final textColor = _getTextColor();
    final icon = _getIcon();

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected
                  ? SubjectUtils.getSubjectColor(subject)
                  : Colors.grey.shade300,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              if (icon != null)
                Icon(icon, color: textColor, size: 28)
              else
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: SubjectUtils.getSubjectColor(subject),
                      width: 2,
                    ),
                  ),
                ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  answer,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

