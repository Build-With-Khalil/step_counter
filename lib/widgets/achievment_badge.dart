import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AchievementBadge {
  final String id;
  final int level;
  final int goal;

  final RxBool unlocked;
  final RxInt timesAchieved;
  final RxInt progress;

  final String title;
  final String description;
  final IconData icon;
  final Color color;

  AchievementBadge({
    required this.id,
    required this.level,
    required this.goal,
    bool unlocked = false,
    int timesAchieved = 0,
    int progress = 0,
    this.title = '',
    this.description = '',
    this.icon = Icons.directions_walk,
    this.color = Colors.orange,
  })  : unlocked = RxBool(unlocked),
        timesAchieved = RxInt(timesAchieved),
        progress = RxInt(progress);

  Map<String, dynamic> toMap() => {
    'id': id,
    'level': level,
    'goal': goal,
    'unlocked': unlocked.value,
    'timesAchieved': timesAchieved.value,
    'progress': progress.value,
    'title': title,
    'description': description,
    'iconCode': icon.codePoint,
    'iconFontFamily': icon.fontFamily,
    'colorValue': color.value,
  };

  factory AchievementBadge.fromMap(Map<String, dynamic> map) => AchievementBadge(
    id: map['id'],
    level: map['level'],
    goal: map['goal'],
    unlocked: map['unlocked'] ?? false,
    timesAchieved: map['timesAchieved'] ?? 0,
    progress: map['progress'] ?? 0,
    title: map['title'] ?? '',
    description: map['description'] ?? '',
    icon: IconData(map['iconCode'], fontFamily: map['iconFontFamily']),
    color: Color(map['colorValue']),
  );
}