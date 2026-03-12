import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final RxString name = 'User'.obs;
  final RxInt age = 20.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      name.value = prefs.getString('profile_name') ?? 'User';
      age.value = prefs.getInt('profile_age') ?? 20;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load profile data',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveProfile(String newName, int newAge) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_name', newName);
      await prefs.setInt('profile_age', newAge);

      name.value = newName;
      age.value = newAge;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save profile',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  Future<void> refreshProfile() async {
    await loadProfile();
  }
}
