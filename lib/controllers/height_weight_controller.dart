import 'package:get/get.dart';
import '../services/storage_services.dart';

class HeightWeightController extends GetxController {
  RxDouble heightCm = RxDouble(0.0);
  RxDouble weightKg = RxDouble(0.0);

  void initialize(String? gender) {
    if (gender == "male") {
      heightCm.value = 175.0;
      weightKg.value = 70.0;
    } else if (gender == "female") {
      heightCm.value = 160.0;
      weightKg.value = 55.0;
    }

    StorageService.saveGender(gender ?? '');
    StorageService.saveHeight(heightCm.value);
    StorageService.saveWeight(weightKg.value);
  }

  void updateHeight(double newHeightCm) {
    heightCm.value = newHeightCm.clamp(140.0, 200.0);
    StorageService.saveHeight(heightCm.value);
  }

  void updateWeight(double newWeightKg) {
    weightKg.value = newWeightKg.clamp(40.0, 100.0);
    StorageService.saveWeight(weightKg.value);
  }

  Future<void> loadSavedData() async {
    final savedGender = await StorageService.getGender();
    final savedHeight = await StorageService.getHeight();
    final savedWeight = await StorageService.getWeight();

    if (savedGender != null) {
      initialize(savedGender);
    }
    if (savedHeight != null) {
      heightCm.value = savedHeight;
    }
    if (savedWeight != null) {
      weightKg.value = savedWeight;
    }
  }
}