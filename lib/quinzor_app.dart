import 'package:flutter/material.dart';
import 'screens/arcade_menu_screen.dart';
import 'state/arcade_game_state.dart';
import 'theme/quinzor_theme.dart';

class QuinzorApp extends StatefulWidget {
  const QuinzorApp({super.key});

  @override
  State<QuinzorApp> createState() => _QuinzorAppState();
}

class _QuinzorAppState extends State<QuinzorApp> {
  final ArcadeGameState _gameState = ArcadeGameState();

  @override
  void dispose() {
    _gameState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ArcadeScope(
      notifier: _gameState,
      child: MaterialApp(
        title: 'Quinzor Arcade',
        debugShowCheckedModeBanner: false,
        theme: QuinzorTheme.themeData,
        home: const ArcadeMenuScreen(),
      ),
    );
  }
}
