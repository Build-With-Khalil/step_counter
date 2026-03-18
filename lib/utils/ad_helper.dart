import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {

  //Native AD Unit ID
  static String get nativeAdUnitId {
    if (kIsWeb) return '';
    if (Platform.isAndroid) {
      return 'ca-app-pub-8523132132584450/4352310252';
    }
    throw UnsupportedError('Unsupported platform');
  }

  static String get native2AdUnitId{
    if (kIsWeb) return '';
    if (Platform.isAndroid) {
      return 'ca-app-pub-8523132132584450/9987520551';
    }
    throw UnsupportedError('Unsupported platform');
  }

//Interstitial Ad Unit ID
  static String get interstitialAdUnitId {
    if (kIsWeb) return '';
    if (Platform.isAndroid) {
      return 'ca-app-pub-8523132132584450/3655591089';
    }
    throw UnsupportedError('Unsupported platform');
  }

  //Reward Ad Unit ID
  static String get rewardedAdUnitId {
    if (kIsWeb) return '';
    if (Platform.isAndroid) {
      return 'ca-app-pub-8523132132584450/2669812470';
    }
    throw UnsupportedError('Unsupported platform');
  }


//APP Open Ad Uni ID
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
  static NativeAd? _nativeAd;
  static NativeAd? _native2Ad;

  static bool _isInterstitialLoading = false;
  static bool _isRewardedLoading = false;
  static bool _isAppOpenAdLoading = false;
  static bool _isNativeAdLoading = false;
  static bool _isNative2AdLoading = false;

  // Periodic Ad Timer
  //static Timer? _periodicAdTimer;

  // Navigation action counter (shared across the whole app)
  static int _navCount = 0;
  static const int _navThreshold = 3;

  static void onNavigationAction() {
    _navCount++;
    if (_navCount >= _navThreshold) {
      _navCount = 0;
      showInterstitialAd();
    }
  }

  // /// Initialize Ads and start periodic timer
  // static Future<void> initialize() async {
  //   if (kIsWeb) return;
  //   await MobileAds.instance.initialize();
  // }

  static void loadOtherAds() {
    if (kIsWeb) return;
    loadInterstitialAd();
    loadRewardedAd();
    loadAppOpenAd();
    loadNativeAd();
    loadNative2Ad();
    //_startPeriodicAds();
  }
  //
  // static void pauseAds() {
  //   _periodicAdTimer?.cancel();
  //   _periodicAdTimer = null;
  // }
  //
  // static void resumeAds() {
  //   if (kIsWeb) return;
  //   //_startPeriodicAds();
  // }

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

  // --- Native Ads ---
  static void loadNativeAd() {
    if (kIsWeb || _isNativeAdLoading || _nativeAd != null) return;
    _isNativeAdLoading = true;
    NativeAd(
      adUnitId: AdHelper.nativeAdUnitId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          _nativeAd = ad as NativeAd; // only set once the ad is fully loaded
          _isNativeAdLoading = false;
          debugPrint('AdManager: NativeAd preloaded');
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          _isNativeAdLoading = false;
          debugPrint('AdManager: NativeAd failed to preload: $error');
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(templateType: TemplateType.medium),
    )..load();
  }

  static void loadNative2Ad() {
    if (kIsWeb || _isNative2AdLoading || _native2Ad != null) return;
    _isNative2AdLoading = true;
    NativeAd(
      adUnitId: AdHelper.native2AdUnitId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          _native2Ad = ad as NativeAd; // only set once the ad is fully loaded
          _isNative2AdLoading = false;
          debugPrint('AdManager: Native2Ad preloaded');
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          _isNative2AdLoading = false;
          debugPrint('AdManager: Native2Ad failed to preload: $error');
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(templateType: TemplateType.medium),
    )..load();
  }

  static NativeAd? claimNativeAdByUnitId(String adUnitId) {
    if (adUnitId == AdHelper.nativeAdUnitId) {
      final ad = _nativeAd;
      _nativeAd = null;
      if (ad != null) loadNativeAd();
      return ad;
    }
    if (adUnitId == AdHelper.native2AdUnitId) {
      final ad = _native2Ad;
      _native2Ad = null;
      if (ad != null) loadNative2Ad();
      return ad;
    }
    return null;
  }

  // --- Periodic Ads ---
  // static void _startPeriodicAds() {
  //   _periodicAdTimer?.cancel();
  //   _periodicAdTimer = Timer.periodic(const Duration(seconds: 40), (timer) {
  //     debugPrint("Periodic Ad Triggered");
  //     showInterstitialAd();
  //   });
  // }

  // --- Interstitial Ad For Click ---

  static void loadInterstitialAd() {
    if (kIsWeb || _isInterstitialLoading) return;
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