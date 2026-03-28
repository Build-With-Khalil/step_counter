import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AdsManager {
  AdsManager._privateConstructor();
  static final AdsManager instance = AdsManager._privateConstructor();

  NativeAd? _preloadedAd;
  bool _isPreloaded = false;

  NativeAd? get preloadedAd => _preloadedAd;
  bool get isPreloaded => _isPreloaded;

  late TemplateType _templateType;
  late double _adHeight;

  void preloadNativeAd(String adUnitId) {
    if (kIsWeb || _isPreloaded) return;

    print("AdsManager: Starting preload...");


    // Randomly select template
    int rand = Random().nextInt(2);
    if (rand == 0) {
      _templateType = TemplateType.small;
      _adHeight = 120;
    } else {
      _templateType = TemplateType.medium;
      _adHeight = 300;
    }

    _preloadedAd?.dispose();

    _preloadedAd = NativeAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('AdsManager: Native ad preloaded successfully');
          print('AdsManager: Native ad preloaded successfully');
          _isPreloaded = true;

          FirebaseAnalytics.instance.logAdImpression(
            adPlatform: 'AdMob',
            adSource: 'native',
            adUnitName: 'native_ad_$adUnitId',
          );
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint(
              'AdsManager: Failed preload ${error.code} - ${error.message}');
          ad.dispose();
          _isPreloaded = false;
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(templateType: _templateType),
    )..load();
  }

  double get adHeight => _adHeight;

  void disposeAd() {
    _preloadedAd?.dispose();
    _preloadedAd = null;
    _isPreloaded = false;
  }
}
