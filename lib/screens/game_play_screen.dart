import 'package:flutter/material.dart';
import '../state/arcade_game_state.dart';
import '../theme/quinzor_theme.dart';
import 'round_summary_screen.dart';

class GamePlayScreen extends StatelessWidget {
  const GamePlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = ArcadeScope.of(context);
    final question = state.questions[state.currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${state.currentQuestionIndex + 1}/${state.questions.length}'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Bar: Time & Streak
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: QuinzorTheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.timer, color: QuinzorTheme.amber, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          '${state.secondsRemaining}s',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: QuinzorTheme.textPrimary),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: QuinzorTheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Score: ${state.score}',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: QuinzorTheme.cyan),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Equation Card
              Container(
                padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
                decoration: BoxDecoration(
                  color: QuinzorTheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: QuinzorTheme.cyan.withValues(alpha: 0.3)),
                ),
                child: Center(
                  child: Text(
                    question.equation,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: QuinzorTheme.textPrimary,
                    ),
                  ),
                ),
              ),
              const Spacer(),

              // Options 2x2 Grid
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildChoiceBtn(context, state, question.options[0])),
                      const SizedBox(width: 12),
                      Expanded(child: _buildChoiceBtn(context, state, question.options[1])),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildChoiceBtn(context, state, question.options[2])),
                      const SizedBox(width: 12),
                      Expanded(child: _buildChoiceBtn(context, state, question.options[3])),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceBtn(BuildContext context, ArcadeGameState state, int val) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: QuinzorTheme.card,
        foregroundColor: QuinzorTheme.textPrimary,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () {
        state.answerQuestion(val, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const RoundSummaryScreen()),
          );
        });
      },
      child: Text(
        '$val',
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }
}
