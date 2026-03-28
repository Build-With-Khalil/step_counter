import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appGuide),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader(l10n.dailyWeeklyTracking),
            _sectionDescription(l10n.dailyWeeklyTrackingDesc),
            const Divider(height: 32),

            _sectionHeader(l10n.monthlyReportAchievements),
            _sectionDescription(l10n.monthlyReportDesc),
            const Divider(height: 32),

            _sectionHeader(l10n.healthFitness),
            _sectionDescription(l10n.healthFitnessDesc),
            const Divider(height: 32),

            _sectionHeader(l10n.settingsProfile),
            _sectionDescription(l10n.settingsProfileDesc),
            const Divider(height: 32),

            _sectionHeader(l10n.tips),
            _sectionDescription(l10n.tipsDesc),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.check_circle_outline),
                label: Text(l10n.gotIt),
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