import 'package:flutter/material.dart';
import '../widgets/abs_icon_widget.dart';
import '../widgets/abs_moves_model.dart';
import '../utils/ad_helper.dart';
import '../widgets/NativeAdWidget.dart';

class ReduceStress extends StatelessWidget {
  final List<AbsMoveModel> moves = [
    AbsMoveModel(name: 'YOGA', iconPath: 'assets/images/yoga.gif', reps: 'Practice deep breathing and light stretches for 10 minutes to calm your mind.'),
    AbsMoveModel(name: 'MORNING WALK', iconPath: 'assets/images/morning_walk.gif', reps: 'A 10-minute morning walk to refresh your body and reduce stress.'),
    AbsMoveModel(name: 'DIET', iconPath: 'assets/images/diet.gif', reps: 'Eat balanced meals, cut sugar, avoid oily foods, and add more fruits & veggies for a lighter, healthier body.'),
  ];

   ReduceStress({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              backgroundColor: theme.scaffoldBackgroundColor,
              elevation: 4,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/smile.png'),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Introduction',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
"In this Reduce Stress workout, you will practice Yoga, go for a Morning Walk, and follow a clean Diet. Yoga helps calm your mind and body, walking refreshes and boosts mood, and a balanced diet keeps you light, healthy, and stress-free.",

                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Column(
                          children: [
                            Text('Kcal', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const SizedBox(height: 4),
                            Text('Burnt ~70 kcal', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, color: isDark ? Colors.white70 : Colors.black87)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Duration', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const SizedBox(height: 4),
                            Text('Time: 20–30 min', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, color: isDark ? Colors.white70 : Colors.black87)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final move = moves[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AbsIconWidget(path: move.iconPath, size: 60),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    move.name,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: isDark ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    move.reps,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: isDark ? Colors.white70 : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: moves.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: NativeAdWidget(adUnitId: AdHelper.native2AdUnitId),
              ),
            ),
          ],
        ),
      ),
    );
  }
}