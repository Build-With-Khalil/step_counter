import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:step_counter/screens/achievments_screen.dart';
import 'package:step_counter/utils/ad_helper.dart';

import '../controllers/report_controller.dart';
import 'daily_steps_show.dart';

class ReportPage extends StatelessWidget {
  final ReportController controller = Get.find<ReportController>();

  ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildToggleButton(
                    l10n.achievements,
                    isDark,
                    'assets/icons/ach.png',
                    screenHeight,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              Obx(() {
                final steps = controller.totalSteps.value;
                final distance = controller.totalDistance.value.toStringAsFixed(
                  2,
                );
                final calories = controller.totalCalories.value.toStringAsFixed(
                  1,
                );
                final minutes = controller.totalMinutes.value;

                return Container(
                  width: double.infinity,
                  height: screenHeight * 0.25,
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.thisMonth,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Row(
                        children: [
                          Text(
                            "$steps",
                            style: TextStyle(fontSize: screenWidth * 0.1),
                          ),
                          SizedBox(width: screenWidth * 0.025),
                          Text(l10n.totalSteps),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "$distance \n${l10n.mile}",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "$calories \n${l10n.kcal}",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${minutes ~/ 60}h ${minutes % 60}m \nTime",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: screenHeight * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    l10n.monthlyProgress,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/calendar.png',
                    width: screenWidth * 0.075,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),

              Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight * 0.05),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final currentMonth = controller.currentMonth.value;
                final daysInMonth = DateUtils.getDaysInMonth(
                  currentMonth.year,
                  currentMonth.month,
                );
                final selectedDay = controller.selectedDate.value.day;
                final selectedMonth = controller.selectedDate.value.month;
                final selectedYear = controller.selectedDate.value.year;

                return Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.chevron_left,
                              size: screenWidth * 0.06,
                            ),
                            onPressed: controller.goToPreviousMonth,
                          ),
                          Text(
                            "${currentMonth.day} ${_monthName(currentMonth.month)} ${currentMonth.year}",
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.chevron_right,
                              size: screenWidth * 0.06,
                            ),
                            onPressed: controller.goToNextMonth,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: daysInMonth,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          crossAxisSpacing: screenWidth * 0.015,
                          mainAxisSpacing: screenWidth * 0.015,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (_, index) {
                          final day = index + 1;
                          final date = DateTime(
                            currentMonth.year,
                            currentMonth.month,
                            day,
                          );
                          final isSelected =
                              selectedDay == day &&
                              selectedMonth == currentMonth.month &&
                              selectedYear == currentMonth.year;
                          final steps =
                              controller.dailySteps[controller.formatDate(
                                date,
                              )] ??
                              0;

                          return GestureDetector(
                            onTap: () {
                              controller.selectDate(date);
                              AdManager.onNavigationAction();
                              Get.to(() => DailyStepShow());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Theme.of(context).primaryColor
                                    : isDark
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$day",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.04,
                                    ),
                                  ),
                                  Text(
                                    "$steps",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(
    String label,
    bool isDark,
    String iconPath,
    double screenHeight,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () { AdManager.onNavigationAction(); Get.to(() => AchievementsPage()); },
        child: Container(
          height: screenHeight * 0.15,
          margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.005),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.015,
            horizontal: screenHeight * 0.01,
          ),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: screenHeight * 0.01),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.025,
                ),
              ),
              Image.asset(
                iconPath,
                width: screenHeight * 0.05,
                height: screenHeight * 0.05,
              ),
              SizedBox(height: screenHeight * 0.01),
            ],
          ),
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
