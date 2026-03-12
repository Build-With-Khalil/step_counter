import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:step_counter/screens/privacy_policy.dart';
import 'package:step_counter/utils/ad_helper.dart';
import '../controllers/profile_controller.dart';
import '../widgets/NativeAdWidget.dart';
import '../controllers/theme_controller.dart';
import '../services/storage_services.dart';
import '../widgets/setting_tile.dart';
import 'faqs.dart';
import 'instruction_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<String> _loadPersonalInfo() async {
    try {
      final gender = await StorageService.getGender() ?? 'Not set';
      final height = await StorageService.getHeight();
      final weight = await StorageService.getWeight();

      final heightStr = height != null ? "${height.toStringAsFixed(1)} cm" : "Not set";
      final weightStr = weight != null ? "${weight.toStringAsFixed(1)} kg" : "Not set";

      return "$gender • $heightStr • $weightStr";
    } catch (e) {
      return "Loading...";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final themeController = Get.find<ThemeController>();
    final profileController = Get.find<ProfileController>();

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
                        GestureDetector(
                          onTap: () => _checkAndShowEditProfileDialog(context, profileController),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.person, size: 60, color: Colors.white),

                              )
                            ],
                          ),
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
                      Obx(() => ListTile(
                        leading: Image.asset('assets/icons/light.png', width: 30),
                        title: const Text('Theme'),
                        trailing: IconButton(
                          icon: Icon(
                            themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                            color: themeController.isDarkMode.value ? Colors.yellow : Colors.black,
                          ),
                          onPressed: () => themeController.toggleTheme(),
                        ),
                      )),
                      const Divider(),
                      SettingsTile(
                        imagePath: 'assets/icons/guidance.png',
                        title: 'Instruction',
                        subtitle: 'Guidance for using app',
                        onTap: () => Get.to(() => InstructionScreen()),
                      ),
                      const Divider(),
                      SettingsTile(
                        imagePath: 'assets/icons/share.png',
                        title: 'Share App',
                        subtitle: 'Share Our App With Friends',
                        onTap: () => _shareApp(context),
                      ),
                      const Divider(),
                      SettingsTile(
                        imagePath: 'assets/icons/faq.png',
                        title: 'FAQs',
                        subtitle: 'Frequently Asked Questions',
                        onTap: () { AdManager.onNavigationAction(); Get.to(() => FaqsScreen()); },
                      ),
                      const Divider(),
                      SettingsTile(
                        imagePath: 'assets/icons/privacy_policy.png',
                        title: 'Privacy Policy',
                        subtitle: "App's Privacy Policy",
                        onTap: () { AdManager.onNavigationAction(); Get.to(() => PrivacyScreen()); },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                NativeAdWidget(
                  adUnitId: AdHelper.native2AdUnitId,
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

  Future<void> _shareApp(BuildContext context) async {
    const message = '''
Check out Pedometer – Walk & Track by NSB Solutions Pvt Ltd! 🚶‍♂️✨

🔗 Download now:
https://play.google.com/store/apps/details?id=com.nsb.pedometer
''';

    try {
      await Share.share(
        message,
        subject: "Pedometer – Walk & Track",
      );
    } catch (e) {
      await Clipboard.setData(const ClipboardData(text: message));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('App link copied to clipboard')),
        );
      }
    }
  }

  // === No permission gate needed; just show the dialog ===
  Future<void> _checkAndShowEditProfileDialog(BuildContext context, ProfileController controller) async {
    await _showEditProfileDialog(context, controller);
  }

  Future<void> _showEditProfileDialog(BuildContext context, ProfileController controller) async {
    final theme = Theme.of(context);
    final nameController = TextEditingController(text: controller.name.value);
    final ageController = TextEditingController(text: controller.age.value.toString());

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (statefulContext, setState) {
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
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final age = int.tryParse(ageController.text) ?? 0;
                    if (name.isNotEmpty && age > 0) {
                      await controller.saveProfile(name, age);
                      if (dialogContext.mounted) {
                        Navigator.of(dialogContext).pop();
                      }
                      Get.snackbar(
                        'Profile Updated',
                        'Your profile has been saved successfully.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green.shade400,
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
      },
    );
  }
}
