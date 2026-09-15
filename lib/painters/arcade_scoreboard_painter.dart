import 'package:flutter/material.dart';

class ArcadeScoreboardPainter extends CustomPainter {
  final int score;
  final int streak;

  const ArcadeScoreboardPainter({required this.score, required this.streak});

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()
      ..color = const Color(0xFF0F172A)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(16)),
      bgPaint,
    );

    // Neon Cyber Border
    final borderPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF06B6D4), Color(0xFF3B82F6), Color(0xFF8B5CF6)],
      ).createShader(Offset.zero & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(16)),
      borderPaint,
    );

    // Scanlines
    final scanlinePaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.18)
      ..strokeWidth = 1.0;
    for (double y = 4; y < size.height; y += 5) {
      canvas.drawLine(Offset(4, y), Offset(size.width - 4, y), scanlinePaint);
    }
  }

  @override
  bool shouldRepaint(covariant ArcadeScoreboardPainter oldDelegate) {
    return oldDelegate.score != score || oldDelegate.streak != streak;
  }
}
