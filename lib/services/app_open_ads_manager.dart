import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AppOpenAdManager {
  AppOpenAd? _appOpenAd;
  bool _isAdLoading = false;

  // Use production ad unit ID
  static const String _adUnitId = 'ca-app-pub-8523132132584450/1704684354';
  static const int _maxRetries = 3;
  static const int _baseRetryDelayMs = 2000; // 2s delay to avoid rate-limiting
  static const int _loadTimeoutMs = 6000; // 6s timeout for ad load

  Future<void> loadAd({
    required VoidCallback onAdLoaded,
    required VoidCallback onAdFailed,
    int retryCount = 0,
  }) async {
    if (_isAdLoading) {
      debugPrint('AppOpenAdManager: Ad is already loading');
      return;
    }
    if (_appOpenAd != null) {
      debugPrint('AppOpenAdManager: Disposing existing ad');
      _appOpenAd!.dispose();
      _appOpenAd = null;
    }

    _isAdLoading = true;
    debugPrint('AppOpenAdManager: Loading ad (Attempt ${retryCount + 1}, ID: $_adUnitId)');

    try {
      await AppOpenAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (AppOpenAd ad) {
            debugPrint('AppOpenAdManager: Ad loaded successfully (ID: $_adUnitId)');
            FirebaseAnalytics.instance.logEvent(
              name: 'app_open_ad_loaded',
              parameters: {
                'ad_unit_id': _adUnitId,
                'attempt': retryCount + 1,
              },
            );
            _appOpenAd = ad;
            _isAdLoading = false;
            onAdLoaded();
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('AppOpenAdManager: Ad failed to load: code=${error.code}, '
                'message="${error.message}", domain="${error.domain}"');
            FirebaseAnalytics.instance.logEvent(
              name: 'app_open_ad_failed_to_load',
              parameters: {
                'error_code': error.code,
                'error_message': error.message,
                'error_domain': error.domain,
                'ad_unit_id': _adUnitId,
                'attempt': retryCount + 1,
              },
            );
            _appOpenAd = null;
            _isAdLoading = false;
            // Stop retries on HTTP 403 error
            if (error.message.contains('HTTP response code: 403')) {
              debugPrint('AppOpenAdManager: Stopping retries due to HTTP 403 error');
              onAdFailed();
            } else {
              _handleRetry(onAdLoaded, onAdFailed, retryCount);
            }
          },
        ),
      ).timeout(Duration(milliseconds: _loadTimeoutMs), onTimeout: () {
        debugPrint('AppOpenAdManager: Ad load timed out');
        FirebaseAnalytics.instance.logEvent(
          name: 'app_open_ad_timeout',
          parameters: {
            'ad_unit_id': _adUnitId,
            'attempt': retryCount + 1,
          },
        );
        _appOpenAd = null;
        _isAdLoading = false;
        _handleRetry(onAdLoaded, onAdFailed, retryCount);
      });
    } catch (e, stackTrace) {
      debugPrint('AppOpenAdManager: Exception during ad load: $e\n$stackTrace');
      FirebaseAnalytics.instance.logEvent(
        name: 'app_open_ad_load_exception',
        parameters: {
          'error': e.toString(),
          'ad_unit_id': _adUnitId,
          'attempt': retryCount + 1,
        },
      );
      _appOpenAd = null;
      _isAdLoading = false;
      _handleRetry(onAdLoaded, onAdFailed, retryCount);
    }
  }

  void _handleRetry(VoidCallback onAdLoaded, VoidCallback onAdFailed, int retryCount) {
    if (retryCount < _maxRetries) {
      Future.delayed(
        Duration(milliseconds: _baseRetryDelayMs * (retryCount + 1)),
            () {
          loadAd(
            onAdLoaded: onAdLoaded,
            onAdFailed: onAdFailed,
            retryCount: retryCount + 1,
          );
        },
      );
    } else {
      debugPrint('AppOpenAdManager: Max retries ($_maxRetries) reached');
      onAdFailed();
    }
  }

  void showAdIfAvailable(BuildContext context, VoidCallback onAdComplete) {
    debugPrint(
        'AppOpenAdManager: Attempting to show ad, _appOpenAd: $_appOpenAd, context.mounted: ${context.mounted}');
    if (_appOpenAd == null || !context.mounted) {
      debugPrint('AppOpenAdManager: No ad available or context not mounted');
      FirebaseAnalytics.instance.logEvent(
        name: 'app_open_ad_failed',
        parameters: {
          'reason': _appOpenAd == null ? 'no_ad_available' : 'context_not_mounted',
          'ad_unit_id': _adUnitId,
        },
      );
      onAdComplete();
      // Retry loading a new ad
      if (_appOpenAd == null && !_isAdLoading) {
        loadAd(onAdLoaded: () {}, onAdFailed: () {});
      }
      return;
    }

    debugPrint('AppOpenAdManager: Showing ad (ID: $_adUnitId)');
    try {
      _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (AppOpenAd ad) {
          debugPrint('AppOpenAdManager: Ad shown successfully');
          FirebaseAnalytics.instance.logEvent(
            name: 'app_open_ad_shown',
            parameters: {'ad_unit_id': _adUnitId},
          );
        },
        onAdDismissedFullScreenContent: (AppOpenAd ad) {
          debugPrint('AppOpenAdManager: Ad dismissed');
          FirebaseAnalytics.instance.logEvent(
            name: 'app_open_ad_dismissed',
            parameters: {'ad_unit_id': _adUnitId},
          );
          ad.dispose();
          _appOpenAd = null;
          _isAdLoading = false;
          onAdComplete();
          // Preload next ad
          loadAd(onAdLoaded: () {}, onAdFailed: () {});
        },
        onAdFailedToShowFullScreenContent: (AppOpenAd ad, AdError error) {
          debugPrint('AppOpenAdManager: Ad failed to show: code=${error.code}, '
              'message="${error.message}", domain="${error.domain}"');
          FirebaseAnalytics.instance.logEvent(
            name: 'app_open_ad_failed_to_show',
            parameters: {
              'error_code': error.code,
              'error_message': error.message,
              'error_domain': error.domain,
              'ad_unit_id': _adUnitId,
            },
          );
          ad.dispose();
          _appOpenAd = null;
          _isAdLoading = false;
          onAdComplete();
          // Retry loading a new ad
          loadAd(onAdLoaded: () {}, onAdFailed: () {});
        },
        onAdImpression: (AppOpenAd ad) {
          debugPrint('AppOpenAdManager: Ad impression recorded');
          FirebaseAnalytics.instance.logEvent(
            name: 'app_open_ad_impression',
            parameters: {'ad_unit_id': _adUnitId},
          );
        },
      );

      _appOpenAd!.show();
      debugPrint('AppOpenAdManager: Ad show method called');
    } catch (e, stackTrace) {
      debugPrint('AppOpenAdManager: Exception while showing ad: $e\n$stackTrace');
      FirebaseAnalytics.instance.logEvent(
        name: 'app_open_ad_exception',
        parameters: {
          'error': e.toString(),
          'ad_unit_id': _adUnitId,
        },
      );
      _appOpenAd?.dispose();
      _appOpenAd = null;
      _isAdLoading = false;
      onAdComplete();
      // Retry loading a new ad
      loadAd(onAdLoaded: () {}, onAdFailed: () {});
    }
  }

  void dispose() {
    debugPrint('AppOpenAdManager: Disposing ad');
    _appOpenAd?.dispose();
    _appOpenAd = null;
    _isAdLoading = false;
  }
}