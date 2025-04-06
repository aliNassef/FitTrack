import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class AppLocalizations {
  // Get the system locale
  Future<Locale> findSystemLocale() async {
    final systemLocale = ui.PlatformDispatcher.instance.locale;
    if (systemLocale.languageCode == 'ar') {
      return Locale('ar');
    } else {
      return Locale('en');
    }
  }

  // Check if the current locale is Arabic
  bool isArabic(BuildContext context);

  // Change the locale dynamically
  Future<void> changeLocale(BuildContext context, Locale newLocale);

  // Get the text direction (LTR or RTL)
  TextDirection getTextDirection(Locale locale);

  // Get the locale name as a string
  String getLocaleName(Locale locale);
}

class AppLocalizationsImpl extends AppLocalizations {
  @override
  bool isArabic(BuildContext context) {
    return context.locale.languageCode == 'ar';
  }

  @override
  Future<void> changeLocale(BuildContext context, Locale newLocale) async {
    await EasyLocalization.of(context)!.setLocale(newLocale);
  }

  @override
  TextDirection getTextDirection(Locale locale) {
    return locale.languageCode == 'ar' ? TextDirection.RTL : TextDirection.LTR;
  }

  @override
  String getLocaleName(Locale locale) {
    return locale.languageCode == 'ar' ? 'ar' : 'en';
  }
}
