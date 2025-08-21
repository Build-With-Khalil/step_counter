import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../controllers/report_controller.dart';
import '../controllers/todayscreen_controllr.dart';
import '../controllers/theme_controller.dart';
import '../services/storage_services.dart';
import '../widgets/setting_tile.dart';
import 'instruction_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<String> _loadPersonalInfo() async {
    final gender = await StorageService.getGender() ?? 'Not set';
    final height = await StorageService.getHeight();
    final weight = await StorageService.getWeight();

    final heightStr = height != null ? "${height.toStringAsFixed(1)} cm" : "Height not set";
    final weightStr = weight != null ? "${weight.toStringAsFixed(1)} kg" : "Weight not set";

    return "$gender • $heightStr • $weightStr";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final themeController = Get.find<ThemeController>();
    final profileController = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _sectionContainer(
                  isDark,
                  child: Obx(() {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                          foregroundImage: profileController.profilePicture.value.isNotEmpty
                              ? FileImage(File(profileController.profilePicture.value))
                              : null,
                          child: profileController.profilePicture.value.isEmpty
                              ? const Icon(Icons.person, size: 60, color: Colors.white)
                              : null,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          profileController.name.value,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nata',
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Age: ${profileController.age.value}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Nata',
                          ),
                        ),
                        const SizedBox(height: 10),
                        FutureBuilder<String>(
                          future: _loadPersonalInfo(),
                          builder: (context, snapshot) {
                            final subtitle = snapshot.data ?? 'Loading...';
                            return Text(
                              subtitle,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontFamily: 'Nata',
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () => _checkAndShowEditProfileDialog(context, profileController),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Edit Profile'),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 20),
                // Settings Section
                _sectionContainer(
                  isDark,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.dark_mode, color: theme.colorScheme.primary),
                        title: const Text('Theme'),
                        trailing: IconButton(
                          icon: Icon(
                            themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                            color: themeController.isDarkMode.value ? Colors.yellow : Colors.black,
                          ),
                          onPressed: () => themeController.toggleTheme(),
                        ),
                      ),
                      const Divider(),
                      SettingsTile(
                        icon: Icons.help_outline,
                        title: 'Instruction',
                        subtitle: 'Guidance for using app',
                        onTap: () {
                          Get.to(InstructionScreen());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionContainer(bool isDark, {required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }

  Future<void> _checkAndShowEditProfileDialog(BuildContext context, ProfileController controller) async {
    // Use Permission.photos for Android 13+ (API 33+), fallback to Permission.storage for older versions
    final permission = Platform.isAndroid ? Permission.photos : Permission.storage;

    final permissionStatus = await permission.status;
    if (!permissionStatus.isGranted) {
      if (permissionStatus.isPermanentlyDenied) {
        Get.snackbar(
          'Permission Denied',
          'Photo access permission is permanently denied. Please enable it in app settings.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade400,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
          duration: const Duration(seconds: 3),
          mainButton: TextButton(
            onPressed: () => openAppSettings(),
            child: const Text('Open Settings', style: TextStyle(color: Colors.white)),
          ),
        );
        return;
      }

      final newStatus = await permission.request();
      if (!newStatus.isGranted) {
        Get.snackbar(
          'Permission Denied',
          'Photo access permission is required to select a profile picture.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade400,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
          duration: const Duration(seconds: 3),
        );
        return;
      }
    }
    await _showEditProfileDialog(context, controller);
  }

  Future<void> _showEditProfileDialog(BuildContext context, ProfileController controller) async {
    final theme = Theme.of(context);
    final nameController = TextEditingController(text: controller.name.value);
    final ageController = TextEditingController(text: controller.age.value.toString());
    String? selectedImagePath = controller.profilePicture.value;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: theme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                      type: FileType.image,
                      allowMultiple: false,
                    );
                    if (result != null && result.files.single.path != null) {
                      selectedImagePath = result.files.single.path!;
                      Get.snackbar(
                        'Image Selected',
                        'Profile picture updated.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.blue.shade400,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                        duration: const Duration(seconds: 2),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Pick Profile Picture'),
                ),
                if (selectedImagePath!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(selectedImagePath!),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final age = int.tryParse(ageController.text) ?? 0;
                if (name.isNotEmpty && age > 0) {
                  await controller.saveProfile(name, age, selectedImagePath ?? '');
                  Navigator.of(context).pop();
                  Get.snackbar(
                    'Profile Updated',
                    'Your profile has been saved successfully.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.blue.shade400,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                    duration: const Duration(seconds: 3),
                    icon: const Icon(Icons.check, color: Colors.white),
                  );
                } else {
                  Get.snackbar(
                    'Invalid Input',
                    'Please enter a valid name and age.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red.shade400,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                    duration: const Duration(seconds: 3),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class ProfileController extends GetxController {
  final RxString name = 'User'.obs;
  final RxInt age = 30.obs;
  final RxString profilePicture = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('profile_name') ?? 'User';
    age.value = prefs.getInt('profile_age') ?? 30;
    profilePicture.value = prefs.getString('profile_picture') ?? '';
  }

  Future<void> saveProfile(String newName, int newAge, String newPicture) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_name', newName);
    await prefs.setInt('profile_age', newAge);
    await prefs.setString('profile_picture', newPicture);
    name.value = newName;
    age.value = newAge;
    profilePicture.value = newPicture;
  }
}