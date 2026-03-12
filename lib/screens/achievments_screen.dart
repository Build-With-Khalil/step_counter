import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'package:step_counter/screens/trophies_collected.dart';
import '../controllers/achievements_controller.dart';
import '../utils/ad_helper.dart';
import '../widgets/NativeAdWidget.dart';
import '../widgets/achievment_badge.dart';

class AchievementsPage extends StatefulWidget {
  AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  final AchievementsController controller = Get.find<AchievementsController>();
  final ConfettiController confettiController = ConfettiController(duration: const Duration(seconds: 3));

  @override
  void initState() {
    super.initState();
    ever(controller.unlockedBadge, (badge) {
      if (badge != null) {
        confettiController.play();
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: ConfettiWidget(
                    confettiController: confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    colors: const [Colors.green, Colors.blue, Colors.purple, Colors.orange],
                    numberOfParticles: 40,
                    maxBlastForce: 25,
                    minBlastForce: 10,
                    gravity: 0.3,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Center(
                    child: buildStylizedBadge(
                      screenWidth: MediaQuery.of(context).size.width,
                      unlocked: true,
                      label: badge.title,
                      icon: badge.icon,
                      color: badge.color,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Unlocked: ${badge.title}',
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(badge.description, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035)),
              ],
            ),
          ),
        ).then((_) {
          controller.unlockedBadge.value = null;
        });

        Future.delayed(const Duration(seconds: 3), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            AdManager.onNavigationAction();
            Get.to(TrophiesPage());
          },
              icon: Image.asset('assets/icons/ach.png'),
          )

        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('Achievements', style: TextStyle(fontSize: screenWidth * 0.05)),
      ),
      body: Stack(
        children: [
          Obx(() {
            if (controller.showCelebration.value) {
              confettiController.play();
            }
            return SingleChildScrollView(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLevelRow(
                    level: 1,
                    iconPath: 'assets/icons/one.png',
                    badges: controller.badges.where((b) => b.level == 1).toList(),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  _buildLevelRow(
                    level: 2,
                    iconPath: 'assets/icons/two.png',
                    badges: controller.badges.where((b) => b.level == 2).toList(),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  _buildLevelRow(
                    level: 3,
                    iconPath: 'assets/icons/three.png',
                    badges: controller.badges.where((b) => b.level == 3).toList(),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  NativeAdWidget(adUnitId: AdHelper.native2AdUnitId),
                ],
              ),
            );
          }),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [Colors.green, Colors.blue, Colors.purple, Colors.orange],
              numberOfParticles: 30,
              maxBlastForce: 20,
              minBlastForce: 5,
              gravity: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelRow({
    required int level,
    required String iconPath,
    required List<AchievementBadge> badges,
    required double screenWidth,
    required double screenHeight,
  }) {
    final unlockedCount = badges.where((b) => b.unlocked.value).length;
    final totalCount = badges.length;
    final progress = totalCount == 0 ? 0.0 : unlockedCount / totalCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(iconPath, width: screenWidth * 0.08, height: screenWidth * 0.08),
            SizedBox(width: screenWidth * 0.02),
            Text(
              'Level $level',
              style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              '$unlockedCount / $totalCount',
              style: TextStyle(fontSize: screenWidth * 0.035, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.015),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: screenHeight * 0.015,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: badges.map((badge) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                child: Obx(() => AnimatedScale(
                  scale: badge.unlocked.value ? 1.0 : 0.85,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutBack,
                  child: Tooltip(
                    message: badge.description,
                    child: buildStylizedBadge(
                      screenWidth: screenWidth,
                      unlocked: badge.unlocked.value,
                      label: badge.title,
                      icon: badge.icon,
                      color: badge.color,
                    ),
                  ),
                )),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildStylizedBadge({
    required double screenWidth,
    required bool unlocked,
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      children: [
        ClipPath(
          clipper: ShieldClipper(),
          child: Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.225,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: unlocked ? [color.withOpacity(0.9), color] : [Colors.grey.shade400, Colors.grey.shade300],
              ),
              boxShadow: unlocked
                  ? [BoxShadow(color: color.withOpacity(0.5), blurRadius: screenWidth * 0.015, spreadRadius: screenWidth * 0.005)]
                  : [],
            ),
            child: Center(
              child: Icon(
                icon,
                size: screenWidth * 0.09,
                color: unlocked ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.015),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenWidth * 0.01),
          decoration: BoxDecoration(
            color: unlocked ? Colors.black87 : Colors.grey.shade500,
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        Text(
          unlocked ? 'Unlocked' : 'Locked',
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: unlocked ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }
}

class ShieldClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(0, size.height * 0.3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}