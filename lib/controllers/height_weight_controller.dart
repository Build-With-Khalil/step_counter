import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/storage_services.dart';
import '../utils/ad_helper.dart';

class HeightWeightController extends GetxController {
  RxDouble heightCm = RxDouble(0.0);
  RxDouble weightKg = RxDouble(0.0);

  InterstitialAd? _startAd;
  bool _isStartAdLoading = false;

  @override
  void onInit() {
    super.onInit();
    _loadStartAd();
  }

  void _loadStartAd() {
    if (kIsWeb || _isStartAdLoading) return;
    _isStartAdLoading = true;

    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _startAd = ad;
          _isStartAdLoading = false;
          FirebaseAnalytics.instance.logEvent(
            name: 'ad_loaded',
            parameters: {
              'placement': 'height_weight_start',
              'ad_format': 'interstitial',
            },
          );
        },
        onAdFailedToLoad: (err) {
          _isStartAdLoading = false;
          debugPrint('HeightWeight start ad failed to load: $err');
          FirebaseAnalytics.instance.logEvent(
            name: 'ad_failed_to_load',
            parameters: {
              'placement': 'height_weight_start',
              'ad_format': 'interstitial',
            },
          );
        },
      ),
    );
  }

  void onStartPressed(VoidCallback onComplete) {
    if (_startAd != null) {
      FirebaseAnalytics.instance.logAdImpression(
        adPlatform: 'AdMob',
        adSource: 'google',
        adFormat: 'interstitial',
        adUnitName: 'height_weight_start',
      );
      _startAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _startAd = null;
          FirebaseAnalytics.instance.logEvent(
            name: 'ad_dismissed',
            parameters: {'placement': 'height_weight_start'},
          );
          onComplete();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _startAd = null;
          FirebaseAnalytics.instance.logEvent(
            name: 'ad_failed_to_show',
            parameters: {'placement': 'height_weight_start'},
          );
          onComplete();
        },
      );
      _startAd!.show();
    } else {
      onComplete();
    }
  }

  @override
  void onClose() {
    _startAd?.dispose();
    super.onClose();
  }

  void initialize(String? gender) {
    if (gender == "male") {
      heightCm.value = 175.0;
      weightKg.value = 70.0;
    } else if (gender == "female") {
      heightCm.value = 160.0;
      weightKg.value = 55.0;
    }

    StorageService.saveGender(gender ?? '');
    StorageService.saveHeight(heightCm.value);
    StorageService.saveWeight(weightKg.value);
  }

  void updateHeight(double newHeightCm) {
    heightCm.value = newHeightCm.clamp(140.0, 200.0);
    StorageService.saveHeight(heightCm.value);
  }

  void updateWeight(double newWeightKg) {
    weightKg.value = newWeightKg.clamp(40.0, 100.0);
    StorageService.saveWeight(weightKg.value);
  }

  Future<void> loadSavedData() async {
    final savedGender = await StorageService.getGender();
    final savedHeight = await StorageService.getHeight();
    final savedWeight = await StorageService.getWeight();

    if (savedGender != null) {
      initialize(savedGender);
    }
    if (savedHeight != null) {
      heightCm.value = savedHeight;
    }
    if (savedWeight != null) {
      weightKg.value = savedWeight;
    }
  }
}
