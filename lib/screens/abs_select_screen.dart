import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:step_counter/screens/abs_intermediate_screen.dart';
import '../utils/ad_helper.dart';
import '../widgets/select_container.dart';
import 'abs_advance_screen.dart';
import 'abs_beginner_screen.dart';

class AbsSelectScreen extends StatelessWidget {
  const AbsSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(l10n.absWorkouts),
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
                Get.to(AbsBeginnerScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: l10n.intermediate,
              duration: l10n.duration30mins,
              onTap: () {
                AdManager.onNavigationAction();
                Get.to(AbsIntermediateScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: l10n.advanced,
              duration: l10n.duration40plusMins,
              onTap: () {
                AdManager.onNavigationAction();
                Get.to(AbsAdvanceScreen());
              },
            ),
          ),
          // NativeAdWidget(
          //   adUnitId: AdHelper.native2AdUnitId,
          // ),
        ],
      ),
    );
  }
}
