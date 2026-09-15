import 'package:flutter/material.dart';
import '../painters/arcade_scoreboard_painter.dart';
import '../state/arcade_game_state.dart';
import '../theme/quinzor_theme.dart';
import 'game_play_screen.dart';
import 'leaderboard_screen.dart';

class ArcadeMenuScreen extends StatelessWidget {
  const ArcadeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = ArcadeScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quinzor Arcade'),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LeaderboardScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // CRT Scoreboard Display
              SizedBox(
                height: 140,
                child: CustomPaint(
                  painter: ArcadeScoreboardPainter(
                    score: state.score,
                    streak: state.streak,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'RETRO ARITHMETIC ARENA',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2,
                            color: QuinzorTheme.amber,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'BEST STREAK: ${state.highestStreak}X',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: QuinzorTheme.cyan,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              const Text(
                'SELECT DRILL MODULE',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: QuinzorTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 12),

              _buildModuleCard(
                title: 'Rapid Blitz Addition',
                desc: 'Two-digit speed additions within 15 seconds',
                icon: Icons.add_circle_outline,
                color: QuinzorTheme.cyan,
                onTap: () => _launchRound(context, state),
              ),
              const SizedBox(height: 10),
              _buildModuleCard(
                title: 'Matrix Multiplication',
                desc: '12x12 times tables lightning reflex test',
                icon: Icons.close_rounded,
                color: QuinzorTheme.amber,
                onTap: () => _launchRound(context, state),
              ),
              const SizedBox(height: 10),
              _buildModuleCard(
                title: 'Fraction Decimals',
                desc: 'Quick division approximation mastery',
                icon: Icons.percent_rounded,
                color: QuinzorTheme.green,
                onTap: () => _launchRound(context, state),
              ),
              const SizedBox(height: 28),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: QuinzorTheme.cyan,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () => _launchRound(context, state),
                icon: const Icon(Icons.play_arrow_rounded, size: 28),
                label: const Text(
                  'START SPEED ROUND',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchRound(BuildContext context, ArcadeGameState state) {
    state.startRound();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const GamePlayScreen()),
    );
  }

  Widget _buildModuleCard({
    required String title,
    required String desc,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: QuinzorTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w700, color: QuinzorTheme.textPrimary),
                  ),
                  const SizedBox(height: 3),
                  Text(desc, style: const TextStyle(fontSize: 12, color: QuinzorTheme.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white24, size: 14),
          ],
        ),
      ),
    );
  }
}
