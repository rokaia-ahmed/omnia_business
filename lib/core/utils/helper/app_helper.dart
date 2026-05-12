import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../network/local/cache/chace_helper.dart';
import '../app_locales.dart';

class AppHelper {
  /// CLOSE KEYBOARD
  static Future closeKeyboard() async {
    /// CLOSE KEYBOARD
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void changeLanguage( BuildContext context, String lang) async {
    await CacheHelper.saveData('lang', lang).then((value) async {
      AppLocales.setDeviceLocale(context, lang == 'ar' ? 0 : 1);
      navigatorKey.currentContext?.setLocale(lang == 'ar' ? const Locale('ar', 'EG') : const Locale('en', 'US'));
    });
    //AppNavigator.replace(screen: LayoutScreen(), context: context);
  }


  /*static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied');
    }

    return await Geolocator.getCurrentPosition(
      locationSettings:  LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }*/

  /// FORMAT TIME
  static String formatTime(TimeOfDay time ){
    final hour = time.hourOfPeriod.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';

    return '$hour:$minute $period';
  }

  /// URL LAUNCHER
  /*static void launchURL(String url) async {
    Uri uRl = Uri.parse(url);
    if (!await launchUrl(uRl,
      mode: LaunchMode.externalApplication,)) {
      throw ' can\'t launch the URL.$uRl';
    }
  }*/

}