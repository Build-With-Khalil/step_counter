import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class NativeAdWidgetForMedium extends StatefulWidget {
  final String adUnitId;
  final Function(bool)? onAdLoaded;

  const NativeAdWidgetForMedium({
    super.key,
    required this.adUnitId,
    this.onAdLoaded,
  });

  @override
  State<NativeAdWidgetForMedium> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidgetForMedium> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  final TemplateType _templateType = TemplateType.medium;
  final double _adHeight = 300; // Recommended height for medium native

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _loadNativeAd();
    }
  }

  void _loadNativeAd() {
    _nativeAd?.dispose();

    _nativeAd = NativeAd(
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: _templateType,
      ),
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('NativeAdWidget: Ad loaded');

          if (mounted) {
            setState(() => _isAdLoaded = true);
            widget.onAdLoaded?.call(true);

            FirebaseAnalytics.instance.logAdImpression(
              adPlatform: 'AdMob',
              adSource: 'native',
              adUnitName: 'native_ad_${widget.adUnitId}',
            );
          }
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint(
              'NativeAdWidget: Failed ${error.code} - ${error.message}');
          ad.dispose();

          if (mounted) {
            setState(() => _isAdLoaded = false);
            widget.onAdLoaded?.call(false);
          }
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAdLoaded || _nativeAd == null || kIsWeb) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: _adHeight,
      width: double.infinity,
      child: AdWidget(ad: _nativeAd!),
    );
  }
}
