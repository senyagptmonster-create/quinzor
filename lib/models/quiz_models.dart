class QuizQuestion {
  final String equation;
  final int correctAnswer;
  final List<int> options;

  const QuizQuestion({
    required this.equation,
    required this.correctAnswer,
    required this.options,
  });

  static List<QuizQuestion> generateSampleSet() {
    return const [
      QuizQuestion(equation: '47 + 28 = ?', correctAnswer: 75, options: [65, 75, 73, 85]),
      QuizQuestion(equation: '12 x 8 = ?', correctAnswer: 96, options: [86, 96, 106, 92]),
      QuizQuestion(equation: '144 / 12 = ?', correctAnswer: 12, options: [14, 12, 11, 16]),
      QuizQuestion(equation: '65 - 29 = ?', correctAnswer: 36, options: [34, 36, 46, 38]),
      QuizQuestion(equation: '15 x 6 = ?', correctAnswer: 90, options: [80, 85, 90, 95]),
    ];
  }
}
