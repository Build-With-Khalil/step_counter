import 'package:flutter/material.dart';
import '../widgets/abs_icon_widget.dart';
import '../widgets/abs_moves_model.dart';
import '../utils/ad_helper.dart';
import '../widgets/NativeAdWidget.dart';

class LoseWeightIntermediateScreen extends StatelessWidget {
  final List<AbsMoveModel> moves = [
    AbsMoveModel(name: 'INCHWORM', iconPath: 'assets/images/inchw.gif', reps: '12–15 reps'),
    AbsMoveModel(name: 'JUMPING JACKS', iconPath: 'assets/images/jumping_jacks.gif', reps: '45 sec × 2 sets'),
    AbsMoveModel(name: 'SPLIT JUMPS', iconPath: 'assets/images/split_jump_exercise.gif', reps: '16 reps per leg'),
    AbsMoveModel(name: 'SQUAT REACH', iconPath: 'assets/images/squat_reach_exercise.gif', reps: '30 reps'),
  ];

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
                background: Image.asset('assets/images/loss.png'),
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
                      'This intermediate fat-burning workout intensifies each move to challenge your stamina and accelerate fat loss. No equipment needed—just commitment.',
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
                            Text('Level', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const SizedBox(height: 4),
                            Text('Intermediate', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, color: isDark ? Colors.white70 : Colors.black87)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Kcal', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const SizedBox(height: 4),
                            Text('Burnt ~90-100 kcal', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, color: isDark ? Colors.white70 : Colors.black87)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Duration', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const SizedBox(height: 4),
                            Text('Time: 25–30 min', style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, color: isDark ? Colors.white70 : Colors.black87)),
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