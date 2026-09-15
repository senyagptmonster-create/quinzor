import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'math_speed_controller.dart';
import 'quinzor_palette.dart';

class SpeedGridView extends StatelessWidget {
  const SpeedGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<MathSpeedController>();
    final prob = ctrl.currentProblem;

    return Scaffold(
      appBar: AppBar(title: const Text('Quinzor Math Grid')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: QuinzorPalette.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: QuinzorPalette.edge),
                  ),
                  child: Text(
                    'Score: ${ctrl.score}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: QuinzorPalette.accent),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: ctrl.timeLeft <= 5 ? Colors.redAccent.withAlpha(30) : QuinzorPalette.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ctrl.timeLeft <= 5 ? Colors.redAccent : QuinzorPalette.edge),
                  ),
                  child: Text(
                    '⏳ ${ctrl.timeLeft}s',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: ctrl.timeLeft <= 5 ? Colors.redAccent : QuinzorPalette.ink,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (prob != null && ctrl.isPlaying) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                decoration: BoxDecoration(
                  color: QuinzorPalette.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: QuinzorPalette.edge),
                  boxShadow: [
                    BoxShadow(color: QuinzorPalette.accent.withAlpha(20), blurRadius: 20),
                  ],
                ),
                child: Text(
                  '${prob.a} ${prob.op} ${prob.b} = ?',
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: QuinzorPalette.ink),
                ),
              ),
              const SizedBox(height: 32),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.6,
                children: prob.options.map((opt) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: QuinzorPalette.surface,
                      foregroundColor: QuinzorPalette.ink,
                      elevation: 0,
                      side: const BorderSide(color: QuinzorPalette.edge, width: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () => ctrl.checkAnswer(opt),
                    child: Text('$opt', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  );
                }).toList(),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: QuinzorPalette.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: QuinzorPalette.edge),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.bolt, size: 64, color: QuinzorPalette.accent),
                    const SizedBox(height: 12),
                    const Text('30-Second Sprint', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    const Text('Solve as many arithmetic trials as possible.', style: TextStyle(color: QuinzorPalette.inkMuted)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: QuinzorPalette.accent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () => ctrl.startGame(),
                      child: const Text('Start Speed Trial', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ],
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
