import 'package:confetti/confetti.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:step_counter/utils/ad_helper.dart';

import '../controllers/goal_controller.dart';
import '../controllers/todayscreen_controllr.dart';
import '../services/celebration_service.dart';
import '../widgets/NativeAdWidget.dart';

class TodayPage extends StatelessWidget {
  TodayPage({super.key});

  final controller = Get.find<TodayScreenController>();
  final goalController = Get.find<GoalController>();
  final celebrationService = CelebrationService();
  final milestones = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 10000];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    final steps = controller.totalSteps.value;
                    for (final milestone in milestones) {
                      final badgeKey = '${milestone}Steps';
                      if (steps >= milestone &&
                          !celebrationService.unlockedBadges.contains(badgeKey)) {
                        celebrationService.unlockedBadges.add(badgeKey);
                        celebrationService.triggerConfetti();
                      }
                    }

                    return Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          decoration: BoxDecoration(
                            color: theme.brightness == Brightness.dark
                                ? Colors.grey[900]
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              AnimatedIconWidget(isTracking: controller.isTracking),
                              Text(
                                "${controller.totalSteps.value}",
                                style: theme.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.08,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                l10n.todaysTotalSteps,
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(fontSize: screenWidth * 0.04),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: screenHeight * 0.015,
                          right: screenWidth * 0.03,
                          child: GestureDetector(
                            onTap: controller.toggleTracking,
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: Obx(() => Icon(
                                controller.isTracking.value
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                                size: screenWidth * 0.06,
                              )),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),

                  SizedBox(height: screenHeight * 0.02),

                  Obx(() => Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.03),
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? Colors.grey[900]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMiniStat(
                          'assets/icons/distance.png',
                          controller.distance.value.toStringAsFixed(2),
                          l10n.mile,
                          theme,
                          screenWidth,
                        ),
                        _buildMiniStat(
                          'assets/icons/kcal.png',
                          controller.calories.value.toStringAsFixed(1),
                          l10n.kcal,
                          theme,
                          screenWidth,
                        ),
                        _buildMiniStat(
                          'assets/icons/time.png',
                          _formatDuration(
                              controller.durationMinutes.value),
                          l10n.time,
                          theme,
                          screenWidth,
                        ),
                      ],
                    ),
                  )),
                  SizedBox(height: screenHeight * 0.02),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: screenHeight * 0.13,
                          decoration: BoxDecoration(
                            color: theme.brightness == Brightness.dark
                                ? Colors.grey[900]
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Obx(() {
                            final goal =
                                goalController.dailyStepGoal.value;
                            final steps = controller.totalSteps.value;
                            final remaining = (goal - steps).clamp(0, goal);
                            final progress =
                            (steps / goal).clamp(0.0, 1.0);

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  l10n.goalSteps(goal),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                      fontSize: screenWidth * 0.045),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    minHeight: screenHeight * 0.015,
                                    backgroundColor: Colors.grey.shade300,
                                    valueColor:
                                    AlwaysStoppedAnimation<Color>(
                                        Colors.blue),
                                  ),
                                ),
                                Text(
                                  l10n.stepsLeft(remaining),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: screenWidth * 0.04),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Container(
                          height: screenHeight * 0.13,
                          decoration: BoxDecoration(
                            color: theme.brightness == Brightness.dark
                                ? Colors.grey[900]
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Obx(() {
                            final streak = controller.streak.value;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "$streak",
                                    style: theme.textTheme.bodyMedium
                                        ?.copyWith(
                                        fontSize: screenWidth * 0.10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  l10n.daysStreak,
                                  style: theme.textTheme.titleMedium
                                      ?.copyWith(
                                    fontSize: screenWidth * 0.025,
                                    color: theme.brightness ==
                                        Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  NativeAdWidget(
                    adUnitId: AdHelper.native2AdUnitId,
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  Obx(() {
                    final goal = goalController.dailyStepGoal.value;
                    final days = [
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun'
                    ];
                    final maxSteps =
                    controller.weeklySteps.values.fold<double>(
                      0,
                          (prev, value) =>
                      value > prev ? value.toDouble() : prev,
                    );
                    final chartMaxY = (maxSteps > goal ? maxSteps : goal.toDouble()) > 10000
                        ? maxSteps
                        : 10000.0;

                    final today = DateTime.now().weekday - 1; // ✅ Dynamic current day (0=Mon, 6=Sun)

                    return Container(
                      decoration: BoxDecoration(
                        color: theme.brightness == Brightness.dark
                            ? Colors.grey[900]
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: SizedBox(
                        height: screenHeight * 0.29,
                        child: BarChart(
                          BarChartData(
                            maxY: chartMaxY,
                            alignment: BarChartAlignment.spaceAround,
                            barTouchData: BarTouchData(enabled: false),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    final day = days[value.toInt()];
                                    final steps =
                                        controller.weeklySteps[day] ?? 0;
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: screenHeight * 0.01),
                                      child: Text(
                                        steps.toString(),
                                        style: TextStyle(
                                          color: theme.brightness ==
                                              Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: screenWidth * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                  reservedSize: screenHeight * 0.05,
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, _) {
                                    final dayIndex = value.toInt();
                                    return Padding(
                                      padding: EdgeInsets.only(top: screenHeight * 0.01),
                                      child: Text(
                                        days[dayIndex],
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                          color: dayIndex == today // ✅ Dynamic highlight
                                              ? Colors.green
                                              : theme.brightness == Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    );
                                  },
                                  reservedSize: screenHeight * 0.04,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: List.generate(7, (index) {
                              final day = days[index];
                              final value = controller.weeklySteps[day] ?? 0;

                              return BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    toY: value.toDouble(),
                                    color: index == today // ✅ Dynamic highlight
                                        ? Colors.green
                                        : Colors.blue,
                                    width: screenWidth * 0.1,
                                    borderRadius: BorderRadius.circular(4),
                                    backDrawRodData: BackgroundBarChartRodData(
                                      show: true,
                                      toY: chartMaxY,
                                      color: theme.brightness == Brightness.dark
                                          ? Colors.grey[800]
                                          : Colors.grey[200],
                                    ),
                                  ),
                                ],
                              );
                            }),
                            gridData: FlGridData(show: false),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: celebrationService.confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: [Colors.green, Colors.blue, Colors.purple],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(String iconPath, String value, String label,
      ThemeData theme, double screenWidth) {
    return Column(
      children: [
        Image.asset(iconPath,
            width: screenWidth * 0.06, height: screenWidth * 0.06),
        SizedBox(height: screenWidth * 0.01),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.04,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall
              ?.copyWith(fontSize: screenWidth * 0.03),
        ),
      ],
    );
  }

  String _formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return "${hours}h ${mins}m";
  }
}

class AnimatedIconWidget extends StatelessWidget {
  final RxBool isTracking;

  const AnimatedIconWidget({super.key, required this.isTracking});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      return SizedBox(
        width: screenWidth * 0.18,
        height: screenWidth * 0.18,
        child: Center(
          child: isTracking.value
              ? Image.asset(
            'assets/images/walkking.gif',
            width: screenWidth * 0.15,
          )
              : Icon(
            Icons.directions_walk,
            size: screenWidth * 0.15,
            color: Colors.blue,
          ),
        ),
      );
    });
  }
}
