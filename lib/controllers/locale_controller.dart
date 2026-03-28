import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends GetxController {
  static const _key = 'selectedLocale';

  final Rx<Locale> currentLocale;

  LocaleController({Locale initialLocale = const Locale('en')})
      : currentLocale = initialLocale.obs;

  Future<void> setLocale(String languageCode) async {
    final newLocale = Locale(languageCode);
    currentLocale.value = newLocale;
    Get.updateLocale(newLocale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, languageCode);
  }

  /// Call before runApp to get the persisted locale.
  static Future<Locale?> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key);
    return code != null ? Locale(code) : null;
  }

  static Future<bool> hasLocaleBeenSelected() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_key);
  }
}
