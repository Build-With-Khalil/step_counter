import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../widgets/achievment_badge.dart';
import '../services/storage_services.dart';
import '../controllers/todayscreen_controllr.dart'; // For real-time steps

class AchievementsController extends GetxController {
  final RxInt currentLevel = 1.obs;
  final RxList<AchievementBadge> badges = <AchievementBadge>[].obs;
  final RxList<DateTime> trophyDates = <DateTime>[].obs; // List of dates when 10k was achieved
  final RxBool showCelebration = false.obs;
  final Rx<AchievementBadge?> unlockedBadge = Rx<AchievementBadge?>(null);
  final AudioPlayer _audioPlayer = AudioPlayer();
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  DateTime? _lastAchievementDate; // To track daily resets

  @override
  void onInit() {
    super.onInit();
    _initNotifications();
    loadBadges();
    _loadTrophies();
    loadProgress();
    ever(Get.find<TodayScreenController>().totalSteps, (steps) => updateAchievements(steps as int)); // Real-time update
  }

  Future<void> _initNotifications() async {
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

  Future<void> _showBadgeUnlockNotification(String badgeTitle) async {
    const androidDetails = AndroidNotificationDetails(
      'badge_channel',
      'Badge Unlocks',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);
    await _notificationsPlugin.show(
      1,
      'Badge Unlocked! 🥳',
      'You unlocked: $badgeTitle',
      details,
    );
  }

  Future<void> _showTrophyUnlockNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'trophy_channel',
      'Trophy Unlocks',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);
    await _notificationsPlugin.show(
      2,
      'Trophy Collected! 🏆',
      'You reached 10K steps today! A new trophy has been added.',
      details,
    );
  }

  void loadBadges() {
    badges.value = [
      AchievementBadge(
        id: 'l1_1000',
        title: '1K Steps',
        description: 'Walk 1,000 steps',
        goal: 1000,
        level: 1,
        icon: Icons.directions_walk,
        color: Colors.orange,
      ),
      AchievementBadge(
        id: 'l1_2000',
        title: '2K Steps',
        description: 'Walk 2,000 steps',
        goal: 2000,
        level: 1,
        icon: Icons.directions_walk,
        color: Colors.deepOrange,
      ),
      AchievementBadge(
        id: 'l1_3000',
        title: '3K Steps',
        description: 'Walk 3,000 steps',
        goal: 3000,
        level: 1,
        icon: Icons.directions_walk,
        color: Colors.redAccent,
      ),
      AchievementBadge(
        id: 'l2_4000',
        title: '4K Steps',
        description: 'Walk 4,000 steps',
        goal: 4000,
        level: 2,
        icon: Icons.directions_run,
        color: Colors.purple,
      ),
      AchievementBadge(
        id: 'l2_5000',
        title: '5K Steps',
        description: 'Walk 5,000 steps',
        goal: 5000,
        level: 2,
        icon: Icons.directions_run,
        color: Colors.indigo,
      ),
      AchievementBadge(
        id: 'l2_6000',
        title: '6K Steps',
        description: 'Walk 6,000 steps',
        goal: 6000,
        level: 2,
        icon: Icons.directions_run,
        color: Colors.blue,
      ),
      AchievementBadge(
        id: 'l3_7000',
        title: '7K Steps',
        description: 'Walk 7,000 steps',
        goal: 7000,
        level: 3,
        icon: Icons.star,
        color: Colors.teal,
      ),
      AchievementBadge(
        id: 'l3_8000',
        title: '8K Steps',
        description: 'Walk 8,000 steps',
        goal: 8000,
        level: 3,
        icon: Icons.star,
        color: Colors.green,
      ),
      AchievementBadge(
        id: 'l3_10000',
        title: '10K Steps',
        description: 'Walk 10,000 steps',
        goal: 10000,
        level: 3,
        icon: Icons.emoji_events,
        color: Colors.amber,
      ),
    ];
  }

  Future<void> updateAchievements(int todaySteps) async {
    bool unlockedSomething = false;
    bool awardedTrophy = false;

    for (var badge in badges) {
      badge.progress.value = todaySteps.clamp(0, badge.goal);

      if (!badge.unlocked.value && todaySteps >= badge.goal) {
        badge.unlocked.value = true;
        badge.timesAchieved.value++;
        unlockedBadge.value = badge;
        unlockedSomething = true;
        await _playSuccessSound();
        await _showBadgeUnlockNotification(badge.title);
        print('Unlocked badge: ${badge.title} (${badge.goal} steps)');
      }
    }

    // Trophy logic: Award if 10k reached and not awarded today
    if (todaySteps >= 10000 && !trophyDates.any((date) => _isSameDay(date, DateTime.now()))) {
      trophyDates.add(DateTime.now());
      awardedTrophy = true;
      await _playSuccessSound();
      await _showTrophyUnlockNotification();
      print('Awarded trophy for 10K steps on ${DateTime.now()}');
    }

    while (_isLevelComplete(currentLevel.value) && currentLevel.value < 3) {
      currentLevel.value++;
      print('Advanced to level: ${currentLevel.value}');
    }

    await saveProgress();

    if (unlockedSomething || awardedTrophy) {
      showCelebration.value = true;
      Future.delayed(const Duration(seconds: 3), () {
        showCelebration.value = false;
      });
    }
  }

  Future<void> _playSuccessSound() async {
    try {
      await _audioPlayer.play(AssetSource('audio/success.mp3'));
    } catch (e) {
      print('Error playing success sound: $e');
    }
  }

  bool _isLevelComplete(int level) {
    return badges.where((b) => b.level == level).every((b) => b.unlocked.value);
  }

  List<AchievementBadge> get currentLevelBadges =>
      badges.where((b) => b.level == currentLevel.value).toList();

  Future<void> saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentLevel', currentLevel.value);
    final todayKey = StorageService.formatDate(DateTime.now()); // Use public method
    final unlockedIds = badges.where((b) => b.unlocked.value).map((b) => b.id).toList();
    await prefs.setStringList('unlockedBadges_$todayKey', unlockedIds);
    // Save trophies
    final trophyStrings = trophyDates.map((date) => date.toIso8601String()).toList();
    await prefs.setStringList('trophyDates', trophyStrings);
    print('Saved progress: currentLevel=${currentLevel.value}, unlockedBadges=$unlockedIds for $todayKey, trophies=${trophyStrings.length}');
  }

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    currentLevel.value = prefs.getInt('currentLevel') ?? 1;
    final todayKey = StorageService.formatDate(DateTime.now()); // Use public method
    final unlockedIds = prefs.getStringList('unlockedBadges_$todayKey') ?? [];
    final todaySteps = await StorageService.getDailySteps() ?? 0;

    // Daily reset check
    final lastAchievementDateStr = prefs.getString('lastAchievementDate');
    _lastAchievementDate = lastAchievementDateStr != null ? DateTime.parse(lastAchievementDateStr) : null;
    if (_lastAchievementDate == null || !_isSameDay(_lastAchievementDate!, DateTime.now())) {
      // Reset badges for new day
      for (var badge in badges) {
        badge.unlocked.value = false;
        badge.timesAchieved.value = 0;
      }
      await prefs.remove('unlockedBadges_${StorageService.formatDate(_lastAchievementDate ?? DateTime.now())}');
      await prefs.setString('lastAchievementDate', DateTime.now().toIso8601String());
      _lastAchievementDate = DateTime.now();
      print('Reset badges for new day: $todayKey');
    } else {
      for (var badge in badges) {
        badge.unlocked.value = unlockedIds.contains(badge.id);
        badge.progress.value = todaySteps.clamp(0, badge.goal);
      }
    }

    await updateAchievements(todaySteps);
    print('Loaded progress: currentLevel=${currentLevel.value}, todaySteps=$todaySteps');
  }

  Future<void> _loadTrophies() async {
    final prefs = await SharedPreferences.getInstance();
    final trophyStrings = prefs.getStringList('trophyDates') ?? [];
    trophyDates.value = trophyStrings.map((str) => DateTime.parse(str)).toList();
    print('Loaded trophies: ${trophyDates.length}');
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}