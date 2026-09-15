import 'package:flutter/material.dart';

class QuinzorPalette {
  static const bg = Color(0xFFF8FAFC);
  static const surface = Color(0xFFFFFFFF);
  static const edge = Color(0xFFE2E8F0);
  static const accent = Color(0xFF3B82F6);
  static const accent2 = Color(0xFF93C5FD);
  static const ink = Color(0xFF1E3A8A);
  static const inkMuted = Color(0xFF64748B);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'AppFont',
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.light(
        surface: surface,
        primary: accent,
        secondary: accent2,
        onSurface: ink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surface,
        foregroundColor: ink,
        elevation: 0,
      ),
    );
  }
}
