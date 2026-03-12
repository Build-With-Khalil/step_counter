import 'dart:async';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import '../services/storage_services.dart';
import '../utils/step_calculator.dart';
import 'package:flutter/material.dart';

class TodayScreenController extends GetxController {
  RxInt totalSteps = 0.obs;
  RxDouble distance = 0.0.obs;
  RxDouble calories = 0.0.obs;
  RxInt durationMinutes = 0.obs;
  RxBool permissionGranted = true.obs;
  RxBool isTracking = true.obs;
  RxMap<String, int> weeklySteps = <String, int>{}.obs;
  RxInt streak = 0.obs;

  int? _initialSteps;
  int _lastValidSteps = 0;
  DateTime _lastStepTime = DateTime.now();
  DateTime _lastSavedDate = DateTime.now();
  DateTime? _initialStepsDate;
  StreamSubscription<StepCount>? _stepSubscription;
  int? lastStepCount;
  Timer? _dayCheckTimer;

  @override
  void onInit() async {
    super.onInit();
    streak.value = await StorageService.getStreak() ?? 1;
    await _checkPermission();
    await _lockInitialStepsIfNeeded();
    await _loadDailySteps();
    await _loadWeeklySteps();
    await _updateStreak();
    _startDayCheckTimer();
    ever(totalSteps, (_) => _updateStats());
  }

  @override
  void onClose() {
    _stepSubscription?.cancel();
    _dayCheckTimer?.cancel();
    StorageService.saveInitialSteps(_initialSteps ?? 0);
    StorageService.saveLastStepCount(lastStepCount ?? 0);
    StorageService.saveLastSavedDate(_lastSavedDate);
    StorageService.saveInitialStepsDate(_initialStepsDate ?? DateTime.now());
    StorageService.saveLastValidSteps(_lastValidSteps);
    StorageService.saveStreak(streak.value);
    super.onClose();
  }

  Future<void> _checkPermission() async {
    final status = await Permission.activityRecognition.request();
    if (status.isGranted) {
      permissionGranted.value = true;
      _initPedometer();
    } else {
      permissionGranted.value = false;
      Get.snackbar(
        "Permission Required",
        "Please allow Physical Activity permission to enable step tracking.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 4),
        icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
      );
    }
  }

  void _initPedometer() {
    _stepSubscription?.cancel();
    _stepSubscription = Pedometer.stepCountStream.listen(_onStepCount, onError: _onStepError);
  }

  Future<void> _onStepCount(StepCount event) async {
    if (!isTracking.value) return;
    final now = DateTime.now();
    lastStepCount = event.steps;
    await StorageService.saveLastStepCount(event.steps);

    if (!_isSameDay(now, _lastSavedDate)) {
      await resetTodaysSteps();
      return;
    }

    if (_initialSteps == null || _initialStepsDate == null || !_isSameDay(now, _initialStepsDate!)) {
      final todayKey = StorageService.formatDate(now);
      final savedTodaySteps = await StorageService.getStepsForDate(todayKey) ?? 0;
      _initialSteps = event.steps - savedTodaySteps;
      _initialStepsDate = now;
      await StorageService.saveInitialSteps(_initialSteps!);
      await StorageService.saveInitialStepsDate(_initialStepsDate!);
    }

    int sessionSteps = event.steps - (_initialSteps ?? 0);
    if (sessionSteps < 0) sessionSteps = 0;

    int stepDelta = sessionSteps - _lastValidSteps;
    Duration timeDelta = now.difference(_lastStepTime);

    if (stepDelta > 100 && timeDelta.inSeconds < 5) {
      return;
    }

    _lastStepTime = now;
    _lastValidSteps = sessionSteps;
    totalSteps.value = sessionSteps;
    await StorageService.saveLastValidSteps(_lastValidSteps);
    updateLiveStats(sessionSteps);
    final key = StorageService.formatDate(now);
    await StorageService.saveStepsForDate(key, sessionSteps);
    await StorageService.saveDailySteps(sessionSteps);
    await StorageService.saveTodayToWeekly(sessionSteps);
    await _updateWeeklySteps(now);
  }

  void _onStepError(error) {
    Get.snackbar(
      "Step Tracking Error",
      "Unable to read step data. Please check your device sensors.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange.shade400,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 4),
      icon: const Icon(Icons.error_outline, color: Colors.white),
    );
  }

  Future<void> _updateStreak() async {
    final now = DateTime.now();
    final lastOpened = await StorageService.getLastOpenedDate();
    int currentStreak = streak.value;

    if (lastOpened == null) {
      currentStreak = 1;
    } else {
      final lastOpenedDate = DateTime(lastOpened.year, lastOpened.month, lastOpened.day);
      final today = DateTime(now.year, now.month, now.day);
      final difference = today.difference(lastOpenedDate).inDays;

      if (difference == 1) {
        currentStreak++;
      } else if (difference > 1) {
        currentStreak = 1;
      }
    }

    streak.value = currentStreak;
    await StorageService.saveStreak(currentStreak);
    await StorageService.saveLastOpenedDate(now);
  }

  Future<void> _lockInitialStepsIfNeeded() async {
    final now = DateTime.now();
    final savedDate = await StorageService.getInitialStepsDate();
    final savedInitial = await StorageService.getInitialSteps();
    final savedLastValidSteps = await StorageService.getLastValidSteps() ?? 0;

    if (savedInitial == null || savedDate == null || !_isSameDay(now, savedDate)) {
      final currentSteps = await StorageService.getLastStepCount() ?? 0;
      _initialSteps = currentSteps;
      _initialStepsDate = now;
      _lastValidSteps = 0;
      await StorageService.saveInitialSteps(_initialSteps!);
      await StorageService.saveInitialStepsDate(_initialStepsDate!);
      await StorageService.saveDailySteps(0);
      await StorageService.saveStepsForDate(StorageService.formatDate(now), 0);
      await StorageService.saveLastValidSteps(0);
      totalSteps.value = 0;
      updateLiveStats(0);
    } else {
      _initialSteps = savedInitial;
      _initialStepsDate = savedDate;
      _lastValidSteps = savedLastValidSteps;
      final todayKey = StorageService.formatDate(now);
      final savedTodaySteps = await StorageService.getStepsForDate(todayKey) ?? savedLastValidSteps;
      totalSteps.value = savedTodaySteps;
      updateLiveStats(totalSteps.value);
    }
  }

  void toggleTracking() async {
    isTracking.value = !isTracking.value;

    if (!isTracking.value) {
      await _stepSubscription?.cancel();
      await StorageService.saveLastValidSteps(_lastValidSteps);
    } else {
      final now = DateTime.now();
      final savedDate = await StorageService.getInitialStepsDate();
      final savedInitial = await StorageService.getInitialSteps();
      final savedLastValidSteps = await StorageService.getLastValidSteps() ?? 0;

      if (savedInitial == null || savedDate == null || !_isSameDay(now, savedDate)) {
        final currentSteps = lastStepCount ?? await StorageService.getLastStepCount() ?? 0;
        _initialSteps = currentSteps;
        _initialStepsDate = now;
        _lastValidSteps = 0;
        await StorageService.saveInitialSteps(_initialSteps!);
        await StorageService.saveInitialStepsDate(_initialStepsDate!);
        await StorageService.saveDailySteps(0);
        await StorageService.saveStepsForDate(StorageService.formatDate(now), 0);
        await StorageService.saveLastValidSteps(0);
        totalSteps.value = 0;
        updateLiveStats(0);
      } else {
        _initialSteps = savedInitial;
        _initialStepsDate = savedDate;
        _lastValidSteps = savedLastValidSteps;
        final todayKey = StorageService.formatDate(now);
        final savedTodaySteps = await StorageService.getStepsForDate(todayKey) ?? savedLastValidSteps;
        totalSteps.value = savedTodaySteps;
        updateLiveStats(totalSteps.value);
      }
      _initPedometer();
    }
  }

  void updateLiveStats(int steps) {
    totalSteps.value = steps;
    distance.value = StepCalculator.toMiles(steps);
    calories.value = StepCalculator.toCalories(steps);
    durationMinutes.value = StepCalculator.toDuration(steps);
    StorageService.saveDailyStats(
      distance: distance.value,
      calories: calories.value,
      duration: durationMinutes.value,
    );
  }

  Future<void> _updateStats() async {
    final steps = totalSteps.value;
    distance.value = StepCalculator.toMiles(steps);
    calories.value = StepCalculator.toCalories(steps);
    durationMinutes.value = StepCalculator.toDuration(steps);
    await StorageService.saveDailyStats(
      distance: distance.value,
      calories: calories.value,
      duration: durationMinutes.value,
    );
  }

  Future<void> _loadDailySteps() async {
    final savedInitial = await StorageService.getInitialSteps();
    final savedLast = await StorageService.getLastStepCount();
    final savedDate = await StorageService.getLastSavedDate();
    final savedInitialDate = await StorageService.getInitialStepsDate();
    final savedLastValidSteps = await StorageService.getLastValidSteps() ?? 0;

    _lastSavedDate = savedDate ?? DateTime.now();
    _initialStepsDate = savedInitialDate ?? DateTime.now();

    if (savedInitial != null && savedLast != null && _isSameDay(DateTime.now(), _lastSavedDate)) {
      _initialSteps = savedInitial;
      lastStepCount = savedLast;
      _lastValidSteps = savedLastValidSteps;
      final todayKey = StorageService.formatDate(DateTime.now());
      final savedTodaySteps = await StorageService.getStepsForDate(todayKey) ?? savedLastValidSteps;
      totalSteps.value = savedTodaySteps;
      updateLiveStats(totalSteps.value);
    } else {
      lastStepCount = savedLast ?? 0;
      _initialSteps = lastStepCount;
      _initialStepsDate = DateTime.now();
      _lastSavedDate = DateTime.now();
      _lastValidSteps = 0;
      await StorageService.saveInitialSteps(_initialSteps!);
      await StorageService.saveInitialStepsDate(_initialStepsDate!);
      await StorageService.saveLastSavedDate(_lastSavedDate);
      await StorageService.saveDailySteps(0);
      await StorageService.saveStepsForDate(StorageService.formatDate(DateTime.now()), 0);
      await StorageService.saveLastValidSteps(0);
      totalSteps.value = 0;
      updateLiveStats(0);
    }
  }

  Future<void> _loadWeeklySteps() async {
    final data = await StorageService.getWeeklySteps();
    weeklySteps.value = data;
    await _adjustWeeklyStepsForCurrentWeek();
  }

  Future<void> _updateWeeklySteps(DateTime now) async {
    await _adjustWeeklyStepsForCurrentWeek();
    final dayLabel = StorageService.getWeekdayLabel(now.weekday);
    weeklySteps[dayLabel] = totalSteps.value;
    await StorageService.saveWeeklySteps(weeklySteps);
  }

  Future<void> _adjustWeeklyStepsForCurrentWeek() async {
    final now = DateTime.now();
    final currentWeekStart = _getWeekStartDate(now);
    final lastSavedDate = await StorageService.getLastSavedDate() ?? DateTime.now();
    final lastWeekStart = _getWeekStartDate(lastSavedDate);

    if (lastWeekStart.isBefore(currentWeekStart)) {
      weeklySteps.clear();
      for (int i = 0; i < 7; i++) {
        final day = currentWeekStart.add(Duration(days: i));
        final dayLabel = StorageService.getWeekdayLabel(day.weekday);
        final dayKey = StorageService.formatDate(day);
        final savedSteps = await StorageService.getStepsForDate(dayKey) ?? 0;
        weeklySteps[dayLabel] = savedSteps;
      }
      await StorageService.saveWeeklySteps(weeklySteps);
    }
  }

  DateTime _getWeekStartDate(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  Future<void> resetTodaysSteps() async {
    final now = DateTime.now();
    final previousDay = now.subtract(Duration(days: 1));
    final previousKey = StorageService.formatDate(previousDay);
    await StorageService.saveStepsForDate(previousKey, _lastValidSteps);

    final currentSteps = lastStepCount ?? await StorageService.getLastStepCount() ?? 0;
    _initialSteps = currentSteps;
    _initialStepsDate = now;
    _lastValidSteps = 0;
    _lastSavedDate = now;
    totalSteps.value = 0;
    distance.value = 0.0;
    calories.value = 0.0;
    durationMinutes.value = 0;

    final key = StorageService.formatDate(now);
    await StorageService.saveInitialSteps(_initialSteps!);
    await StorageService.saveInitialStepsDate(_initialStepsDate!);
    await StorageService.saveLastSavedDate(_lastSavedDate);
    await StorageService.saveDailySteps(0);
    await StorageService.saveStepsForDate(key, 0);
    await StorageService.saveLastValidSteps(0);
    await StorageService.saveDailyStats(distance: 0.0, calories: 0.0, duration: 0);
    await StorageService.saveTodayToWeekly(0);
    await _updateWeeklySteps(now);

    Get.snackbar(
      "Steps Reset",
      "Today's steps have been reset to 0.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade400,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  Future<void> resetAllData() async {
    _initialSteps = null;
    _initialStepsDate = null;
    _lastValidSteps = 0;
    _lastSavedDate = DateTime.now();
    lastStepCount = null;
    totalSteps.value = 0;
    distance.value = 0.0;
    calories.value = 0.0;
    durationMinutes.value = 0;
    weeklySteps.clear();
    streak.value = 0;

    await StorageService.clearAllData();
    await StorageService.saveStreak(0);
    await StorageService.saveLastOpenedDate(DateTime.now());
    await StorageService.saveLastValidSteps(0);
    _stepSubscription?.cancel();
    _initPedometer();

    Get.snackbar(
      "All Data Reset",
      "All step data has been cleared.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade400,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  void checkForNewDay() async {
    final now = DateTime.now();
    if (!_isSameDay(now, _lastSavedDate)) {
      await resetTodaysSteps();
    }
  }

  void _startDayCheckTimer() {
    _dayCheckTimer = Timer.periodic(Duration(minutes: 5), (_) {
      checkForNewDay();
    });
  }
}
