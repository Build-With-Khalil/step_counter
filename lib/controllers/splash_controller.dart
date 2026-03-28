import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/onboarding_controller.dart';
import '../screens/homepage.dart';
import '../screens/language_selection_screen.dart';
import '../screens/onboarding_screen.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();

    // Preload onboarding controller
    if (!Get.isRegistered<OnboardingController>()) {
      Get.put(OnboardingController());
    }

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    Future.delayed(const Duration(seconds: 5), () async {
      final prefs = await SharedPreferences.getInstance();
      final hasSelectedLanguage = prefs.containsKey('selectedLocale');
      final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

      if (!hasSelectedLanguage) {
        Get.off(() => const LanguageSelectionScreen());
      } else if (isFirstLaunch) {
        Get.off(() => const OnBoardingScreen());
      } else {
        Get.off(() => const HomePage());
      }
    });
  }

  @override
  void onReady() {
    super.onReady();

    // NEW (matches your file name)
    precacheImage(
      const AssetImage('assets/images/splashh.jpg'), // <-- Fixed
      Get.context!,
    );

  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
