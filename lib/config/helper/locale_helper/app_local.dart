import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'app_delegate.dart';

String setTranslate({required BuildContext context, required String key}) {
  return AppLocalization.of(context)!.translate(key);
}

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static const LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationDelegate();

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  late Map<String, String> _localizationString;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    _localizationString = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizationString[key] ?? '';
  }
}
