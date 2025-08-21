import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import '../controllers/goal_controller.dart';
import '../controllers/todayscreen_controllr.dart';
import '../services/notification_services.dart';

class NotificationController extends GetxController {
  static Timer? _progressTimer;
  static final List<String> _motivationalQuotes = [
    "Halfway there! Keep pushing to crush your goal! 🥳",
    "You're doing awesome! Let's hit that step goal! 💪",
    "50% done! Keep walking to reach your target! 🚶",
    "You're unstoppable! Finish strong for your goal! 🌟",
    "Halfway mark! Let's crush the rest of your steps! 🔥",
    "Keep going, you're so close to your goal! 😊",
    "You're on fire! Complete your step goal now! 💥",
    "Every step counts! Push to the finish line! 🏃",
    "You're killing it! Keep those steps coming! 🚀",
    "Halfway to victory! Let's make it happen! 🎉",
    "Stay focused, your goal is within reach! 💪",
    "You're a rockstar! Keep moving forward! 🌟",
    "Half done, half to go! You got this! 🔥",
    "Keep stepping, you're closer than you think! 🚶",
    "You're making progress! Finish strong! 😊",
    "Halfway milestone! Let's hit that goal! 🥳",
    "Stay strong, your goal is waiting! 💥",
    "You're amazing! Keep those steps rolling! 🚀",
    "Halfway there! Time to shine! 🌟",
    "Push through, your goal is so close! 💪",
  ];
  static bool _halfGoalTriggered = false;
  static bool _goalTriggered = false;

  @override
  void onInit() {
    super.onInit();
    _startProgressNotifications();
  }

  void _startProgressNotifications() {
    _progressTimer?.cancel();

    _progressTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      final controller = Get.find<TodayScreenController>();
      final steps = controller.totalSteps.value;
      final goal = Get.find<GoalController>().dailyStepGoal.value;
      final now = DateTime.now();

      // Reset triggered states for new day
      if (now.day != DateTime.now().day) {
        _halfGoalTriggered = false;
        _goalTriggered = false;
      }

      // 50% Goal Notification
      if (!_halfGoalTriggered && steps >= goal * 0.5 && steps < goal) {
        final random = Random();
        final quote = _motivationalQuotes[random.nextInt(_motivationalQuotes.length)];
        NotificationService.showHalfGoalNotification(quote);
        _halfGoalTriggered = true;
      }

      // Goal Reached Notification
      if (!_goalTriggered && steps >= goal) {
        NotificationService.showGoalReachedNotification();
        _goalTriggered = true;
      }
    });
  }

  @override
  void onClose() {
    _progressTimer?.cancel();
    super.onClose();
  }
}