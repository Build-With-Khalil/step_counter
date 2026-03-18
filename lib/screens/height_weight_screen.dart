import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/height_weight_controller.dart';
import 'homepage.dart';

class HeightWeightScreen extends StatelessWidget {
  const HeightWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String? selectedGender = Get.arguments as String?;
    final controller = Get.put(HeightWeightController());
    controller.initialize(selectedGender);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final h = constraints.maxHeight;
            final w = constraints.maxWidth;

            void showHeightPicker() {
              showModalBottomSheet(
                context: context,
                builder: (_) => SizedBox(
                  height: h * 0.35,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(w * 0.04),
                        child: Text(
                          "Select Height (cm)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * 0.04,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 61,
                          itemBuilder: (_, index) {
                            final value = 140.0 + index;
                            return ListTile(
                              title: Text("${value.toStringAsFixed(0)} cm"),
                              onTap: () {
                                controller.updateHeight(value);
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            void showWeightPicker() {
              showModalBottomSheet(
                context: context,
                builder: (_) => SizedBox(
                  height: h * 0.35,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(w * 0.04),
                        child: Text(
                          "Select Weight (kg)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * 0.04,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 61,
                          itemBuilder: (_, index) {
                            final value = 40.0 + index;
                            return ListTile(
                              title: Text("${value.toStringAsFixed(0)} kg"),
                              onTap: () {
                                controller.updateWeight(value);
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header ──
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      w * 0.05, h * 0.025, w * 0.05, 0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: w * 0.07,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.headlineMedium?.color,
                      ),
                      children: [
                        TextSpan(
                          text: "More\n",
                          style: TextStyle(color: theme.primaryColor),
                        ),
                        const TextSpan(text: "About You"),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: h * 0.02),

                // ── Hint box ──
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? Colors.grey[900]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(w * 0.03),
                    child: Row(
                      children: [
                        Icon(Icons.lightbulb,
                            color: Colors.yellow, size: w * 0.05),
                        SizedBox(width: w * 0.02),
                        Expanded(
                          child: Text(
                            "To ensure accuracy, please input your correct height and weight. We never share this data.",
                            style: TextStyle(
                              fontSize: w * 0.035,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white70
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: h * 0.08),

                // ── Height picker ──
                Center(
                  child: Text(
                    "Height",
                    style: TextStyle(
                      fontSize: w * 0.04,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
                SizedBox(height: h * 0.012),
                GestureDetector(
                  onTap: showHeightPicker,
                  child: Center(
                    child: Container(
                      width: w * 0.65,
                      height: h * 0.075,
                      decoration: BoxDecoration(
                        color: theme.brightness == Brightness.dark
                            ? Colors.grey[900]
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Obx(() => Text(
                            "${controller.heightCm.value.toStringAsFixed(0)} cm",
                            style: TextStyle(
                              fontSize: w * 0.045,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                          )),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.025),

                // ── Weight picker ──
                Center(
                  child: Text(
                    "Weight",
                    style: TextStyle(
                      fontSize: w * 0.04,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
                SizedBox(height: h * 0.012),
                GestureDetector(
                  onTap: showWeightPicker,
                  child: Center(
                    child: Container(
                      width: w * 0.65,
                      height: h * 0.075,
                      decoration: BoxDecoration(
                        color: theme.brightness == Brightness.dark
                            ? Colors.grey[900]
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Obx(() => Text(
                            "${controller.weightKg.value.toStringAsFixed(0)} kg",
                            style: TextStyle(
                              fontSize: w * 0.045,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                          )),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Spacer(),

                // ── START button ──
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      w * 0.05, h * 0.01, w * 0.05, h * 0.025),
                  child: SizedBox(
                    width: double.infinity,
                    height: h * 0.065,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => controller.onStartPressed(() async {
                        Get.offAll(HomePage());
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isFirstLaunch', false);
                      }),
                      child: Text(
                        "START",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.045,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
