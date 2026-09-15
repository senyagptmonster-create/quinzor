import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MathProblem {
  final int a;
  final int b;
  final String op;
  final int answer;
  final List<int> options;

  MathProblem({
    required this.a,
    required this.b,
    required this.op,
    required this.answer,
    required this.options,
  });
}

class MathSpeedController extends ChangeNotifier {
  static const _highScoreKey = 'quinzor_high_score_v2';
  static const _totalSolvedKey = 'quinzor_total_solved_v2';

  int _score = 0;
  int _highScore = 0;
  int _totalSolved = 0;
  int _timeLeft = 30;
  bool _isPlaying = false;
  Timer? _gameTimer;

  MathProblem? _currentProblem;
  String _activeOperation = 'Addition';

  int get score => _score;
  int get highScore => _highScore;
  int get totalSolved => _totalSolved;
  int get timeLeft => _timeLeft;
  bool get isPlaying => _isPlaying;
  MathProblem? get currentProblem => _currentProblem;
  String get activeOperation => _activeOperation;

  MathSpeedController() {
    _loadStats();
    _generateProblem();
  }

  Future<void> _loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    _highScore = prefs.getInt(_highScoreKey) ?? 0;
    _totalSolved = prefs.getInt(_totalSolvedKey) ?? 0;
    notifyListeners();
  }

  void setOperation(String op) {
    _activeOperation = op;
    _generateProblem();
    notifyListeners();
  }

  void _generateProblem() {
    final rnd = Random();
    int a = 2 + rnd.nextInt(18);
    int b = 2 + rnd.nextInt(18);
    String op = '+';
    int ans = a + b;

    if (_activeOperation == 'Multiplication') {
      a = 2 + rnd.nextInt(11);
      b = 2 + rnd.nextInt(11);
      op = '×';
      ans = a * b;
    } else if (_activeOperation == 'Subtraction') {
      if (a < b) {
        final t = a;
        a = b;
        b = t;
      }
      op = '-';
      ans = a - b;
    }

    final opts = <int>{ans};
    while (opts.length < 4) {
      final delta = rnd.nextInt(7) - 3;
      final fake = ans + (delta == 0 ? 4 : delta);
      if (fake >= 0) opts.add(fake);
    }
    final optList = opts.toList()..shuffle();

    _currentProblem = MathProblem(a: a, b: b, op: op, answer: ans, options: optList);
  }

  void startGame() {
    _score = 0;
    _timeLeft = 30;
    _isPlaying = true;
    _generateProblem();
    _gameTimer?.cancel();
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_timeLeft > 0) {
        _timeLeft--;
        notifyListeners();
      } else {
        _endGame();
      }
    });
    notifyListeners();
  }

  void _endGame() async {
    _isPlaying = false;
    _gameTimer?.cancel();
    if (_score > _highScore) {
      _highScore = _score;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_highScoreKey, _highScore);
    }
    notifyListeners();
  }

  void checkAnswer(int choice) async {
    if (!_isPlaying) return;
    if (choice == _currentProblem?.answer) {
      _score += 10;
      _totalSolved += 1;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_totalSolvedKey, _totalSolved);
      _generateProblem();
    } else {
      _score = max(0, _score - 5);
      _generateProblem();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    super.dispose();
  }
}
