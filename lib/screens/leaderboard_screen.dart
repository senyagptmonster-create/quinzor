import 'package:flutter/material.dart';
import '../theme/quinzor_theme.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final highScores = [
      {'rank': '1', 'name': 'CyberApex', 'score': '1,450', 'mode': 'Blitz 15s'},
      {'rank': '2', 'name': 'QuantMaster', 'score': '1,280', 'mode': 'Blitz 15s'},
      {'rank': '3', 'name': 'VectorAce', 'score': '1,120', 'mode': 'Matrix x'},
      {'rank': '4', 'name': 'NeonPulse', 'score': '980', 'mode': 'Blitz 15s'},
      {'rank': '5', 'name': 'SpeedSurge', 'score': '860', 'mode': 'Division'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Hall of Fame')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: highScores.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (ctx, i) {
          final s = highScores[i];
          final isTop = i == 0;
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: QuinzorTheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isTop ? QuinzorTheme.amber : Colors.white10,
                width: isTop ? 1.5 : 1.0,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: isTop ? QuinzorTheme.amber : Colors.white12,
                  foregroundColor: isTop ? Colors.black : Colors.white,
                  child: Text(s['rank']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: QuinzorTheme.textPrimary,
                        ),
                      ),
                      Text(s['mode']!, style: const TextStyle(fontSize: 12, color: QuinzorTheme.textSecondary)),
                    ],
                  ),
                ),
                Text(
                  s['score']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: QuinzorTheme.cyan,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
