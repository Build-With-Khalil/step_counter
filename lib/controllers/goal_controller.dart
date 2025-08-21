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

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
    // Bind heightCm and weightKg changes to recalculate BMI
    everAll([heightCm, weightKg], (_) => calculateBMI());
  }

  @override
  void onReady() {
    super.onReady();
    final todayController = Get.find<TodayScreenController>();
    ever(todayController.totalSteps, (value) {
      totalSteps.value = value;
    });
  }

  Future<void> _loadUserData() async {
    try {
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
      print('Loaded user data: gender=${gender.value}, height=${heightCm.value}, weight=${weightKg.value}, bmi=${bmi.value}');
    } catch (e) {
      print('Error loading user data: $e');
      isDataLoaded.value = true; // Set to true to avoid infinite loading
    }
  }

  Future<void> setDailyStepGoal(int goal) async {
    dailyStepGoal.value = goal;
    await StorageService.saveDailyGoal(goal);
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
      print('Updated user data: gender=$newGender, height=$newHeightCm, weight=$newWeightKg, bmi=${bmi.value}');
    } catch (e) {
      print('Error updating user data: $e');
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
    print('Calculated BMI: ${bmi.value}');
  }

  Future<void> _loadWeeklyStats() async {
    weeklyAverageSteps.value = 0;
    bestDaySteps.value = 0;
    weeklyCalories.value = 0;
  }

  Future<void> updateWeeklyStats({
    required int averageSteps,
    required int bestSteps,
    required int calories,
    required int total,
  }) async {
    final prefs = await StorageService.getSharedPrefs();

    await prefs.setInt('weeklyAverageSteps', averageSteps);
    await prefs.setInt('bestDaySteps', bestSteps);
    await prefs.setInt('weeklyCalories', calories);
    await prefs.setInt('totalSteps', total);

    weeklyAverageSteps.value = averageSteps;
    bestDaySteps.value = bestSteps;
    weeklyCalories.value = calories;
    totalSteps.value = total;
  }
}