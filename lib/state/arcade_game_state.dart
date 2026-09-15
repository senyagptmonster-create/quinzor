import 'dart:async';
import 'package:flutter/material.dart';
import '../models/quiz_models.dart';

class ArcadeGameState extends ChangeNotifier {
  int score = 0;
  int streak = 0;
  int highestStreak = 0;
  int currentQuestionIndex = 0;
  int secondsRemaining = 15;
  bool isRoundActive = false;
  List<QuizQuestion> questions = QuizQuestion.generateSampleSet();

  Timer? _timer;

  void startRound() {
    score = 0;
    streak = 0;
    currentQuestionIndex = 0;
    secondsRemaining = 15;
    isRoundActive = true;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining > 1) {
        secondsRemaining--;
        notifyListeners();
      } else {
        finishRound();
      }
    });
    notifyListeners();
  }

  void answerQuestion(int answer, VoidCallback onFinished) {
    if (!isRoundActive) return;

    final current = questions[currentQuestionIndex];
    if (answer == current.correctAnswer) {
      streak++;
      if (streak > highestStreak) highestStreak = streak;
      score += 100 + (streak * 20);
    } else {
      streak = 0;
    }

    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      notifyListeners();
    } else {
      finishRound();
      onFinished();
    }
  }

  void finishRound() {
    _timer?.cancel();
    _timer = null;
    isRoundActive = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class ArcadeScope extends InheritedNotifier<ArcadeGameState> {
  const ArcadeScope({
    super.key,
    required ArcadeGameState notifier,
    required super.child,
  }) : super(notifier: notifier);

  static ArcadeGameState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ArcadeScope>();
    assert(scope != null, 'No ArcadeScope found in context');
    return scope!.notifier!;
  }
}
