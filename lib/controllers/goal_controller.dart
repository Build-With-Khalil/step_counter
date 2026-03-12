import 'package:get/get.dart';
import '../controllers/todayscreen_controllr.dart';
import '../services/storage_services.dart';

class GoalController extends GetxController {
  RxInt dailyStepGoal = 3000.obs;
  RxString gender = ''.obs;
  RxDouble heightCm = 0.0.obs;
  RxDouble weightKg = 0.0.obs;

  RxDouble bmi = 0.0.obs;
  RxInt totalSteps = 0.obs;

  RxInt weeklyAverageSteps = 0.obs;
  RxInt bestDaySteps = 0.obs;
  RxInt weeklyCalories = 0.obs;

  RxBool isDataLoaded = false.obs;
  RxBool hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
    everAll([heightCm, weightKg], (_) => calculateBMI());
  }

  @override
  void onReady() {
    super.onReady();
    try {
      final todayController = Get.find<TodayScreenController>();
      ever(todayController.totalSteps, (value) {
        totalSteps.value = value;
      });
    } catch (e) {
      // TodayScreenController not initialized yet
    }
  }

  Future<void> _loadUserData() async {
    try {
      isDataLoaded.value = false;
      hasError.value = false;

      final savedGoal = await StorageService.getDailyGoal();
      dailyStepGoal.value = savedGoal ?? 3000;

      final savedGender = await StorageService.getGender();
      final savedHeight = await StorageService.getHeight();
      final savedWeight = await StorageService.getWeight();

      gender.value = savedGender ?? '';
      heightCm.value = savedHeight ?? 0.0;
      weightKg.value = savedWeight ?? 0.0;

      final savedSteps = await StorageService.getDailySteps();
      totalSteps.value = savedSteps ?? 0;

      calculateBMI();
      isDataLoaded.value = true;
    } catch (e) {
      hasError.value = true;
      isDataLoaded.value = true;
      Get.snackbar(
        "Error",
        "Failed to load health data. Please restart the app.",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }

  Future<void> setDailyStepGoal(int goal) async {
    try {
      dailyStepGoal.value = goal;
      await StorageService.saveDailyGoal(goal);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to save step goal",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  Future<void> updateUserData({
    required String newGender,
    required double newHeightCm,
    required double newWeightKg,
  }) async {
    try {
      await StorageService.saveGender(newGender);
      await StorageService.saveHeight(newHeightCm);
      await StorageService.saveWeight(newWeightKg);

      gender.value = newGender;
      heightCm.value = newHeightCm;
      weightKg.value = newWeightKg;

      calculateBMI();

      Get.snackbar(
        "Success",
        "Health data updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to update health data",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  void calculateBMI() {
    if (heightCm.value > 0 && weightKg.value > 0) {
      final heightM = heightCm.value / 100;
      final bmiCalc = weightKg.value / (heightM * heightM);
      bmi.value = double.parse(bmiCalc.toStringAsFixed(1));
    } else {
      bmi.value = 0.0;
    }
  }

  Future<void> updateWeeklyStats({
    required int averageSteps,
    required int bestSteps,
    required int calories,
    required int total,
  }) async {
    try {
      final prefs = await StorageService.getSharedPrefs();

      await prefs.setInt('weeklyAverageSteps', averageSteps);
      await prefs.setInt('bestDaySteps', bestSteps);
      await prefs.setInt('weeklyCalories', calories);
      await prefs.setInt('totalSteps', total);

      weeklyAverageSteps.value = averageSteps;
      bestDaySteps.value = bestSteps;
      weeklyCalories.value = calories;
      totalSteps.value = total;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to update weekly stats",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  Future<void> refreshData() async {
    await _loadUserData();
  }
}
