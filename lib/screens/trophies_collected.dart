import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../controllers/achievements_controller.dart';
import '../utils/NativeAdWidget.dart';
import 'achievments_screen.dart';

class TrophiesPage extends StatelessWidget {
  TrophiesPage({super.key});

  final AchievementsController controller = Get.find<AchievementsController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.trophiesCollected, style: TextStyle(fontSize: screenWidth * 0.05)),
      ),
      body: Column(
        children: [
          Expanded(child: Obx(() {
        if (controller.trophyDates.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noTrophiesYet,
              style: TextStyle(fontSize: screenWidth * 0.04),
              textAlign: TextAlign.center,
            ),
          );
        }

        return GridView.builder(
          padding: EdgeInsets.all(screenWidth * 0.04),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 trophies per row
            crossAxisSpacing: screenWidth * 0.04,
            mainAxisSpacing: screenHeight * 0.02,
            childAspectRatio: 0.8,
          ),
          itemCount: controller.trophyDates.length,
          itemBuilder: (context, index) {
            final date = controller.trophyDates[index];
            return Column(
              children: [
                ClipPath(
                  clipper: ShieldClipper(),
                  child: Container(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.23,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange.withOpacity(0.9), Colors.orange],
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.orange.withOpacity(0.5), blurRadius: screenWidth * 0.015, spreadRadius: screenWidth * 0.005),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.emoji_events,
                        size: screenWidth * 0.09,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.015),
                Text(
                  '${date.month}/${date.day}/${date.year}',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        );
      })),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const NativeAdWidget(),
          ),
        ],
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height * 0.75);
    path.lineTo(0, size.height * 0.25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}