import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class StorageService {
  static Future<void> saveGender(String gender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('gender', gender);
  }

  static Future<String?> getGender() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('gender');
  }

  static Future<void> saveHeight(double height) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', height);
  }

  static Future<double?> getHeight() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('height');
  }

  static Future<void> saveWeight(double weight) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('weight', weight);
  }

  static Future<double?> getWeight() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('weight');
  }

  static Future<void> saveDailyGoal(int goal) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('dailyStepGoal', goal);
  }

  static Future<int?> getDailyGoal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('dailyStepGoal');
  }

  static Future<void> saveDailySteps(int steps) async {
    final prefs = await SharedPreferences.getInstance();
    final key = formatDate(DateTime.now());
    await prefs.setInt('steps_$key', steps);
  }

  static Future<int?> getDailySteps() async {
    final prefs = await SharedPreferences.getInstance();
    final key = formatDate(DateTime.now());
    return prefs.getInt('steps_$key') ?? 0;
  }

  static Future<void> saveInitialSteps(int steps) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('initialSteps', steps);
  }

  static Future<int?> getInitialSteps() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('initialSteps');
  }

  static Future<void> saveInitialStepsDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('initialStepsDate', date.toIso8601String());
  }

  static Future<DateTime?> getInitialStepsDate() async {
    final prefs = await SharedPreferences.getInstance();
    final dateStr = prefs.getString('initialStepsDate');
    if (dateStr == null) return null;
    return DateTime.tryParse(dateStr);
  }

  static Future<void> saveLastStepCount(int steps) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastStepCount', steps);
  }

  static Future<int?> getLastStepCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('lastStepCount');
  }

  static Future<void> saveLastValidSteps(int steps) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastValidSteps', steps);
  }

  static Future<int?> getLastValidSteps() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('lastValidSteps');
  }

  static Future<void> saveLastSavedDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastSavedDate', date.toIso8601String());
  }

  static Future<DateTime?> getLastSavedDate() async {
    final prefs = await SharedPreferences.getInstance();
    final dateStr = prefs.getString('lastSavedDate');
    if (dateStr == null) return null;
    return DateTime.tryParse(dateStr);
  }

  static Future<void> saveDailyStats({
    required double distance,
    required double calories,
    required int duration,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final key = formatDate(DateTime.now());
    await prefs.setDouble('stats_distance_$key', distance);
    await prefs.setDouble('stats_calories_$key', calories);
    await prefs.setInt('stats_duration_$key', duration);
  }

  static Future<Map<String, dynamic>> getDailyStats() async {
    final prefs = await SharedPreferences.getInstance();
    final key = formatDate(DateTime.now());
    return {
      'distance': prefs.getDouble('stats_distance_$key') ?? 0.0,
      'calories': prefs.getDouble('stats_calories_$key') ?? 0.0,
      'duration': prefs.getInt('stats_duration_$key') ?? 0,
    };
  }

  static Future<void> saveStepsForDate(String key, int steps) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('steps_$key', steps);
  }

  static Future<int?> getStepsForDate(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('steps_$key') ?? 0;
  }

  static Future<Map<String, int>> getMonthlySteps(int year, int month) async {
    final prefs = await SharedPreferences.getInstance();
    final prefix = '$year-${month.toString().padLeft(2, '0')}';
    final Map<String, int> monthlySteps = {};
    final daysInMonth = DateTime(year, month + 1, 0).day;

    for (int day = 1; day <= daysInMonth; day++) {
      final key = '$prefix-${day.toString().padLeft(2, '0')}';
      monthlySteps[key] = prefs.getInt('steps_$key') ?? 0;
    }
    return monthlySteps;
  }

  static Future<void> saveAllSteps(Map<String, int> steps) async {
    final prefs = await SharedPreferences.getInstance();
    for (var entry in steps.entries) {
      await prefs.setInt('steps_${entry.key}', entry.value);
    }
  }

  static Future<void> saveStreak(int streak) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('streak', streak);
  }

  static Future<int?> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('streak');
  }

  static Future<void> saveLastOpenedDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastOpenedDate', date.toIso8601String());
  }

  static Future<DateTime?> getLastOpenedDate() async {
    final prefs = await SharedPreferences.getInstance();
    final dateStr = prefs.getString('lastOpenedDate');
    if (dateStr == null) return null;
    return DateTime.tryParse(dateStr);
  }

  static Future<void> clearStepData() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((key) => key.startsWith('steps_') || key.startsWith('stats_') || [
      'initialSteps',
      'initialStepsDate',
      'lastStepCount',
      'lastValidSteps',
      'lastSavedDate',
      'daily_distance',
      'daily_calories',
      'daily_duration',
      'weekly_Mon',
      'weekly_Tue',
      'weekly_Wed',
      'weekly_Thu',
      'weekly_Fri',
      'weekly_Sat',
      'weekly_Sun',
    ].contains(key)).toList();
    for (var key in keys) {
      await prefs.remove(key);
    }
    print('Cleared step data: $keys');
  }

  static Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (var key in keys) {
      await prefs.remove(key);
    }
    print('Cleared all data: $keys');
  }

  static Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  static Future<void> saveWeeklySteps(Map<String, int> weeklySteps) async {
    final prefs = await SharedPreferences.getInstance();
    for (var entry in weeklySteps.entries) {
      await prefs.setInt('weekly_${entry.key}', entry.value);
    }
  }

  static Future<Map<String, int>> getWeeklySteps() async {
    final prefs = await SharedPreferences.getInstance();
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final Map<String, int> weeklySteps = {};
    for (var day in days) {
      weeklySteps[day] = prefs.getInt('weekly_$day') ?? 0;
    }
    return weeklySteps;
  }

  static Future<void> saveTodayToWeekly(int todaySteps) async {
    final prefs = await SharedPreferences.getInstance();
    final weekday = getWeekdayLabel(DateTime.now().weekday);
    await prefs.setInt('weekly_$weekday', todaySteps);
  }

  static String getWeekdayLabel(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  static String formatDate(DateTime date) { // Made public
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}