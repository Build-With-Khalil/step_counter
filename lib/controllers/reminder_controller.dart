import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/reminder_services.dart';

class ReminderController extends GetxController {
  final RxBool isDailyReminderEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadReminderState();
  }

  Future<void> loadReminderState() async {
    final prefs = await SharedPreferences.getInstance();
    isDailyReminderEnabled.value = prefs.getBool('daily_reminder_enabled') ?? true;
    if (isDailyReminderEnabled.value) {
      ReminderService.startDailyReminder();
    }
  }

  Future<void> toggleDailyReminder(bool value) async {
    isDailyReminderEnabled.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('daily_reminder_enabled', value);
    if (value) {
      ReminderService.startDailyReminder();
    } else {
      ReminderService.stopDailyReminder();
    }
  }
}