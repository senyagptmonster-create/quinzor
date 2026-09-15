import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quinzor_palette.dart';
import 'math_speed_controller.dart';
import 'speed_grid_view.dart';
import 'training_modes_view.dart';
import 'stats_leaderboard_view.dart';
import 'speed_settings_view.dart';

class QuinzorApp extends StatelessWidget {
  const QuinzorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MathSpeedController(),
      child: MaterialApp(
        title: 'Quinzor Math Grid',
        debugShowCheckedModeBanner: false,
        theme: QuinzorPalette.theme,
        home: const _QuinzorShell(),
      ),
    );
  }
}

class _QuinzorShell extends StatefulWidget {
  const _QuinzorShell();

  @override
  State<_QuinzorShell> createState() => _QuinzorShellState();
}

class _QuinzorShellState extends State<_QuinzorShell> {
  int _idx = 0;

  final List<Widget> _screens = const [
    SpeedGridView(),
    TrainingModesView(),
    StatsLeaderboardView(),
    SpeedSettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _idx,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _idx,
        onDestinationSelected: (i) => setState(() => _idx = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.grid_view), label: 'Grid'),
          NavigationDestination(icon: Icon(Icons.tune), label: 'Modes'),
          NavigationDestination(icon: Icon(Icons.leaderboard), label: 'Stats'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
