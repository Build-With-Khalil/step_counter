import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/ad_helper.dart';

class NavigationController extends GetxController with WidgetsBindingObserver {
  final _selectedIndex = 0.obs;

  InterstitialAd? _interstitialAd;
  bool _isAdLoading = false;

  Timer? _timer;

  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _loadAd();}


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _timer?.cancel();
    } else if (state == AppLifecycleState.resumed) {
    }
  }

  void _loadAd() {
    if (kIsWeb || _isAdLoading) return;
    _isAdLoading = true;

    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isAdLoading = false;
          FirebaseAnalytics.instance.logEvent(
            name: 'ad_loaded',
            parameters: {'placement': 'nav_tab', 'ad_format': 'interstitial'},
          );
        },
        onAdFailedToLoad: (err) {
          _isAdLoading = false;
          debugPrint('Nav interstitial failed to load: $err');
          FirebaseAnalytics.instance.logEvent(
            name: 'ad_failed_to_load',
            parameters: {'placement': 'nav_tab', 'ad_format': 'interstitial'},
          );
        },
      ),
    );
  }


  void changeTab(int index) {
    if (index == _selectedIndex.value) return;
    _selectedIndex.value = index;
    AdManager.onNavigationAction();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    _interstitialAd?.dispose();
    super.onClose();
  }
}
