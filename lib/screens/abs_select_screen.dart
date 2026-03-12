import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:step_counter/screens/abs_intermediate_screen.dart';
import '../utils/ad_helper.dart';
import '../widgets/NativeAdWidget.dart';
import '../widgets/select_container.dart';
import 'abs_advance_screen.dart';
import 'abs_beginner_screen.dart';

class AbsSelectScreen extends StatelessWidget {
  const AbsSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Abs Workouts"),
        centerTitle: true,
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SelectContainer(
            model: SelectContainerModel(
              title: "Beginner",
              duration: "15 mins",
              onTap: () {
                AdManager.onNavigationAction();
                Get.to(AbsBeginnerScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: "Intermediate",
              duration: "30 mins",
              onTap: () {
                AdManager.onNavigationAction();
                Get.to(AbsIntermediateScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: "Advanced",
              duration: "40+ mins",
              onTap: () {
                AdManager.onNavigationAction();
                Get.to(AbsAdvanceScreen());
              },
            ),
          ),
          NativeAdWidget(
            adUnitId: AdHelper.nativeAdUnitId,
          ),
        ],
      ),
    );
  }
}
