import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'math_speed_controller.dart';
import 'quinzor_palette.dart';

class StatsLeaderboardView extends StatelessWidget {
  const StatsLeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<MathSpeedController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Performance Stats')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: QuinzorPalette.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: QuinzorPalette.edge),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('High Score', style: TextStyle(color: QuinzorPalette.inkMuted, fontSize: 13)),
                      const SizedBox(height: 6),
                      Text('${ctrl.highScore}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: QuinzorPalette.accent)),
                    ],
                  ),
                  Container(height: 48, width: 1, color: QuinzorPalette.edge),
                  Column(
                    children: [
                      const Text('Solved Total', style: TextStyle(color: QuinzorPalette.inkMuted, fontSize: 13)),
                      const SizedBox(height: 6),
                      Text('${ctrl.totalSolved}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: QuinzorPalette.ink)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: QuinzorPalette.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: QuinzorPalette.edge),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Speed Ranking Tiers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),
                  _TierRow(tier: 'Master', range: '150+ pts', color: Colors.purple),
                  Divider(color: QuinzorPalette.edge),
                  _TierRow(tier: 'Adept', range: '100 - 149 pts', color: Colors.blue),
                  Divider(color: QuinzorPalette.edge),
                  _TierRow(tier: 'Novice', range: '0 - 99 pts', color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TierRow extends StatelessWidget {
  final String tier;
  final String range;
  final Color color;
  const _TierRow({required this.tier, required this.range, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text(tier, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text(range, style: const TextStyle(color: QuinzorPalette.inkMuted)),
        ],
      ),
    );
  }
}
