import 'package:confetti/confetti.dart';

class CelebrationService {
  final ConfettiController confettiController = ConfettiController(duration: Duration(seconds: 2));
  final List<String> unlockedBadges = [];

  void triggerConfetti() {
    confettiController.play();
  }

  void dispose() {
    confettiController.dispose();
  }

  void checkAndUnlockBadge(int stepsToday) {
    final milestones = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 10000];

    for (final milestone in milestones) {
      final badgeKey = '${milestone}Steps';
      if (stepsToday >= milestone && !unlockedBadges.contains(badgeKey)) {
        unlockedBadges.add(badgeKey);
        triggerConfetti();
      }
    }
  }
}