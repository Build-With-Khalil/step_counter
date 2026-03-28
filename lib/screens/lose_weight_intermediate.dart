import 'package:flutter/material.dart';
import 'package:step_counter/l10n/app_localizations.dart';
import '../utils/NativeAdWidget.dart';
import '../widgets/abs_icon_widget.dart';
import '../widgets/abs_moves_model.dart';

class LoseWeightIntermediateScreen extends StatelessWidget {
  final List<AbsMoveModel> moves = [
    AbsMoveModel(name: 'INCHWORM', iconPath: 'assets/images/inchw.gif', reps: '12–15 reps'),
    AbsMoveModel(name: 'JUMPING JACKS', iconPath: 'assets/images/jumping_jacks.gif', reps: '45 sec × 2 sets'),
    AbsMoveModel(name: 'SPLIT JUMPS', iconPath: 'assets/images/split_jump_exercise.gif', reps: '16 reps per leg'),
    AbsMoveModel(name: 'SQUAT REACH', iconPath: 'assets/images/squat_reach_exercise.gif', reps: '30 reps'),
  ];

   LoseWeightIntermediateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
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
                      l10n.introduction,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.loseWeightIntermediateIntro,
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
                            Text(l10n.level, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const SizedBox(height: 4),
                            Text(l10n.intermediate, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, color: isDark ? Colors.white70 : Colors.black87)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(l10n.kcal, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const SizedBox(height: 4),
                            Text(l10n.burnt90to100kcal, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, color: isDark ? Colors.white70 : Colors.black87)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(l10n.duration, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const SizedBox(height: 4),
                            Text(l10n.time25to30min, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, color: isDark ? Colors.white70 : Colors.black87)),
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
              child: const NativeAdWidget(),
            ),
          ],
        ),
      ),
    );
  }
}