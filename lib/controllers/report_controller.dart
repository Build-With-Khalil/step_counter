import 'package:get/get.dart';
import '../services/storage_services.dart';
import '../controllers/todayscreen_controllr.dart';
import '../utils/step_calculator.dart';

class ReportController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> currentMonth = DateTime.now().obs;
  RxBool isLoading = false.obs;

  RxMap<String, int> dailySteps = <String, int>{}.obs;

  RxInt totalSteps = 0.obs;
  RxDouble totalDistance = 0.0.obs;
  RxDouble totalCalories = 0.0.obs;
  RxInt totalMinutes = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadDailyStepsFromStorage();
    _loadTodaySteps();
  }

  @override
  void onReady() {
    super.onReady();
    final todayController = Get.find<TodayScreenController>();
    ever(todayController.totalSteps, (value) async {
      final key = formatDate(DateTime.now());
      dailySteps[key] = value;
      await StorageService.saveStepsForDate(key, value);
      await StorageService.saveAllSteps(dailySteps);
      _calculateMonthlyStats();
    });
    refreshFromStorage();
  }

  Future<void> _loadTodaySteps() async {
    final key = formatDate(DateTime.now());
    final steps = await StorageService.getStepsForDate(key) ?? 0;
    dailySteps[key] = steps;
    _calculateMonthlyStats();
  }

  Future<void> refreshFromStorage() async {
    await loadDailyStepsFromStorage();
    _calculateMonthlyStats();
  }

  Future<void> loadDailyStepsFromStorage() async {
    try {
      isLoading.value = true;
      final year = currentMonth.value.year;
      final month = currentMonth.value.month;
      final monthlySteps = await StorageService.getMonthlySteps(year, month);
      dailySteps.value = monthlySteps;
      _calculateMonthlyStats();
    } catch (e) {
      Get.snackbar("Error", "Failed to load monthly data");
      dailySteps.value = {};
    } finally {
      isLoading.value = false;
    }
  }

  void _calculateMonthlyStats() {
    final year = currentMonth.value.year;
    final month = currentMonth.value.month;
    final filtered = getStepsForMonth(year, month);

    final steps = filtered.values.fold(0, (sum, value) => sum + value);
    totalSteps.value = steps;
    totalDistance.value = StepCalculator.toMiles(steps);
    totalCalories.value = StepCalculator.toCalories(steps);
    totalMinutes.value = StepCalculator.toDuration(steps);
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void goToPreviousMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month - 1);
    loadDailyStepsFromStorage();
  }

  void goToNextMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month + 1);
    loadDailyStepsFromStorage();
  }

  int getStepsForDate(DateTime date) {
    final key = formatDate(date);
    return dailySteps[key] ?? 0;
  }

  Map<String, int> getStepsForMonth(int year, int month) {
    final prefix = '$year-${pad(month)}';
    return Map.fromEntries(
      dailySteps.entries.where((entry) => entry.key.startsWith(prefix)),
    );
  }

  String formatDate(DateTime date) {
    return '${date.year}-${pad(date.month)}-${pad(date.day)}';
  }

  String pad(int value) => value.toString().padLeft(2, '0');

  Future<void> saveDailyStepsToStorage() async {
    await StorageService.saveAllSteps(dailySteps);
  }
}
