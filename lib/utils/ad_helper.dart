import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  // Native AD Unit ID
  static String get nativeAdUnitId {
    if (kIsWeb) return '';
    if (Platform.isAndroid) {
      return 'ca-app-pub-8523132132584450/4352310252';
    }
    throw UnsupportedError('Unsupported platform');
  }

  // Interstitial Ad Unit ID
  static String get interstitialAdUnitId {
    if (kIsWeb) return '';
    if (Platform.isAndroid) {
      return 'ca-app-pub-8523132132584450/3655591089';
    }
    throw UnsupportedError('Unsupported platform');
  }

  // Rewarded Ad Unit ID
  static String get rewardedAdUnitId {
    if (kIsWeb) return '';
    if (Platform.isAndroid) {
      return 'ca-app-pub-8523132132584450/2669812470';
    }
    throw UnsupportedError('Unsupported platform');
  }

  // App Open Ad Unit ID
  static String get appOpenAdUnitId {
    if (kIsWeb) return '';
    if (Platform.isAndroid) {
      return 'ca-app-pub-8523132132584450/1704684354';
    }
    throw UnsupportedError('Unsupported platform');
  }
}

class AdManager {
  static InterstitialAd? _interstitialAd;
  static RewardedAd? _rewardedAd;
  static AppOpenAd? _appOpenAd;

  static bool _isInterstitialLoading = false;
  static bool _isRewardedLoading = false;
  static bool _isAppOpenAdLoading = false;

  static int _navCount = 0;
  static const int _navThreshold = 3;

  static void onNavigationAction() {
    _navCount++;
    if (_navCount >= _navThreshold) {
      _navCount = 0;
      showInterstitialAd();
    }
  }

  static void loadOtherAds() {
    if (kIsWeb) return;
    loadInterstitialAd();
    loadRewardedAd();
    loadAppOpenAd();
  }

  // --- App Open Ad ---
  static AppOpenAd? claimAppOpenAd() {
    final ad = _appOpenAd;
    _appOpenAd = null;
    return ad;
  }

  static void loadAppOpenAd({
    VoidCallback? onAdLoaded,
    Function(LoadAdError)? onAdFailed,
  }) {
    if (kIsWeb || _isAppOpenAdLoading || _appOpenAd != null) return;
    _isAppOpenAdLoading = true;

    AppOpenAd.load(
      adUnitId: AdHelper.appOpenAdUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          _isAppOpenAdLoading = false;
          onAdLoaded?.call();
        },
        onAdFailedToLoad: (err) {
          _isAppOpenAdLoading = false;
          debugPrint('AppOpenAd failed to load: $err');
          onAdFailed?.call(err);
        },
      ),
    );
  }

  static void showAppOpenAd(VoidCallback onAdDismissed) {
    if (_appOpenAd != null) {
      _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _appOpenAd = null;
          onAdDismissed();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _appOpenAd = null;
          onAdDismissed();
        },
      );
      _appOpenAd!.show();
    } else {
      onAdDismissed();
    }
  }

  // --- Native AD code ---
  static NativeAd? _cachedNativeAd;
  static TemplateType? _cachedTemplate;
  static bool _isNativeLoading = false;

  static NativeAd? get cachedNativeAd => _cachedNativeAd;
  static TemplateType? get cachedTemplate => _cachedTemplate;

  static void markNativeAdUsed() {
    _cachedNativeAd = null;
    _cachedTemplate = null;
  }

  static void loadNativeAd() {
    if (kIsWeb || _isNativeLoading || _cachedNativeAd != null) return;

    _isNativeLoading = true;

    final rand = Random().nextInt(2);
    final template = rand == 0 ? TemplateType.small : TemplateType.medium;

    _cachedTemplate = template;

    _cachedNativeAd = NativeAd(
      adUnitId: AdHelper.nativeAdUnitId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          _isNativeLoading = false;
          debugPrint('Native Ad loaded (${template.name})');
        },
        onAdFailedToLoad: (ad, error) {
          _isNativeLoading = false;
          ad.dispose();
          _cachedNativeAd = null;
          _cachedTemplate = null;
          debugPrint('Native Ad failed: ${error.code}');
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: template,
        mainBackgroundColor: Colors.white,
        cornerRadius: 12,
      ),
    )..load();
  }

  // --- Interstitial Ad ---
  static void loadInterstitialAd() {
    if (kIsWeb || _isInterstitialLoading || _interstitialAd != null) return;
    _isInterstitialLoading = true;

    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialLoading = false;
          _interstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                  _interstitialAd = null;
                  loadInterstitialAd();
                },
                onAdFailedToShowFullScreenContent: (ad, error) {
                  ad.dispose();
                  _interstitialAd = null;
                  loadInterstitialAd();
                },
              );
        },
        onAdFailedToLoad: (err) {
          _isInterstitialLoading = false;
          debugPrint('InterstitialAd failed to load: $err');
        },
      ),
    );
  }

  static void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
    } else {
      loadInterstitialAd();
    }
  }

  // --- Rewarded Ad ---
  static void loadRewardedAd() {
    if (kIsWeb || _isRewardedLoading) return;
    _isRewardedLoading = true;

    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedLoading = false;
          _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _rewardedAd = null;
              loadRewardedAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _rewardedAd = null;
              loadRewardedAd();
            },
          );
        },
        onAdFailedToLoad: (err) {
          _isRewardedLoading = false;
          debugPrint('RewardedAd failed to load: $err');
        },
      ),
    );
  }

  static void showRewardedAd({
    required Function(RewardItem) onUserEarnedReward,
  }) {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          onUserEarnedReward(reward);
        },
      );
      _rewardedAd = null;
    } else {
      loadRewardedAd();
    }
  }
}

class AdNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    AdManager.onNavigationAction();
  }
}