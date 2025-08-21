import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_counter/screens/reduce_stress.dart';
import '../controllers/goal_controller.dart';
import '../controllers/reminder_controller.dart';
import '../controllers/todayscreen_controllr.dart';
import '../widgets/fitness_card.dart';
import 'abs_select_screen.dart';
import 'lose_weight_selector.dart';
import 'morning_warmup.dart';

class HealthScreen extends StatelessWidget {
  HealthScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> achievementLevels = [
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

  String getBMICategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  Map<String, dynamic> getCurrentBadge(int steps) {
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

  Map<String, dynamic> getNextBadge(int steps) {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put(GoalController());
    final reminderController = Get.put(ReminderController());
    final todayController = Get.put(TodayScreenController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (!controller.isDataLoaded.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenHeight * 0.015),
                  child: Container(
                    height: screenHeight * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? Colors.grey[900]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Set Daily Step Goal', style: theme.textTheme.titleMedium),
                          SizedBox(height: screenHeight * 0.015),
                          Obx(() {
                            final goal = controller.dailyStepGoal.value;
                            return Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Slider(
                                    value: goal.toDouble(),
                                    min: 1000,
                                    max: 10000,
                                    divisions: 9,
                                    label: '$goal',
                                    onChanged: (value) {
                                      controller.setDailyStepGoal(value.toInt());
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text('$goal steps', style: TextStyle(fontSize: screenWidth * 0.04)),
                                      if (controller.totalSteps.value >= goal)
                                        Icon(Icons.emoji_events, color: Colors.green, size: screenWidth * 0.07),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenHeight * 0.015),
                  child: Container(
                    height: screenHeight * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? Colors.grey[900]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Obx(() {
                        final steps = controller.totalSteps.value;
                        final currentBadge = getCurrentBadge(steps);
                        final nextBadge = getNextBadge(steps);
                        final progress = steps / nextBadge['threshold'];
                        final clampedProgress = progress.clamp(0.0, 1.0);

                        return Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shield, size: screenWidth * 0.1, color: theme.primaryColor),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  '${currentBadge['title']}',
                                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: screenWidth * 0.04),
                                ),
                                Text(
                                  '${currentBadge['badge']} Badge',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Achievement Progress', style: theme.textTheme.titleMedium),
                                  SizedBox(height: screenHeight * 0.015),
                                  Slider(
                                    value: clampedProgress,
                                    min: 0,
                                    max: 1,
                                    divisions: 100,
                                    label: '${(clampedProgress * 100).toInt()}%',
                                    onChanged: (_) {},
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('$steps / ${nextBadge['threshold']} steps', style: TextStyle(fontSize: screenWidth * 0.035)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenHeight * 0.015),
                  child: Container(
                    height: screenHeight * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? Colors.grey[900]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: screenHeight * 0.02,
                          left: screenWidth * 0.04,
                          child: Obx(() {
                            final bmi = controller.bmi.value;
                            final category = getBMICategory(bmi);
                            return Text(
                              'BMI: ${bmi.toStringAsFixed(1)} ($category)',
                              style: theme.textTheme.titleMedium?.copyWith(fontSize: screenWidth * 0.045),
                            );
                          }),
                        ),
                        Positioned(
                          bottom: screenHeight * 0.04,
                          left: screenWidth * 0.04,
                          right: screenWidth * 0.04,
                          child: Obx(() {
                            final bmi = controller.bmi.value;
                            final sliderWidth = screenWidth - (screenWidth * 0.08);
                            final bmiPercent = ((bmi.clamp(10.0, 40.0) - 10) / 30).clamp(0.0, 1.0);
                            final arrowPosition = sliderWidth * bmiPercent;

                            return Stack(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 33,
                                      child: Container(
                                        height: screenHeight * 0.030,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 34,
                                      child: Container(
                                        height: screenHeight * 0.030,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 33,
                                      child: Container(
                                        height: screenHeight * 0.030,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  left: arrowPosition - (screenWidth * 0.03),
                                  top: -screenHeight * 0.019,
                                  child: Icon(Icons.arrow_drop_up, size: screenWidth * 0.1, color: theme.primaryColor),
                                ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenHeight * 0.015),
                  child: Container(
                    height: screenHeight * 0.15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? Colors.grey[900]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Daily Reminder', style: theme.textTheme.titleMedium),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'Receive a motivational quote every morning at 9 AM',
                                  style: TextStyle(fontSize: screenWidth * 0.035),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Obx(() {
                            return Switch(
                              value: reminderController.isDailyReminderEnabled.value,
                              onChanged: (value) {
                                reminderController.toggleDailyReminder(value);
                              },
                              activeColor: Colors.blue,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenHeight * 0.015),
                  child: Container(
                    height: screenHeight * 0.15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? Colors.grey[900]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                todayController.resetTodaysSteps();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade400,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Reset Today\'s Steps', style: TextStyle(fontSize: screenWidth * 0.035)),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.025),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                todayController.resetAllData();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade600,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Reset All Data', style: TextStyle(fontSize: screenWidth * 0.035)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045, vertical: screenHeight * 0.015),
                  child: Text(
                    'Fitness Section',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.25,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FitnessContainer(
                          title: 'Abs',
                          subtitle: 'Only Four Moves for Abs',
                          imagePath: 'assets/images/abss.png',
                          gradientColors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
                          width: screenWidth * 0.35,
                          height: screenHeight * 0.25,
                          onTap: () {
                            Get.to(AbsSelectScreen());
                          },
                        ),
                        FitnessContainer(
                          title: 'Lose Weight',
                          subtitle: 'Burn fat more effectively',
                          imagePath: 'assets/images/loss.png',
                          gradientColors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
                          width: screenWidth * 0.35,
                          height: screenHeight * 0.25,
                          onTap: () {
                            Get.to(LoseWeightSelector());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.25,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FitnessContainer(
                          title: 'Reduce Stress',
                          subtitle: 'Clear mind, relax and meditate',
                          imagePath: 'assets/images/smile.png',
                          gradientColors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
                          width: screenWidth * 0.35,
                          height: screenHeight * 0.25,
                          onTap: () {
                            Get.to(ReduceStress());
                          },
                        ),
                        FitnessContainer(
                          title: 'Morning Warmup',
                          subtitle: 'Get some Fresh air Vitamin D',
                          imagePath: 'assets/images/morning.png',

                          gradientColors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
                          width: screenWidth * 0.35,
                          height: screenHeight * 0.25,
                          onTap: () {
                            Get.to(MorningWarmup());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}