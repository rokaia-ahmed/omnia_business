import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../network/local/cache/chace_helper.dart';
import 'app_colors.dart';
import 'app_locales.dart';

class AppConstants{
 static Future changeLanguage(context, String lang) async {
    await CacheHelper.saveData('lang', lang).then((value) async {
      AppLocales.setDeviceLocale(context, lang == 'ar' ? 0 : 1);
      navigatorKey.currentContext?.setLocale(lang == 'ar' ? const Locale('ar', 'EG') : const Locale('en', 'US'));
    });
  }
  static OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: AppColors.borderColor,
    ),
  );
}