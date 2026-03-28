import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../controllers/gender_select_controller.dart';
import '../controllers/theme_controller.dart';
import 'height_weight_screen.dart';

class GenderSelectScreen extends StatelessWidget {
  const GenderSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(GenderSelectController());
    final themeCtrl = Get.find<ThemeController>();
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          themeCtrl.isDarkMode.value
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          color: themeCtrl.isDarkMode.value
                              ? Colors.yellow
                              : Colors.black,
                        ),
                        onPressed: themeCtrl.toggleTheme,
                      ),
                    ],
                  )),
              SizedBox(height: screenHeight * 0.012),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.07,
                  ),
                  children: [
                    TextSpan(
                      text: "${l10n.selectPrefix}\n",
                      style: TextStyle(color: theme.primaryColor),
                    ),
                    TextSpan(text: l10n.selectYourGender),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Container(
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.dark
                      ? Colors.grey[900]
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb, color: Colors.yellow, size: screenWidth * 0.05),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: Text(
                        l10n.genderHint,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black87,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.08),
              Obx(() => Row(
                    children: [
                      Expanded(
                        child: _GenderCard(
                          label: l10n.male,
                          iconPath: 'assets/icons/male.png',
                          isSelected: ctrl.selectedGender.value == "male",
                          isMale: true,
                          onTap: () => ctrl.selectGender("male"),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: _GenderCard(
                          label: l10n.female,
                          iconPath: 'assets/icons/female.png',
                          isSelected: ctrl.selectedGender.value == "female",
                          isMale: false,
                          onTap: () => ctrl.selectGender("female"),
                        ),
                      ),
                    ],
                  )),
              const Spacer(),
              Obx(() => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: ctrl.selectedGender.value == null
                          ? null
                          : () => Get.to(
                                () => const HeightWeightScreen(),
                                arguments: ctrl.selectedGender.value,
                              ),
                      child: Text(
                        l10n.next,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: screenHeight * 0.012),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenderCard extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isSelected;
  final bool isMale;
  final VoidCallback onTap;

  const _GenderCard({
    required this.label,
    required this.iconPath,
    required this.isSelected,
    required this.isMale,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
        decoration: BoxDecoration(
          color: theme.brightness == Brightness.dark
              ? Colors.grey[900]
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? theme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              iconPath,
              height: screenHeight * 0.13,
              width: screenWidth * 0.1,
              color: isSelected
                  ? theme.primaryColor
                  : (isMale ? Colors.blue : Colors.pink),
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
