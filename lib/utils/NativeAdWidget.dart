import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/ad_helper.dart';

class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;
  bool _isFromCache = false;

  late TemplateType _templateType;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      final cached = AdManager.cachedNativeAd;

      if (cached != null) {
        _nativeAd = cached;
        _isAdLoaded = true;
        _isFromCache = true;

        // ✅ Use cached template instead of hardcoding medium
        _templateType = AdManager.cachedTemplate ?? TemplateType.medium;

        // preload next
        AdManager.markNativeAdUsed();
        Future.microtask(() => AdManager.loadNativeAd());
      } else {
        _selectRandomTemplate();
        _loadNativeAd();
      }
    }
  }

  void _selectRandomTemplate() {
    int rand = Random().nextInt(2);
    _templateType = rand == 0 ? TemplateType.small : TemplateType.medium;
  }

  void _loadNativeAd() {
    _nativeAd = NativeAd(
      adUnitId: AdHelper.nativeAdUnitId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint("Widget Ad Loaded ✅");
          if (mounted) setState(() => _isAdLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint("Widget Ad Failed ❌: ${error.code}");
          ad.dispose();
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(templateType: _templateType),
    )..load();
  }

  @override
  void dispose() {
    if (!_isFromCache) _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAdLoaded || _nativeAd == null || kIsWeb) return const SizedBox.shrink();

    final screenHeight = MediaQuery.of(context).size.height;

    final adHeight = _templateType == TemplateType.small
        ? (screenHeight * 0.15).clamp(100.0, 140.0)
        : (screenHeight * 0.40).clamp(280.0, 350.0);

    return SizedBox(
      height: adHeight,
      width: double.infinity,
      child: AdWidget(ad: _nativeAd!),
    );
  }
}