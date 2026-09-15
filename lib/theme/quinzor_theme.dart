import 'package:flutter/material.dart';

class QuinzorTheme {
  static const background = Color(0xFF090D16);
  static const surface = Color(0xFF131B2E);
  static const card = Color(0xFF1B253F);
  static const cyan = Color(0xFF00E5FF);
  static const amber = Color(0xFFFFB703);
  static const crimson = Color(0xFFEF4444);
  static const green = Color(0xFF10B981);
  static const textPrimary = Color(0xFFF8FAFC);
  static const textSecondary = Color(0xFF94A3B8);

  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: cyan,
      cardColor: card,
      fontFamily: 'AppFont',
      colorScheme: const ColorScheme.dark(
        primary: cyan,
        secondary: amber,
        surface: surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
