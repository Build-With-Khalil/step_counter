import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_counter/screens/abs_intermediate_screen.dart';
import 'package:step_counter/screens/lose_weight_beginner.dart';
import '../widgets/select_container.dart';
import 'abs_advance_screen.dart';
import 'abs_beginner_screen.dart';
import 'lose_weight_advance.dart';
import 'lose_weight_intermediate.dart';

class LoseWeightSelector extends StatelessWidget {
  const LoseWeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // get current theme

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
                Get.to(LoseWeightBeginnerScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: "Intermediate",
              duration: "30 mins",
              onTap: () {
                Get.to(LoseWeightIntermediateScreen());
              },
            ),
          ),
          SelectContainer(
            model: SelectContainerModel(
              title: "Advanced",
              duration: "40+ mins",
              onTap: () {
                Get.to(LoseWeightAdvancedScreen());
              },
            ),
          ),

        ],
      ),
    );
  }
}
