import 'package:flutter/material.dart';
import '../widgets/abs_icon_widget.dart';
import '../widgets/abs_moves_model.dart';
import '../utils/ad_helper.dart';
import '../widgets/NativeAdWidget.dart';

class AbsBeginnerScreen extends StatelessWidget {
  final List<AbsMoveModel> moves = [
    AbsMoveModel(name: 'T-PLANK', iconPath: 'assets/images/abs_beg1.gif', reps: '5 reps per side × 15 sec hold'),
    AbsMoveModel(name: 'PUSH UP', iconPath: 'assets/images/abs_beg2.gif', reps: '8–10 reps'),
    AbsMoveModel(name: 'REVERSE CRUNCH', iconPath: 'assets/images/abs_beg3.gif', reps: '12–15 reps'),
    AbsMoveModel(name: 'SEATED ABS CIRCLE', iconPath: 'assets/images/abs_beg4.gif', reps: '8 circles clockwise + 8 anticlockwise'),
  ];

  AbsBeginnerScreen({super.key});

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
                background: Image.asset(
                  'assets/images/abss.png',

                ),
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
                    const SizedBox(height: 8),
                    Text(
                      'This beginner abs workout is designed to activate your core, improve stability, and build foundational strength. Perfect for kickstarting your fitness journey.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Level',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Beginner',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 12,
                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Kcal',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Burnt ~45 kcal',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 12,
                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Duration',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Time: 10–15 min',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 12,
                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
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
                              padding: const EdgeInsets.only(top: 20),
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
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: NativeAdWidget(adUnitId: AdHelper.native2AdUnitId),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}