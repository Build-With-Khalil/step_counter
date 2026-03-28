import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(l10n.loseWeight),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SelectContainer(
            model: SelectContainerModel(
              title: l10n.beginner,
              duration: l10n.duration15mins,
              onTap: () {
                AdManager.onNavigationAction();
                Get.to(LoseWeightBeginnerScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: l10n.intermediate,
              duration: l10n.duration30mins,
              onTap: () {
                AdManager.onNavigationAction();
                Get.to(LoseWeightIntermediateScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: l10n.advanced,
              duration: l10n.duration40plusMins,
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
