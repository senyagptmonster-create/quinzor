import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'math_speed_controller.dart';
import 'quinzor_palette.dart';

class TrainingModesView extends StatelessWidget {
  const TrainingModesView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<MathSpeedController>();
    final modes = [
      {'title': 'Addition', 'sub': 'Summation speed calibration', 'icon': Icons.add},
      {'title': 'Subtraction', 'sub': 'Difference agility reflex', 'icon': Icons.remove},
      {'title': 'Multiplication', 'sub': 'Times-table rapid recall', 'icon': Icons.close},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Training Modes')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: modes.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, idx) {
          final m = modes[idx];
          final isSel = ctrl.activeOperation == m['title'];
          return InkWell(
            onTap: () => ctrl.setOperation(m['title'] as String),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: isSel ? QuinzorPalette.accent.withAlpha(20) : QuinzorPalette.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSel ? QuinzorPalette.accent : QuinzorPalette.edge,
                  width: isSel ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: isSel ? QuinzorPalette.accent : QuinzorPalette.edge,
                    foregroundColor: isSel ? Colors.white : QuinzorPalette.ink,
                    child: Icon(m['icon'] as IconData),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(m['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(m['sub'] as String, style: const TextStyle(fontSize: 12, color: QuinzorPalette.inkMuted)),
                      ],
                    ),
                  ),
                  if (isSel) const Icon(Icons.check_circle, color: QuinzorPalette.accent),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
