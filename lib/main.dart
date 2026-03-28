import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:step_counter/services/notification_services.dart';
import 'package:step_counter/services/reminder_services.dart';
import 'controllers/achievements_controller.dart';
import 'controllers/goal_controller.dart';
import 'controllers/locale_controller.dart';
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
    AdManager.loadNativeAd();
  } else {
    debugPrint('Main: Running on Web - Skipping MobileAds initialization');
  }
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  FirebaseAnalytics.instance.logAppOpen();
  await NotificationService.init();
  await ReminderService.init();

  // Load persisted locale before the app starts (avoids locale flash)
  final savedLocale = await LocaleController.getSavedLocale();
  Get.put(LocaleController(
      initialLocale: savedLocale ?? const Locale('en')));

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
    final localeController = Get.find<LocaleController>();
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: localeController.currentLocale.value,
          localeResolutionCallback: (locale, supportedLocales) {
            for (final supported in supportedLocales) {
              if (locale?.languageCode == supported.languageCode) {
                return supported;
              }
            }
            return const Locale('en');
          },
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
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
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: theme.brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.white,
      title: Row(
        children: [
          const Icon(Icons.notifications_active, color: Colors.blue),
          const SizedBox(width: 8),
          Text(l10n.permissionsRequired, style: theme.textTheme.titleMedium),
        ],
      ),
      content: Text(
        l10n.permissionsDialogContent,
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(l10n.notNow, style: const TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () async {
            Get.back();
            final activity = await Permission.activityRecognition.request();
            final notify = await Permission.notification.request();
            if (!activity.isGranted || !notify.isGranted) {
              Get.snackbar(
                l10n.permissions,
                l10n.permissionsNotGranted,
                snackPosition: SnackPosition.BOTTOM,
              );
            } else {
              final quote = MotivationService.getWelcomeQuote();
              await NotificationService.showWelcomeNotification(quote);
            }
          },
          child: Text(l10n.allow),
        ),
      ],
    );
  }
}
