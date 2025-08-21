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

    void _showHeightPicker() {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 250,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text("Select Height (cm)", style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: ListView.builder(
                    itemCount: 61, // 140 to 200 cm
                    itemBuilder: (_, index) {
                      double value = 140.0 + index;
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
          );
        },
      );
    }

    void _showWeightPicker() {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 250,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text("Select Weight (kg)", style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: ListView.builder(
                    itemCount: 61, // 40 to 100 kg
                    itemBuilder: (_, index) {
                      double value = 40.0 + index;
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
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: "More\n", style: TextStyle(color: theme.primaryColor)),
                    const TextSpan(text: "About You"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.dark ? Colors.grey[900] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Colors.yellow, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "To ensure accuracy, please input your correct height and weight. We never share this data.",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.brightness == Brightness.dark ? Colors.white70 : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Center(child: Text("Height", style: theme.textTheme.bodyMedium)),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _showHeightPicker,
                child: Center(
                  child: Container(
                    width: 250,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark ? Colors.grey[900] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Obx(() => Text(
                        "${controller.heightCm.value.toStringAsFixed(0)} cm",
                        style: theme.textTheme.bodyMedium,
                      )),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(child: Text("Weight", style: theme.textTheme.bodyMedium)),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _showWeightPicker,
                child: Center(
                  child: Container(
                    width: 250,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark ? Colors.grey[900] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Obx(() => Text(
                        "${controller.weightKg.value.toStringAsFixed(0)} kg",
                        style: theme.textTheme.bodyMedium,
                      )),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () async {
                    Get.offAll(HomePage());
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('isFirstLaunch', false);
                  },
                  child: const Text("START", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}