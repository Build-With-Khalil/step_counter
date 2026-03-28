import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = theme.brightness == Brightness.dark;

    final faqs = [
      {"question": l10n.faq1Question, "answer": l10n.faq1Answer},
      {"question": l10n.faq2Question, "answer": l10n.faq2Answer},
      {"question": l10n.faq3Question, "answer": l10n.faq3Answer},
      {"question": l10n.faq4Question, "answer": l10n.faq4Answer},
      {"question": l10n.faq5Question, "answer": l10n.faq5Answer},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Text(
                faq["question"]!,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12, right: 8, left: 8),
                    child: Text(
                      faq["answer"]!,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
