import 'package:flutter/material.dart';
import '../state/arcade_game_state.dart';
import '../theme/quinzor_theme.dart';

class RoundSummaryScreen extends StatelessWidget {
  const RoundSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = ArcadeScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Round Completed'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.stars_rounded, color: QuinzorTheme.amber, size: 72),
              const SizedBox(height: 16),
              const Text(
                'EXCELLENT DRILL',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  color: QuinzorTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: QuinzorTheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: QuinzorTheme.cyan.withValues(alpha: 0.3)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Final Score', style: TextStyle(color: QuinzorTheme.textSecondary)),
                        Text(
                          '${state.score}',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: QuinzorTheme.cyan),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.white12, height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Highest Streak', style: TextStyle(color: QuinzorTheme.textSecondary)),
                        Text(
                          '${state.highestStreak}x',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: QuinzorTheme.amber),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: QuinzorTheme.cyan,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text('BACK TO ARENA HUB', style: TextStyle(fontWeight: FontWeight.w800)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
