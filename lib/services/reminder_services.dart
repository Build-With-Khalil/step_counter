import 'dart:async';
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderService {
  static Timer? _dailyTimer;
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static DateTime? _lastNotificationDate; // Track last notification date

  static final List<String> _motivationalQuotes = [
    "Start your day strong! 💪 Step up and shine!",
    "Rise and move! 🚶 Your goals await you!",
    "Today’s steps, tomorrow’s strength! 🌟",
    "Keep walking, keep winning! 🏃",
    "Your journey starts now! 🔥 Get moving!",
    "One step at a time, you’re unstoppable! 😊",
    "Seize the day with every step! 💥",
    "Stay active, stay awesome! 🚀",
    "Your fitness goals are calling! 🥳",
    "Make today count with every step! 🌞",
  ];

  static final List<String> _notificationTitles = [
    "Kickstart Your Day! 🚀",
    "Step Into Greatness! 🌟",
    "Your Daily Spark! 💥",
    "Rise & Conquer! 🏃",
    "Move Forward Today! 🥳",
    "Seize Your Steps! 🔥",
   " Power Up Your Day! 💪",
  "  Chase Your Goals! 🏆",
   " Start Strong Now! 🌞",
   " Unleash Your Potential! 🚴"
  ];

  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const settings = InitializationSettings(android: androidSettings, iOS: iosSettings);
    await _notificationsPlugin.initialize(settings);

    final androidPlugin = _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final iosPlugin = _notificationsPlugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      await androidPlugin.requestNotificationsPermission();
    }
    if (iosPlugin != null) {
      await iosPlugin.requestPermissions(alert: true, badge: true, sound: true);
    }
  }

  static void startDailyReminder() {
    _dailyTimer?.cancel();

    _dailyTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      final now = DateTime.now();
      final hour = now.hour;
      final minute = now.minute;

      if (hour == 9 && minute == 0) {
        final today = DateTime(now.year, now.month, now.day);
        if (_lastNotificationDate == null ||
            today.isAfter(_lastNotificationDate!)) {
          final random = Random();
          final quote = _motivationalQuotes[random.nextInt(_motivationalQuotes.length)];
          final title = _notificationTitles[random.nextInt(_notificationTitles.length)];
          _showDailyReminderNotification(quote, title);
          _lastNotificationDate = today; // Update last notification date
        }
      }
    });
  }

  static void stopDailyReminder() {
    _dailyTimer?.cancel();
  }

  static Future<void> _showDailyReminderNotification(String quote, String title) async {
    print('Showing notification at ${DateTime.now()}: $title - $quote'); // Debug log
    const androidDetails = AndroidNotificationDetails(
      'daily_reminder_channel',
      'Daily Reminders',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);
    await _notificationsPlugin.show(
      6,
      title,
      quote,
      details,
    );
  }

  static Future<void> testNotification() async {
    print('Testing notification at ${DateTime.now()}'); // Debug log
    final random = Random();
    final quote = _motivationalQuotes[random.nextInt(_motivationalQuotes.length)];
    final title = _notificationTitles[random.nextInt(_notificationTitles.length)];
    await _showDailyReminderNotification(quote, title);
  }
}