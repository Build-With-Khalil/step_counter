import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:step_counter/services/notification_services.dart';
import 'package:step_counter/services/reminder_services.dart';
import 'controllers/achievements_controller.dart';
import 'controllers/goal_controller.dart';
import 'controllers/profile_controller.dart';
import 'controllers/report_controller.dart';
import 'controllers/theme_controller.dart';
import 'controllers/todayscreen_controllr.dart';
import 'controllers/reminder_controller.dart';
import 'screens/splash_screen.dart';
import 'widgets/motivation_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'utils/ad_helper.dart';
import 'widgets/app_open_ad_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!kIsWeb) {
    await MobileAds.instance.initialize();
debugPrint('Main: MobileAds initialized');
    AdManager.loadOtherAds();
  } else {
    debugPrint('Main: Running on Web - Skipping MobileAds initialization');
  }
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  FirebaseAnalytics.instance.logAppOpen();
  await NotificationService.init();
  await ReminderService.init();

  // Register all controllers once here
  Get.put(ThemeController());
  Get.put(TodayScreenController(), permanent: true);
  Get.put(ReportController(), permanent: true);
  Get.put(GoalController());
  Get.put(AchievementsController(), permanent: true);
  Get.put(ReminderController(), permanent: true);
  Get.put(ProfileController());
  Get.put(PermissionController());
// Load app open ad in background (non-blocking for faster startup)
  if (!kIsWeb) {
    AppOpenAdWidget.loadAndShowAppOpenAd().catchError((e) {
      debugPrint('Error showing App Open Ad: $e');
    });
  }
  // WidgetsBinding.instance.addObserver(
  //   LifecycleEventHandler(
  //     resumeCallBack: () async {
  //       Get.find<ReportController>().refreshFromStorage();
  //       AdManager.resumeAds();
  //     },
  //     pauseCallBack: () async {
  //       AdManager.pauseAds();
  //     },
  //   ),
  // );

  runApp(const MyApp());
}

// Handles permission requests via GetX — no BuildContext needed
class PermissionController extends GetxController {
  Future<void> checkPermissions() async {
    final activityStatus = await Permission.activityRecognition.status;
    final notificationStatus = await Permission.notification.status;

    bool needsDialog = false;

    if (!activityStatus.isGranted) {
      final result = await Permission.activityRecognition.request();
      if (!result.isGranted) needsDialog = true;
    }

    if (!notificationStatus.isGranted) {
      final result = await Permission.notification.request();
      if (!result.isGranted) needsDialog = true;
    }

    if (needsDialog) {
      Get.dialog(const _PermissionDialog(), barrierDismissible: false);
    } else {
      final quote = MotivationService.getWelcomeQuote();
      await NotificationService.showWelcomeNotification(quote);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.blue,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.black, fontFamily: 'Nata'),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            primaryColor: Colors.blue,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white, fontFamily: 'Nata'),
            ),
          ),
          themeMode: themeController.themeMode,
          navigatorObservers: [],
          home: const SplashScreen(),
        ));
  }
}

class _PermissionDialog extends StatelessWidget {
  const _PermissionDialog();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: theme.brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.white,
      title: Row(
        children: [
          const Icon(Icons.notifications_active, color: Colors.blue),
          const SizedBox(width: 8),
          Text("Permissions Required", style: theme.textTheme.titleMedium),
        ],
      ),
      content: Text(
        "To track your steps and send motivational notifications, please allow Activity and Notification permissions.",
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text("Not Now", style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () async {
            Get.back();
            final activity = await Permission.activityRecognition.request();
            final notify = await Permission.notification.request();
            if (!activity.isGranted || !notify.isGranted) {
              Get.snackbar(
                'Permissions',
                'Permissions not granted. Some features may not work.',
                snackPosition: SnackPosition.BOTTOM,
              );
            } else {
              final quote = MotivationService.getWelcomeQuote();
              await NotificationService.showWelcomeNotification(quote);
            }
          },
          child: const Text("Allow"),
        ),
      ],
    );
  }
}
