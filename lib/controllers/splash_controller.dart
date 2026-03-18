import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/onboarding_controller.dart';
import '../main.dart';
import '../screens/onboarding_screen.dart';
import '../widgets/app_open_ad_widget.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();

    // Preload onboarding ads immediately so they're ready before splash ends
    if (!Get.isRegistered<OnboardingController>()) {
      Get.put(OnboardingController());
    }

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward();

    Future.delayed(const Duration(seconds: 4), () async {
      if (!kIsWeb) {
        await AppOpenAdWidget.loadAndShowAppOpenAd().catchError((e) {
          debugPrint('App Open Ad error: $e');
        });
      }

      await Get.find<PermissionController>().checkPermissions();

      final prefs = await SharedPreferences.getInstance();
      final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
      if (isFirstLaunch) {
        Get.off(() => const OnBoardingScreen());
      } else {
        Get.off(() => const OnBoardingScreen());
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
