import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/onboarding_screen.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..forward();


    Future.delayed(const Duration(seconds: 8), () {
      Get.off(() => const OnBoardingScreen());
    });
  }

  @override
  void onReady() {
    super.onReady();

    precacheImage(
      const AssetImage('assets/images/splash.jpg'),
      Get.context!,
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
