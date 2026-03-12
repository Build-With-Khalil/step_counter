class StepCalculator {
  // Constants
  static const double metersPerStep = 0.762;
  static const double metersPerMile = 1609.34;
  static const double caloriesPerStep = 0.04;
  static const double stepsPerMinute = 100.0;

  // Calculations
  static double toMiles(int steps) => (steps * metersPerStep) / metersPerMile;

  static double toCalories(int steps) => steps * caloriesPerStep;

  static int toDuration(int steps) => (steps / stepsPerMinute).round();

  static String formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return "${hours}h ${mins}m";
  }
}
