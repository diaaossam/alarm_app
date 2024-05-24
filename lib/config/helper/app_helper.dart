
import 'package:alarm_app/config/dependencies/core_di.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../core/utils/app_strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'locale_helper/locale_cubit/locale_cubit.dart';


class AppHelper {
  static List<SingleChildWidget> providers = [
    BlocProvider(create: (context) => LocaleCubit()..getSavedLanguage()),
    BlocProvider(create: (context) => sl<TimerCubit>()),
  ];

  static Iterable<LocalizationsDelegate<dynamic>> locales = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static Iterable<Locale> supportedLocales = [
    const Locale(AppStrings.englishCode),
    const Locale(AppStrings.arabicCode),
  ];

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale> supportLang) {
    for (var supportedLan in supportLang) {
      if (supportedLan.languageCode == locale!.languageCode &&
          supportedLan.countryCode == locale.countryCode) {
        return supportedLan;
      }
    }
    return supportLang.first;
  }
}
