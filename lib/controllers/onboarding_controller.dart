import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../screens/gender_select_screen.dart';
import '../utils/ad_helper.dart';

final _analytics = FirebaseAnalytics.instance;

void _logAd(String event, String placement, {String? format}) {
  _analytics.logEvent(name: event, parameters: {
    'placement': placement,
    if (format != null) 'ad_format': format,
  });
}

class OnboardingController extends GetxController {


  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxDouble goalSteps = 10000.0.obs;

  RewardedAd? _skipAd;
  bool _isSkipAdLoading = false;

  InterstitialAd? _startJourneyAd;
  bool _isStartJourneyAdLoading = false;

  @override
  void onInit() {
    super.onInit();
    _loadSkipAd();
    _loadStartJourneyAd();
  }

  // ── Skip (Rewarded) ────────────────────────────────────────────────────────

  void _loadSkipAd() {
    if (kIsWeb || _isSkipAdLoading) return;
    _isSkipAdLoading = true;

    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _skipAd = ad;
          _isSkipAdLoading = false;
          _logAd('ad_loaded', 'onboarding_skip', format: 'rewarded');
        },
        onAdFailedToLoad: (err) {
          _isSkipAdLoading = false;
          debugPrint('Onboarding skip ad failed to load: $err');
          _logAd('ad_failed_to_load', 'onboarding_skip', format: 'rewarded');
        },
      ),
    );
  }

  void onSkipPressed() {
    if (_skipAd != null) {
      _analytics.logAdImpression(
        adPlatform: 'AdMob',
        adSource: 'google',
        adFormat: 'rewarded',
        adUnitName: 'onboarding_skip',
      );
      _skipAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _skipAd = null;
          _logAd('ad_dismissed', 'onboarding_skip');
          skipToLast();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _skipAd = null;
          _logAd('ad_failed_to_show', 'onboarding_skip');
          skipToLast();
        },
      );
      _skipAd!.show(onUserEarnedReward: (ad, reward) {
        _logAd('ad_reward_earned', 'onboarding_skip');
      });
    } else {
      skipToLast();
    }
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  // ── Start Journey (Interstitial) ───────────────────────────────────────────

  void _loadStartJourneyAd() {
    if (kIsWeb || _isStartJourneyAdLoading) return;
    _isStartJourneyAdLoading = true;

    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _startJourneyAd = ad;
          _isStartJourneyAdLoading = false;
          _logAd('ad_loaded', 'onboarding_start_journey', format: 'interstitial');
        },
        onAdFailedToLoad: (err) {
          _isStartJourneyAdLoading = false;
          debugPrint('Start journey ad failed to load: $err');
          _logAd('ad_failed_to_load', 'onboarding_start_journey', format: 'interstitial');
        },
      ),
    );
  }

  void finishOnboarding() {
    if (_startJourneyAd != null) {
      _analytics.logAdImpression(
        adPlatform: 'AdMob',
        adSource: 'google',
        adFormat: 'interstitial',
        adUnitName: 'onboarding_start_journey',
      );
      _startJourneyAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _startJourneyAd = null;
          _logAd('ad_dismissed', 'onboarding_start_journey');
          Get.off(() => const GenderSelectScreen());
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _startJourneyAd = null;
          _logAd('ad_failed_to_show', 'onboarding_start_journey');
          Get.off(() => const GenderSelectScreen());
        },
      );
      _startJourneyAd!.show();
    } else {
      Get.off(() => const GenderSelectScreen());
    }
  }

  void onPageChanged(int index) {
    final prev = currentPage.value;
    currentPage.value = index;
    // Show interstitial only on Get Started (0→1) transition
    // if (index == 1 && prev == 0) {
    //   AdManager.showInterstitialAd();
    //   _logAd('ad_impression', 'onboarding_get_started', format: 'interstitial');
    // }
  }

  void skipToLast() {
    pageController.animateToPage(
      3,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    _skipAd?.dispose();
    _startJourneyAd?.dispose();
    pageController.dispose();
    super.onClose();
  }
}