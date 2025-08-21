import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import 'height_weight_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   String? selectedGender;
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      themeController.isDarkMode.value
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: themeController.isDarkMode.value
                          ? Colors.yellow
                          : Colors.black,
                    ),
                    onPressed: () {
                      themeController.toggleTheme();
                    },
                  ),

                ],
              ),
              const SizedBox(height: 10),

              RichText(
                text: TextSpan(
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Select\n",
                      style: TextStyle(
                        color: theme.primaryColor,
                      ),
                    ),
                    const TextSpan(text: "Your Gender"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.dark
                      ? Colors.grey[900]
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Colors.yellow, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "We need it to measure your stride length and calorie burn.",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),


              Row(
                children: [
                  Expanded(
                    child: _genderCard(
                      label: "Male",
                      iconPath: 'assets/icons/male.png',
                      isSelected: selectedGender == "male",
                      onTap: () => setState(() => selectedGender = "male"),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: _genderCard(
                      label: "Female",
                      iconPath: 'assets/icons/female.png',
                      isSelected: selectedGender == "female",
                      onTap: () => setState(() => selectedGender = "female"),
                    ),
                  ),
                  const SizedBox(width: 16),

                ],
              ),
              const SizedBox(height: 100),



              const Spacer(),


              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: selectedGender == null
                      ? null
                      : () {
                    Get.to(() => HeightWeightScreen(), arguments: selectedGender);

                  },
                  child: const Text(
                    "NEXT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 12),



              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderCard({
    required String label,
    required String iconPath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[900]
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              iconPath,
              height: 100,
              width: 40,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : (label == "Male" ? Colors.blue : Colors.pink),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
