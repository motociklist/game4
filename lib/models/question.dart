enum Subject {
  mathematics,
  physics,
  chemistry,
}

class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final Subject subject;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.subject,
  });
}

