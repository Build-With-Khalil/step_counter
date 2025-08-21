import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Guide'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader('🏃‍♂️ Daily & Weekly Tracking'),
            _sectionDescription(
              'On the first main screen, you’ll see your daily step count live at the top. '
                  'Below that, a weekly bar chart shows your progress for each day of the week.',
            ),
            const Divider(height: 32),

            _sectionHeader('📊 Monthly Report & Achievements'),
            _sectionDescription(
              'The second screen gives you a full monthly breakdown of your steps. '
                  'You can view each day’s record and see your total distance, calories, and duration. '
                  'Achievements are also shown here, with progress toward unlocking badges.',
            ),
            const Divider(height: 32),

            _sectionHeader('💪 Health & Fitness'),
            _sectionDescription(
              'On the third screen, you can set your daily step goal and track your BMI. '
                  'You’ll also find fitness routines like:\n'
                  '• Abs workouts\n'
                  '• Weight loss exercises\n'
                  '• Stress reduction\n'
                  '• Morning warmups\n\n'
                  'Each section includes estimated duration and calories burned.',
            ),
            const Divider(height: 32),

            _sectionHeader('⚙️ Settings & Profile'),
            _sectionDescription(
              'The fourth screen includes your personal info like height and gender. '
                  'You can toggle between light and dark themes, and reset your step data if needed.',
            ),
            const Divider(height: 32),

            _sectionHeader('🎯 Tips'),
            _sectionDescription(
              '• Tap badges to view their descriptions.\n'
                  '• Confetti celebrates your progress when you unlock achievements.\n'
                  '• Use the health screen daily to stay consistent and motivated.',
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Got it!'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _sectionDescription(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, height: 1.5),
      ),
    );
  }
}