import 'dart:async';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart';

class AppOpenAdWidget {
  static bool _isShowingAd = false;

  static Future<void> loadAndShowAppOpenAd() async {
    debugPrint('🔵 AppOpenAdWidget: Function called!');

    if (_isShowingAd) {
      debugPrint('🔵 AppOpenAdWidget: Already showing ad');
      return;
    }

    debugPrint('🔵 AppOpenAdWidget: Starting to load App Open Ad...');
    final completer = Completer<void>();

    AppOpenAd.load(
      adUnitId: 'ca-app-pub-8523132132584450/1704684354',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('🔵 AppOpenAdWidget: ✅ Ad LOADED successfully!');
          _isShowingAd = true;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) {
              debugPrint('🔵 AppOpenAdWidget: ✅ Ad SHOWING!');
            },
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('🔵 AppOpenAdWidget: Ad dismissed');
              ad.dispose();
              _isShowingAd = false;
              completer.complete();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('🔵 AppOpenAdWidget: ❌ Failed to show: $error');
              ad.dispose();
              _isShowingAd = false;
              completer.complete();
            },
          );

          ad.show();
        },
        onAdFailedToLoad: (error) {
          debugPrint('🔵 AppOpenAdWidget: ❌ Failed to LOAD: $error');
          _isShowingAd = false;
          completer.complete();
        },
      ),
    );

    await completer.future;
    debugPrint('🔵 AppOpenAdWidget: Process completed');
  }
}