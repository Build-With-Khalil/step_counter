import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splashh.jpg',
            fit: BoxFit.cover,
          ),


          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.transparent),
          ),


          Container(
            color: const Color(0xFF0066FF).withOpacity(0.85),
          ),


          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 3),

                  Text(
                    l10n.appTagline,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    l10n.appSubtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  const Spacer(flex: 2),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AnimatedBuilder(
                      animation: controller.animationController,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          minHeight: 6,
                          value: controller.animationController.value,
                          color: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.3),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
