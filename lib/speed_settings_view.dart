import 'package:flutter/material.dart';
import 'quinzor_palette.dart';

class SpeedSettingsView extends StatefulWidget {
  const SpeedSettingsView({super.key});

  @override
  State<SpeedSettingsView> createState() => _SpeedSettingsViewState();
}

class _SpeedSettingsViewState extends State<SpeedSettingsView> {
  bool _vibrateOnAnswer = true;
  bool _showTimerWarning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferences')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: QuinzorPalette.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: QuinzorPalette.edge),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Tactile Haptic Cues'),
                  subtitle: const Text('Vibrate phone upon speed responses', style: TextStyle(color: QuinzorPalette.inkMuted)),
                  value: _vibrateOnAnswer,
                  activeColor: QuinzorPalette.accent,
                  onChanged: (v) => setState(() => _vibrateOnAnswer = v),
                ),
                const Divider(color: QuinzorPalette.edge),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Urgent Timer Pulse'),
                  subtitle: const Text('Color flashes when less than 5 seconds remaining', style: TextStyle(color: QuinzorPalette.inkMuted)),
                  value: _showTimerWarning,
                  activeColor: QuinzorPalette.accent,
                  onChanged: (v) => setState(() => _showTimerWarning = v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
