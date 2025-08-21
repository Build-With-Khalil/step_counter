import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:step_counter/services/notification_services.dart';
import 'package:step_counter/services/reminder_services.dart';
import 'package:step_counter/utils/lifecycle_handler.dart';
import 'controllers/achievements_controller.dart';
import 'controllers/goal_controller.dart';
import 'controllers/report_controller.dart';
import 'controllers/theme_controller.dart';
import 'controllers/todayscreen_controllr.dart';
import 'controllers/reminder_controller.dart';
import 'screens/splash_screen.dart';
import 'screens/homepage.dart';

import 'widgets/motivation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  await ReminderService.init();

  Get.put(TodayScreenController(), permanent: true);
  Get.put(ReportController(), permanent: true);
  Get.put(GoalController());
  Get.put(AchievementsController(), permanent: true);
  Get.put(ReminderController(), permanent: true);

  WidgetsBinding.instance.addObserver(
    LifecycleEventHandler(
      resumeCallBack: () async {
        Get.find<ReportController>().refreshFromStorage();
      },
    ),
  );

  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}

class MyApp extends StatefulWidget {
  final bool isFirstLaunch;

  const MyApp({super.key, required this.isFirstLaunch});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkPermissions(context);
    });
  }

  Future<void> _checkPermissions(BuildContext context) async {
    final activityStatus = await Permission.activityRecognition.status;
    final notificationStatus = await Permission.notification.status;

    bool showDialogNeeded = false;

    if (!activityStatus.isGranted) {
      final result = await Permission.activityRecognition.request();
      if (!result.isGranted) showDialogNeeded = true;
    }

    if (!notificationStatus.isGranted) {
      final result = await Permission.notification.request();
      if (!result.isGranted) showDialogNeeded = true;
    }

    if (showDialogNeeded) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => _PermissionDialog(),
      );
    } else {
      final quote = MotivationService.getWelcomeQuote();
      await NotificationService.showWelcomeNotification(quote);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
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
        home: widget.isFirstLaunch ? SplashScreen() : const HomePage(),
      );
    });
  }
}

class _PermissionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor:
      theme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
      title: Row(
        children: [
          Icon(Icons.notifications_active, color: Colors.blue),
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
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Not Now", style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pop();
            final activity = await Permission.activityRecognition.request();
            final notify = await Permission.notification.request();

            if (!activity.isGranted || !notify.isGranted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        "Permissions not granted. Some features may not work.")),
              );
            } else {
              final quote = MotivationService.getWelcomeQuote();
              await NotificationService.showWelcomeNotification(quote);
            }
          },
          child: Text("Allow"),
        ),
      ],
    );
  }
}