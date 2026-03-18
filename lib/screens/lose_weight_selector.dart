import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_counter/screens/lose_weight_beginner.dart';

import '../utils/ad_helper.dart';
import '../widgets/NativeAdWidget.dart';
import '../widgets/select_container.dart';
import 'lose_weight_advance.dart';
import 'lose_weight_intermediate.dart';

class LoseWeightSelector extends StatelessWidget {
  const LoseWeightSelector({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Lose Weight"),
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
                Get.to(LoseWeightBeginnerScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: "Intermediate",
              duration: "30 mins",
              onTap: () {
                AdManager.onNavigationAction();
                Get.to(LoseWeightIntermediateScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: "Advanced",
              duration: "40+ mins",
              onTap: () {
                AdManager.onNavigationAction();
                Get.to(LoseWeightAdvancedScreen());
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
