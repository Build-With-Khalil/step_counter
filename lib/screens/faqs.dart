import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  final List<Map<String, String>> faqs = const [
    {
      "question": "Does this app count my steps?",
      "answer":
      "Yes, Pedometer Walk & Track accurately counts your steps throughout the day. "
          "It also tracks distance, calories burned, and active time to give you a complete view of your activity."
    },
    {
      "question": "Does the app have weight loss exercises?",
      "answer":
      "Yes, the app includes simple weight-loss and fitness exercises. "
          "You can find them at the bottom of the Health screen, designed to support your daily workout routine."
    },
    {
      "question": "Does the app keep monthly records of my steps?",
      "answer":
      "Yes, the app stores your daily, weekly, and monthly step records. "
          "This allows you to review your progress over time and stay motivated to achieve your fitness goals."
    },
    {
      "question": "Do you store my personal data?",
      "answer":
      "No, we do not store any of your personal data on servers. "
          "All of your step counts, records, and activity details are securely saved only on your device. "
          "This ensures your privacy and full control over your information."
    },
    {
      "question": "Will the app share my data with anyone?",
      "answer":
      "No, your data is never shared with anyone. "
          "Since Pedometer Walk & Track does not collect your personal data, there is nothing to share. "
          "You can use the app with complete confidence and peace of mind."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
