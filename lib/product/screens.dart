import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/brand.dart';
import '../app/theme.dart';
import 'quinzor_store.dart';

class QuinzorMainScreen extends StatefulWidget {
  const QuinzorMainScreen({super.key});

  @override
  State<QuinzorMainScreen> createState() => _QuinzorMainScreenState();
}

class _QuinzorMainScreenState extends State<QuinzorMainScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(title: Text('Quinzor', style: AppTheme.display(cInk)), backgroundColor: cSurface),
      body: PageView(
        controller: _controller,
        children: const [
          SpeedGridGameScreen(),
          TrainingModesScreen(),
          LeaderboardScreen(),
          StatsProfileScreen(),
        ],
      ),
    );
  }
}

class SpeedGridGameScreen extends StatelessWidget {
  const SpeedGridGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('9 x 7 = ?', style: AppTheme.display(cInk)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () {}, child: const Text('63')),
        ],
      ),
    );
  }
}

class TrainingModesScreen extends StatelessWidget {
  const TrainingModesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text('Addition', style: AppTheme.text(cInk))),
        ListTile(title: Text('Multiplication', style: AppTheme.text(cInk))),
        ListTile(title: Text('Roots', style: AppTheme.text(cInk))),
      ],
    );
  }
}

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<QuinzorStore>();
    return ListView.builder(
      itemCount: store.scores.length,
      itemBuilder: (context, index) {
        final score = store.scores[index];
        return ListTile(
          title: Text(score['player'], style: AppTheme.text(cInk)),
          trailing: Text('${score['score']}', style: AppTheme.text(cAccent)),
        );
      },
    );
  }
}

class StatsProfileScreen extends StatelessWidget {
  const StatsProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Your Stats Profile', style: AppTheme.text(cInk)),
    );
  }
}
