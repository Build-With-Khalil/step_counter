import 'package:flutter/material.dart';

class AchievementConfig {
  // Achievement Levels for Goal Screen (BMI/Progress tracking)
  static final List<Map<String, dynamic>> achievementLevels = [
    {
      'level': 1,
      'title': 'Level 1',
      'badges': [
        {'tier': 1, 'name': 'Bronze', 'threshold': 1000},
        {'tier': 2, 'name': 'Silver', 'threshold': 2000},
        {'tier': 3, 'name': 'Gold', 'threshold': 3000},
      ],
    },
    {
      'level': 2,
      'title': 'Level 2',
      'badges': [
        {'tier': 1, 'name': 'Ruby', 'threshold': 4000},
        {'tier': 2, 'name': 'Sapphire', 'threshold': 5000},
        {'tier': 3, 'name': 'Emerald', 'threshold': 6000},
      ],
    },
    {
      'level': 3,
      'title': 'Level 3',
      'badges': [
        {'tier': 1, 'name': 'Platinum', 'threshold': 7000},
        {'tier': 2, 'name': 'Diamond', 'threshold': 8000},
        {'tier': 3, 'name': 'Obsidian', 'threshold': 10000},
      ],
    },
  ];

  // Badge Milestones (matches AchievementsController)
  static final List<Map<String, dynamic>> badgeMilestones = [
    {'id': 'l1_1000', 'title': '1K Steps', 'description': 'Walk 1,000 steps', 'goal': 1000, 'level': 1, 'icon': Icons.directions_walk, 'color': Colors.orange},
    {'id': 'l1_2000', 'title': '2K Steps', 'description': 'Walk 2,000 steps', 'goal': 2000, 'level': 1, 'icon': Icons.directions_walk, 'color': Colors.deepOrange},
    {'id': 'l1_3000', 'title': '3K Steps', 'description': 'Walk 3,000 steps', 'goal': 3000, 'level': 1, 'icon': Icons.directions_walk, 'color': Colors.redAccent},
    {'id': 'l2_4000', 'title': '4K Steps', 'description': 'Walk 4,000 steps', 'goal': 4000, 'level': 2, 'icon': Icons.directions_run, 'color': Colors.purple},
    {'id': 'l2_5000', 'title': '5K Steps', 'description': 'Walk 5,000 steps', 'goal': 5000, 'level': 2, 'icon': Icons.directions_run, 'color': Colors.indigo},
    {'id': 'l2_6000', 'title': '6K Steps', 'description': 'Walk 6,000 steps', 'goal': 6000, 'level': 2, 'icon': Icons.directions_run, 'color': Colors.blue},
    {'id': 'l3_7000', 'title': '7K Steps', 'description': 'Walk 7,000 steps', 'goal': 7000, 'level': 3, 'icon': Icons.star, 'color': Colors.teal},
    {'id': 'l3_8000', 'title': '8K Steps', 'description': 'Walk 8,000 steps', 'goal': 8000, 'level': 3, 'icon': Icons.star, 'color': Colors.green},
    {'id': 'l3_10000', 'title': '10K Steps', 'description': 'Walk 10,000 steps', 'goal': 10000, 'level': 3, 'icon': Icons.emoji_events, 'color': Colors.amber},
  ];

  // BMI Categories
  static String getBMICategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  // Get current badge based on steps
  static Map<String, dynamic> getCurrentBadge(int steps) {
    for (final level in achievementLevels.reversed) {
      for (final badge in level['badges'].reversed) {
        if (steps >= badge['threshold']) {
          return {
            'level': level['level'],
            'title': level['title'],
            'badge': badge['name'],
            'threshold': badge['threshold'],
          };
        }
      }
    }

    final firstLevel = achievementLevels.first;
    final firstBadge = firstLevel['badges'].first;
    return {
      'level': firstLevel['level'],
      'title': firstLevel['title'],
      'badge': firstBadge['name'],
      'threshold': firstBadge['threshold'],
    };
  }

  // Get next badge to unlock
  static Map<String, dynamic> getNextBadge(int steps) {
    for (final level in achievementLevels) {
      for (final badge in level['badges']) {
        if (steps < badge['threshold']) {
          return {
            'level': level['level'],
            'title': level['title'],
            'badge': badge['name'],
            'threshold': badge['threshold'],
          };
        }
      }
    }
    return achievementLevels.last['badges'].last;
  }

  // Trophy milestone (10K steps)
  static const int trophyMilestone = 10000;

  // Check if trophy should be awarded
  static bool shouldAwardTrophy(int steps) {
    return steps >= trophyMilestone;
  }
}
