import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import '../utils/ad_helper.dart';

class NativeAdWidget extends StatefulWidget {
  final String adUnitId;
  final Function(bool)? onAdLoaded;

  const NativeAdWidget({
    super.key,
    required this.adUnitId,
    this.onAdLoaded,
  });

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  late TemplateType _templateType;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      final cached = AdManager.claimNativeAdByUnitId(widget.adUnitId);
      if (cached != null) {
        _nativeAd = cached;
        _isAdLoaded = true;
        _templateType = TemplateType.medium;
        widget.onAdLoaded?.call(true);
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
    _nativeAd?.dispose();

    _nativeAd = NativeAd(
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
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
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: _templateType,
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
      width: double.infinity,
      child: AdWidget(ad: _nativeAd!),
    );
  }
}