import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/locale_controller.dart';
import 'onboarding_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen>
    with SingleTickerProviderStateMixin {
  // ─── Language Data ──────────────────────────────────────────────────────────
  static const List<Map<String, String>> _languages = [
    {'code': 'en', 'name': 'English',    'native': 'English',         'flag': '🇬🇧'},
    {'code': 'ar', 'name': 'Arabic',     'native': 'العربية',          'flag': '🇸🇦'},
    {'code': 'ur', 'name': 'Urdu',       'native': 'اردو',             'flag': '🇵🇰'},
    {'code': 'hi', 'name': 'Hindi',      'native': 'हिन्दी',          'flag': '🇮🇳'},
    {'code': 'es', 'name': 'Spanish',    'native': 'Español',          'flag': '🇪🇸'},
    {'code': 'fr', 'name': 'French',     'native': 'Français',         'flag': '🇫🇷'},
    {'code': 'de', 'name': 'German',     'native': 'Deutsch',          'flag': '🇩🇪'},
    {'code': 'pt', 'name': 'Portuguese', 'native': 'Português',        'flag': '🇧🇷'},
    {'code': 'zh', 'name': 'Chinese',    'native': '中文',              'flag': '🇨🇳'},
    {'code': 'tr', 'name': 'Turkish',    'native': 'Türkçe',           'flag': '🇹🇷'},
    {'code': 'id', 'name': 'Indonesian', 'native': 'Bahasa Indonesia', 'flag': '🇮🇩'},
    {'code': 'ja', 'name': 'Japanese',   'native': '日本語',            'flag': '🇯🇵'},
    {'code': 'ko', 'name': 'Korean',     'native': '한국어',            'flag': '🇰🇷'},
    {'code': 'ru', 'name': 'Russian',    'native': 'Русский',          'flag': '🇷🇺'},
    {'code': 'it', 'name': 'Italian',    'native': 'Italiano',         'flag': '🇮🇹'},
    {'code': 'bn', 'name': 'Bengali',    'native': 'বাংলা',            'flag': '🇧🇩'},
    {'code': 'ms', 'name': 'Malay',      'native': 'Bahasa Melayu',    'flag': '🇲🇾'},
    {'code': 'nl', 'name': 'Dutch',      'native': 'Nederlands',       'flag': '🇳🇱'},
    {'code': 'sw', 'name': 'Swahili',    'native': 'Kiswahili',        'flag': '🇰🇪'},
    {'code': 'vi', 'name': 'Vietnamese', 'native': 'Tiếng Việt',       'flag': '🇻🇳'},
  ];

  // ─── State ──────────────────────────────────────────────────────────────────
  String? _selectedCode;
  final TextEditingController _searchCtrl = TextEditingController();
  String _searchQuery = '';
  late final AnimationController _animCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  List<Map<String, String>> get _filtered {
    if (_searchQuery.isEmpty) return _languages;
    final q = _searchQuery.toLowerCase();
    return _languages
        .where((l) =>
            l['name']!.toLowerCase().contains(q) ||
            l['native']!.toLowerCase().contains(q) ||
            l['code']!.toLowerCase().contains(q))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnim =
        CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  // ─── Actions ────────────────────────────────────────────────────────────────
  Future<void> _onContinue() async {
    if (_selectedCode == null) return;
    await Get.find<LocaleController>().setLocale(_selectedCode!);
    Get.off(() => const OnBoardingScreen());
  }

  // ─── Build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF0A0E1A) : const Color(0xFFF4F6FF),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: SlideTransition(
          position: _slideAnim,
          child: Column(
            children: [
              _Header(isDark: isDark),
              _SearchBar(
                controller: _searchCtrl,
                isDark: isDark,
                onChanged: (v) => setState(() => _searchQuery = v),
              ),
              Expanded(child: _buildGrid(isDark)),
              _ContinueFooter(
                isDark: isDark,
                selectedCode: _selectedCode,
                languages: _languages,
                onContinue: _onContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(bool isDark) {
    final list = _filtered;
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded,
                size: 52,
                color: isDark ? Colors.grey[700] : Colors.grey[400]),
            const SizedBox(height: 12),
            Text(
              'No languages found',
              style: TextStyle(
                fontSize: 15,
                color: isDark ? Colors.grey[500] : Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 4),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.7,
      ),
      itemCount: list.length,
      itemBuilder: (_, i) => _LanguageCard(
        lang: list[i],
        isSelected: _selectedCode == list[i]['code'],
        isDark: isDark,
        onTap: () => setState(() => _selectedCode = list[i]['code']),
      ),
    );
  }
}

// ─── Sub-widgets ──────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  final bool isDark;
  const _Header({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 58, 24, 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF1A2040), const Color(0xFF0A0E1A)]
              : [const Color(0xFF4F6FFF), const Color(0xFF7C3AED)],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black45
                : const Color(0xFF4F6FFF).withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Globe icon in a frosted circle
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.12),
              border: Border.all(
                  color: Colors.white.withValues(alpha: 0.28), width: 2),
            ),
            child: const Icon(
              Icons.language_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Choose Your Language',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          // Multi-script subtitle
          Text(
            'اردو  •  हिन्दी  •  Español  •  中文  •  العربية',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.70),
              fontSize: 13,
              letterSpacing: 1.1,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            'Français  •  Deutsch  •  Türkçe  •  Русский',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.50),
              fontSize: 11.5,
              letterSpacing: 1.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final bool isDark;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _SearchBar({
    required this.isDark,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 6),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black87,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: 'Search language...',
          hintStyle: TextStyle(
            color: isDark ? Colors.grey[500] : Colors.grey[420],
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 22,
            color: isDark ? Colors.grey[400] : Colors.grey[500],
          ),
          suffixIcon: controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    controller.clear();
                    onChanged('');
                  },
                  child: Icon(Icons.close_rounded,
                      size: 18,
                      color: isDark ? Colors.grey[400] : Colors.grey[500]),
                )
              : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          filled: true,
          fillColor: isDark ? const Color(0xFF161D2F) : Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: isDark ? Colors.white10 : Colors.grey.shade200,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: Color(0xFF4F6FFF), width: 1.5),
          ),
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  final Map<String, String> lang;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _LanguageCard({
    required this.lang,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFF4F6FFF);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark
                  ? const Color(0xFF182150)
                  : const Color(0xFFECF0FF))
              : (isDark ? const Color(0xFF141A28) : Colors.white),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? selectedColor
                : (isDark ? Colors.white10 : Colors.grey.shade200),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? selectedColor.withValues(alpha: 0.22)
                  : Colors.black.withValues(alpha: isDark ? 0.25 : 0.05),
              blurRadius: isSelected ? 16 : 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Flag
            Text(lang['flag']!, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 10),
            // Names
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    lang['native']!,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? selectedColor
                          : (isDark ? Colors.white : Colors.black87),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    lang['name']!,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark ? Colors.grey[450] : Colors.grey[600],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Check mark
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF4F6FFF),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

class _ContinueFooter extends StatelessWidget {
  final bool isDark;
  final String? selectedCode;
  final List<Map<String, String>> languages;
  final VoidCallback onContinue;

  const _ContinueFooter({
    required this.isDark,
    required this.selectedCode,
    required this.languages,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = selectedCode != null;
    final selected = enabled
        ? languages.firstWhere((l) => l['code'] == selectedCode)
        : null;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 14, 24, 36),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0A0E1A) : const Color(0xFFF4F6FF),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.07),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Selected language chip
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: selected != null
                ? Padding(
                    key: ValueKey(selected['code']),
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 7),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.08)
                            : const Color(0xFF4F6FFF).withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: const Color(0xFF4F6FFF)
                              .withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(selected['flag']!,
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(width: 8),
                          Text(
                            '${selected['native']} selected',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? Colors.white70
                                  : const Color(0xFF4F6FFF),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            Icons.check_circle,
                            size: 14,
                            color: isDark
                                ? Colors.white54
                                : const Color(0xFF4F6FFF),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          // Continue button
          AnimatedOpacity(
            opacity: enabled ? 1.0 : 0.40,
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: enabled ? onContinue : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F6FFF),
                  disabledBackgroundColor:
                      isDark ? Colors.grey[850] : Colors.grey[300],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  elevation: enabled ? 8 : 0,
                  shadowColor:
                      const Color(0xFF4F6FFF).withValues(alpha: 0.45),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      enabled
                          ? 'Continue with ${selected!['native']}'
                          : 'Select a Language',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.4,
                      ),
                    ),
                    if (enabled) ...[
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_rounded, size: 20),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
