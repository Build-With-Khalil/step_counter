import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../controllers/daily_steps_show_controller.dart';
import '../utils/ad_helper.dart';
import '../widgets/NativeAdWidget.dart';

class DailyStepShow extends StatelessWidget {
  DailyStepShow({super.key});

  final DailyStepController controller = Get.put(DailyStepController());

  static String _monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(l10n.dailyRecords),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              Obx(() {
                final dateStr = controller.reportController
                    .formatDate(controller.selectedDate.value);
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.grey.shade900
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateStr,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text("${controller.steps.value}",
                              style: const TextStyle(fontSize: 40)),
                          const SizedBox(width: 10),
                          Text(l10n.steps),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${controller.distance.value.toStringAsFixed(2)} \n${l10n.miles}"),
                          Text(
                              "${controller.calories.value.toStringAsFixed(1)} \n${l10n.kcal}"),
                          Text(
                              "${controller.durationMinutes.value ~/ 60}h ${controller.durationMinutes.value % 60}m \n${l10n.time}"),
                        ],
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    l10n.monthlyCalendar,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/icons/calendar.png', width: 30),
                ],
              ),
              const SizedBox(height: 8),

              Obx(() {
                final currentMonth =
                    controller.reportController.currentMonth.value;
                final daysInMonth = DateUtils.getDaysInMonth(
                    currentMonth.year, currentMonth.month);

                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.grey.shade900
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: controller
                                .reportController.goToPreviousMonth,
                          ),
                          Text(
                            "${currentMonth.day} ${_monthName(currentMonth.month)} ${currentMonth.year}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_right),
                            onPressed:
                                controller.reportController.goToNextMonth,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: daysInMonth,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 6,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (_, index) {
                          final day = index + 1;
                          final date = DateTime(
                              currentMonth.year, currentMonth.month, day);
                          final steps = controller.reportController.dailySteps[
                                  controller.reportController
                                      .formatDate(date)] ??
                              0;

                          return Obx(() {
                            final isSelected =
                                controller.selectedDate.value.day == day &&
                                    controller.selectedDate.value.month ==
                                        currentMonth.month &&
                                    controller.selectedDate.value.year ==
                                        currentMonth.year;

                            return GestureDetector(
                              onTap: () => controller.selectDate(date),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.blue
                                      : isDark
                                          ? Colors.grey.shade800
                                          : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$day",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("$steps",
                                        style:
                                            const TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                );
              }),

              NativeAdWidget(adUnitId: AdHelper.native2AdUnitId),
            ],
          ),
        ),
      ),
    );
  }
}
