import 'package:get/get.dart';
import '../services/storage_services.dart';
import 'report_controller.dart';
class DailyStepController extends GetxController {
  final reportController = Get.find<ReportController>();

  late Rx<DateTime> selectedDate;

  final steps = 0.obs;
  final distance = 0.0.obs;
  final calories = 0.0.obs;
  final durationMinutes = 0.obs;

  @override
  void onInit() {
    super.onInit();
    selectedDate = reportController.selectedDate;
    _loadDataForDate(selectedDate.value);
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    reportController.selectDate(date); // sync both controllers
    _loadDataForDate(date);
  }

  void _loadDataForDate(DateTime date) {
    final key = reportController.formatDate(date);
    final stepCount = reportController.dailySteps[key] ?? 0;

    steps.value = stepCount;
    distance.value = (stepCount * 0.762) / 1609.34;
    calories.value = stepCount * 0.04;
    durationMinutes.value = (stepCount / 100).round();
  }
}