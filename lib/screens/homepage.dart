import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:step_counter/controllers/navigation_controller.dart';
import 'package:step_counter/screens/profile_screen.dart';
import 'package:step_counter/screens/report_screen.dart';
import 'package:step_counter/screens/today_screen.dart';
import 'package:step_counter/utils/ad_helper.dart';
import '../widgets/NativeAdWidget.dart';
import 'goal_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Widget> _pages = [
    TodayPage(),
    ReportPage(),
    HealthScreen(),
    ProfilePage(),
  ];

  static const List<IconData> _icons = [
    Icons.home_rounded,
    Icons.bar_chart_rounded,
    Icons.monitor_heart_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.put(NavigationController());
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Obx(() => IndexedStack(
        index: navController.selectedIndex,
        children: _pages,
      )),
      bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        tabBuilder: (int index, bool isActive) {

          return Container(
            decoration: BoxDecoration(
              color: isActive
                  ? theme.primaryColor.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Icon(
              _icons[index],
              size: isActive ? 28 : 24,
              color: isActive ? theme.primaryColor : Colors.grey.shade400,
            ),
          );
        },
        activeIndex: navController.selectedIndex,
        gapLocation: GapLocation.none,
        onTap: (index) => navController.changeTab(index),
        backgroundColor: theme.scaffoldBackgroundColor,
        splashColor: theme.primaryColor.withOpacity(0.2),
        splashSpeedInMilliseconds: 200,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        elevation: 8,
      )),
    );
  }
}
