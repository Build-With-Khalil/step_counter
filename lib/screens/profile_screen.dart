import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:step_counter/screens/privacy_policy.dart';
import 'package:step_counter/utils/ad_helper.dart';

import '../controllers/profile_controller.dart';
import '../controllers/theme_controller.dart';
import '../services/storage_services.dart';
import '../utils/NativeAdWidget.dart';
import '../widgets/setting_tile.dart';
import 'faqs.dart';
import 'instruction_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<String> _loadPersonalInfo(AppLocalizations l10n) async {
    try {
      final gender = await StorageService.getGender() ?? l10n.notSet;
      final height = await StorageService.getHeight();
      final weight = await StorageService.getWeight();

      final heightStr = height != null ? "${height.toStringAsFixed(1)} cm" : l10n.notSet;
      final weightStr = weight != null ? "${weight.toStringAsFixed(1)} kg" : l10n.notSet;

      return "$gender • $heightStr • $weightStr";
    } catch (e) {
      return l10n.loading;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
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
                          l10n.ageDisplay(profileController.age.value),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Nata',
                          ),
                        ),
                        const SizedBox(height: 10),
                        FutureBuilder<String>(
                          future: _loadPersonalInfo(l10n),
                          builder: (context, snapshot) {
                            final subtitle = snapshot.data ?? l10n.loading;
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
                          child: Text(l10n.editProfile),
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
                        title: Text(l10n.theme),
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
                        title: l10n.instruction,
                        subtitle: l10n.instructionSubtitle,
                        onTap: () => Get.to(() => InstructionScreen()),
                      ),
                      const Divider(),
                      SettingsTile(
                        imagePath: 'assets/icons/share.png',
                        title: l10n.shareApp,
                        subtitle: l10n.shareAppSubtitle,
                        onTap: () => _shareApp(context, l10n),
                      ),
                      const Divider(),
                      SettingsTile(
                        imagePath: 'assets/icons/faq.png',
                        title: l10n.faqs,
                        subtitle: l10n.faqsSubtitle,
                        onTap: () { AdManager.onNavigationAction(); Get.to(() => FaqsScreen()); },
                      ),
                      const Divider(),
                      SettingsTile(
                        imagePath: 'assets/icons/privacy_policy.png',
                        title: l10n.privacyPolicy,
                        subtitle: l10n.privacyPolicySubtitle,
                        onTap: () { AdManager.onNavigationAction(); Get.to(() => PrivacyScreen()); },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const NativeAdWidget(),
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

  Future<void> _shareApp(BuildContext context, AppLocalizations l10n) async {
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
          SnackBar(content: Text(l10n.appLinkCopied)),
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
    final l10n = AppLocalizations.of(context)!;
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
              title: Text(l10n.editProfile),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: l10n.nameLabel,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        labelText: l10n.ageLabel,
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
                  child: Text(l10n.cancel, style: const TextStyle(color: Colors.grey)),
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
                        l10n.profileUpdated,
                        l10n.profileSavedMessage,
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
                        l10n.invalidInput,
                        l10n.invalidInputMessage,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red.shade400,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                        duration: const Duration(seconds: 3),
                      );
                    }
                  },
                  child: Text(l10n.save),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
