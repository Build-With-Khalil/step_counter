import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

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

  static Future<void> showWelcomeNotification(String quote) async {
    const androidDetails = AndroidNotificationDetails(
      'welcome_channel',
      'Welcome Notifications',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);
    await _notificationsPlugin.show(
      5,
      'Welcome Back 👋',
      quote,
      details,
    );
  }

  static Future<void> showHalfGoalNotification(String quote) async {
    const androidDetails = AndroidNotificationDetails(
      'goal_channel',
      'Goal Progress',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);
    await _notificationsPlugin.show(
      3,
      'Halfway to Your Goal! 🥳',
      quote,
      details,
    );
  }

  static Future<void> showGoalReachedNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'goal_channel',
      'Goal Achievements',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);
    await _notificationsPlugin.show(
      4,
      'Goal Reached! 🎉',
      'You hit your daily step goal! Great job!',
      details,
    );
  }
}