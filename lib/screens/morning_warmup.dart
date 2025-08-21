import 'package:flutter/material.dart';
import '../widgets/abs_icon_widget.dart';
import '../widgets/abs_moves_model.dart';

class MorningWarmup extends StatelessWidget {
  final List<AbsMoveModel> moves = [
    AbsMoveModel(
      name: 'WALK',
      iconPath: 'assets/images/morning_walk.gif',
      reps: 'Walk lightly for 10 minutes to warm up your body and improve blood flow.',
    ),
    AbsMoveModel(
      name: 'JUMPING JACKS',
      iconPath: 'assets/images/jumping_jacks.gif',
      reps: 'Do 20 jumping jacks to boost heart rate and energy.',
    ),
    AbsMoveModel(
      name: 'PUSH-UPS',
      iconPath: 'assets/images/abs_beg2.gif',
      reps: 'Perform 10 push-ups to activate chest, arms, and core.',
    ),
    AbsMoveModel(
      name: 'SHOULDER STRETCH',
      iconPath: 'assets/images/shoulderr.gif',
      reps: 'Hold each side for 20 seconds to release tension in shoulders.',
    ),
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
                background: Image.asset('assets/images/morning.png'),
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
"This Morning Warm-up has walking, jumping jacks, push-ups, and shoulder stretches to boost circulation, loosen stiffness, and energize you for the day.",

                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Kcal',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : Colors.black),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Burnt ~60–80 kcal',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 12,
                                  color:
                                  isDark ? Colors.white70 : Colors.black87),
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
                                  color: isDark ? Colors.white : Colors.black),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Time: 10–15 min',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 12,
                                  color:
                                  isDark ? Colors.white70 : Colors.black87),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                                      color:
                                      isDark ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    move.reps,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: isDark
                                          ? Colors.white70
                                          : Colors.black87,
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
          ],
        ),
      ),
    );
  }
}
