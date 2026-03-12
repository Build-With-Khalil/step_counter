import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class NativeAdWidget extends StatefulWidget {
  final String adUnitId;
  final Function(bool)? onAdLoaded;

  const NativeAdWidget({
    super.key,
    required this.adUnitId,
    this.onAdLoaded,
  });

  @override
  _NativeAdWidgetState createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

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
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('NativeAdWidget: Ad loaded successfully');
          if (mounted) {
            setState(() => _isAdLoaded = true);
            widget.onAdLoaded?.call(true);

            // Log analytics impression
            FirebaseAnalytics.instance.logAdImpression(
              adPlatform: 'AdMob',
              adSource: 'native',
              adUnitName: 'native_ad_${widget.adUnitId}',
            );
          }
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint(
              'NativeAdWidget: Failed to load: ${error.code} - ${error.message}');
          ad.dispose();
          if (mounted) {
            setState(() => _isAdLoaded = false);
            widget.onAdLoaded?.call(false);
          }
        },
      ),
      nativeTemplateStyle:  NativeTemplateStyle(
        templateType: TemplateType.medium,
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
      height: 300
      , // static height recommended for TemplateType.medium
      width: double.infinity,
      child: AdWidget(ad: _nativeAd!),
    );
  }
}