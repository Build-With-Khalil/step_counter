import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "NSB Solutions (Private) Limited is committed to protecting your privacy. "
                    "Our app, Pedometer – Walk & Track, is designed to help you monitor your daily activity "
                    "without compromising your personal data. We do not collect, store, or transmit any user information—period.",
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Text(
                "We do not request or access your name, email, location, contacts, or any other personal identifiers. "
                    "All step tracking and progress data is processed locally on your device and never leaves it. "
                    "There is no cloud sync, no analytics, and no third-party tracking.",
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Text(
                "The app may request permission to access physical activity sensors and send notifications. "
                    "These are used solely to count your steps and deliver motivational messages. "
                    "No data is shared externally, and no information is stored beyond your device.",
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Text(
                "We do not use third-party services, SDKs, or APIs that collect user data. "
                    "Your experience with Pedometer – Walk & Track is entirely private and self-contained.",
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Text(
                "Our app is suitable for all age groups and does not knowingly collect any data from children. "
                    "Since we do not collect any information, there is no risk of misuse or unauthorized access.",
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Text(
                "If we make changes to the app that affect how it works or interacts with your device, "
                    "we will also update this Privacy Policy to reflect those changes. "
                    "We’re committed to keeping you informed and protected every step of the way.",
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Text(
                "For any questions or support, you can reach us at:",
                style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "NSB Solutions (Private) Limited\n"
                    "📧 nsbsolutions2000@gmail.com\n"
                    "🌐 https://nsbsolutions.online\n"
                    "📞 +92 323 3525610",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
