import 'dart:async';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart';
import '../utils/ad_helper.dart';


class AppOpenAdWidget {
  static bool _isShowingAd = false;

  static Future<void> loadAndShowAppOpenAd() async {
    debugPrint('🔵 AppOpenAdWidget: Function called!');

    if (_isShowingAd) {
      debugPrint('🔵 AppOpenAdWidget: Already showing ad');
      return;
    }

    final completer = Completer<void>();

    void _showAd(AppOpenAd ad) {
      _isShowingAd = true;
      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) {
          debugPrint('🔵 AppOpenAdWidget: ✅ Ad SHOWING!');
        },
        onAdDismissedFullScreenContent: (ad) {
          debugPrint('🔵 AppOpenAdWidget: Ad dismissed');
          ad.dispose();
          _isShowingAd = false;
          AdManager.loadAppOpenAd();
          completer.complete();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          debugPrint('🔵 AppOpenAdWidget: ❌ Failed to show: $error');
          ad.dispose();
          _isShowingAd = false;
          AdManager.loadAppOpenAd();
          completer.complete();
        },
      );
      ad.show();
    }

    // Use preloaded ad if available
    final preloaded = AdManager.claimAppOpenAd();
    if (preloaded != null) {
      debugPrint('🔵 AppOpenAdWidget: ✅ Using preloaded App Open Ad');
      _showAd(preloaded);
      await completer.future;
      debugPrint('🔵 AppOpenAdWidget: Process completed');
      return;
    }

    // Fall back to loading fresh
    debugPrint('🔵 AppOpenAdWidget: Starting to load App Open Ad...');
    AppOpenAd.load(
      adUnitId: AdHelper.appOpenAdUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('🔵 AppOpenAdWidget: ✅ Ad LOADED successfully!');
          _showAd(ad);
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