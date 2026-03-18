import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';
import '../widgets/NativeAdWidgetForMedium.dart';

// ─── Colors ──────────────────────────────────────────────────────────────────
const _bg = Color(0xFF0D1B2A);
const _card = Color(0xFF132030);
const _green = Color(0xFF85E82A);
const _teal = Color(0xFF00D4B8);

// ─── Screen ──────────────────────────────────────────────────────────────────
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.isRegistered<OnboardingController>()
        ? Get.find<OnboardingController>()
        : Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Scrollable pages (title + subtitle + content only)
                Expanded(
                  child: PageView(
                    controller: ctrl.pageController,
                    onPageChanged: ctrl.onPageChanged,
                    children: [
                      _PageShell(
                        title: 'Every Step Counts',
                        subtitle: 'Track your daily movement in real time.',
                        content: const _StepCircleWidget(),
                      ),

                      _PageShell(
                        title: 'Visualize Progress',
                        subtitle: 'See your consistency at a glance.',
                        content: const _CalendarWidget(),
                      ),
                      _PageShell(
                        title: 'Your Fitness Hub',
                        subtitle: 'Everything you need to stay fit.',
                        content: const _FitnessHubWidget(),
                      ),
                      _PageShell(
                        title: 'Set Your Goal',
                        subtitle: 'Customize your daily target.',
                        content: _GoalSliderWidget(ctrl: ctrl),
                      ),
                    ],
                  ),
                ),

                // ── Fixed: dot indicators ──
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                        (i) => _Dot(active: i == ctrl.currentPage.value),
                  ),
                )),

                const SizedBox(height: 10),

                //Native ad on first on boarding page
                Obx(() {
                  if (ctrl.currentPage.value == 0 || ctrl.currentPage.value == 3 ) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: NativeAdWidgetForMedium(adUnitId: 'ca-app-pub-8523132132584450/4352310252',),
                    );
                  }
                  return const SizedBox(height: 10);
                }),


                // ── Fixed: action button (label + color change reactively) ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: Obx(() {
                      final page = ctrl.currentPage.value;
                      final isGreen = page == 0 || page == 3;
                      final label = page == 0
                          ? 'Get Started'
                          : page == 3
                          ? 'Start Journey  →'
                          : 'Next Step';
                      final onTap =
                      page == 3 ? ctrl.finishOnboarding : ctrl.nextPage;
                      return isGreen
                          ? _GreenButton(label: label, onTap: onTap)
                          : _DarkButton(label: label, onTap: onTap);
                    }),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),

            // ── Skip button overlay (top-right, pages 0-2 only) ──
            Obx(() => ctrl.currentPage.value < 3
                ? Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: ctrl.onSkipPressed,
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white60, fontSize: 15),
                ),
              ),
            )
                : const SizedBox()),
          ],
        ),
      ),
    );
  }
}

// ─── Page Shell ──────────────────────────────────────────────────────────────
class _PageShell extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget content;

  const _PageShell({
    required this.title,
    required this.subtitle,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white54, fontSize: 14),
          ),
          const SizedBox(height: 28),
          Expanded(child: Center(child: content)),
        ],
      ),
    );
  }
}

// ─── Dot Indicator ───────────────────────────────────────────────────────────
class _Dot extends StatelessWidget {
  final bool active;
  const _Dot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 22 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? _green : Colors.white24,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// ─── Buttons ─────────────────────────────────────────────────────────────────
class _GreenButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _GreenButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [_green, _teal]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _DarkButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DarkButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white24),
        backgroundColor: const Color(0xFF1A2E42),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

// ─── Page 0: Step Circle ─────────────────────────────────────────────────────
class _StepCircleWidget extends StatelessWidget {
  const _StepCircleWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(250, 250),
            painter: _ArcPainter(),
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '7,842',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
              Text(
                'STEPS TODAY',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 14;
    const strokeW = 14.0;
    const startAngle = pi * 0.75; // 135° — bottom-left
    const sweepAngle = pi * 1.5; // 270°

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Background track
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeW
        ..color = Colors.white.withValues(alpha: 0.08)
        ..strokeCap = StrokeCap.round,
    );

    // Progress arc (~78% filled)
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle * 0.78,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeW
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          colors: const [_teal, _green],
          startAngle: startAngle,
          endAngle: startAngle + sweepAngle,
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Page 1: Calendar ────────────────────────────────────────────────────────
class _CalendarWidget extends StatelessWidget {
  const _CalendarWidget();

  static const _pattern = [
    [false, false, true, true, true],
    [true, true, true, true, true],
    [true, true, true, true, true],
    [true, true, true, true, true],
    [true, true, false, false, false],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'October',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '22 Days Active',
                style: TextStyle(color: _teal, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._pattern.map(
                (row) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: row
                    .map(
                      (active) => Container(
                    width: 48,
                    height: 30,
                    decoration: BoxDecoration(
                      color: active
                          ? _teal.withValues(alpha: 0.85)
                          : const Color(0xFF1A2E40),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Page 2: Fitness Hub ─────────────────────────────────────────────────────
class _FitnessHubWidget extends StatelessWidget {
  const _FitnessHubWidget();

  static const _items = [
    {'icon': Icons.flash_on_rounded, 'label': 'Workouts'},
    {'icon': Icons.favorite_rounded, 'label': 'Heart Rate'},
    {'icon': Icons.track_changes_rounded, 'label': 'Metrics'},
    {'icon': Icons.calendar_today_rounded, 'label': 'Reports'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: _items
          .map(
            (item) => Container(
          decoration: BoxDecoration(
            color: _card,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: Color(0xFF1A3040),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item['icon'] as IconData,
                  color: _teal,
                  size: 26,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                item['label'] as String,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ),
      )
          .toList(),
    );
  }
}

// ─── Page 3: Goal Slider ─────────────────────────────────────────────────────
class _GoalSliderWidget extends StatelessWidget {
  final OnboardingController ctrl;
  const _GoalSliderWidget({required this.ctrl});

  String _format(double val) {
    final k = val.round();
    return '${k ~/ 1000},${(k % 1000).toString().padLeft(3, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Text(
            _format(ctrl.goalSteps.value),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 54,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          )),
          const Text(
            'STEPS DAILY',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 28),
          Obx(() => SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: _teal,
              inactiveTrackColor: Colors.white12,
              thumbColor: _teal,
              overlayColor: _teal.withValues(alpha: 0.15),
              trackHeight: 4,
              thumbShape:
              const RoundSliderThumbShape(enabledThumbRadius: 8),
            ),
            child: Slider(
              value: ctrl.goalSteps.value,
              min: 5000,
              max: 15000,
              divisions: 20,
              onChanged: (val) => ctrl.goalSteps.value = val,
            ),
          )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('5k',
                    style: TextStyle(color: Colors.white38, fontSize: 12)),
                Text('15k',
                    style: TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}