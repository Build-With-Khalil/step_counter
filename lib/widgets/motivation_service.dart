

class MotivationService {
  static String getMessageForSteps(int steps, int goal) {
    if (steps >= goal) {
      return '🎉 You already crushed your step goal today! Keep the streak alive!';
    } else if (steps >= (goal * 0.75).round()) {
      return '🔥 You’re 75% there—just a little more to go!';
    } else if (steps >= (goal * 0.5).round()) {
      return '💪 Halfway to your goal! Keep moving!';
    } else if (steps >= (goal * 0.25).round()) {
      return '🚶‍♂️ Great start! Let’s push toward halfway!';
    } else {
      return '🌟 Every step counts. Let’s get moving!';
    }
  }

  static String getWelcomeQuote() {
    final quotes = [
      '🏃‍♂️ Let’s make today count — one step at a time!',
      '💥 Your goals are waiting. Let’s crush them!',
      '🔥 Every step is progress. Keep moving forward!',
      '🌟 You’ve got this. Let’s chase that goal!',
      '💪 Strong start leads to strong finish. Let’s go!',
    ];
    quotes.shuffle();
    return quotes.first;
  }
}