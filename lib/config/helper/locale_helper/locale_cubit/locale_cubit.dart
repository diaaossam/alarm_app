import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alarm_app/core/api/dio_consumer.dart';
import 'package:alarm_app/core/utils/api_config.dart';
import 'package:alarm_app/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  static LocaleCubit get(context) => BlocProvider.of(context);

  ///////////////////////// App Lang ////////////////////////

  Locale locale = const Locale(AppStrings.arabicCode);

  Future<void> getSavedLanguage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLangCode = sharedPreferences.getString(AppStrings.locale);
    final cachedTheme = sharedPreferences.getInt(AppStrings.cachedAppTheme);
    locale = Locale(cachedLangCode ?? AppStrings.arabicCode);
    if (cachedTheme == null) {
      isDark = false;
    } else {
      if (cachedTheme == 0) {
        isSystemTheme = true;
      } else if (cachedTheme == 1) {
        isDark = true;
      } else if (cachedTheme == 2) {
        isDark = false;
      }
    }

    emit(ChangeLocaleState());
  }

  var pageController = PageController(initialPage: 0);
  int selectedAppLang = 2;

  Future<void> toggleLanguage(int index) async {
    selectedAppLang = index;
    emit(ToggleLocaleState(index: index));
  }

  Future<void> changeLanguage(int index) async {
    selectedAppLang = index;
    final languageCode = index == 1 ? AppStrings.englishCode : AppStrings.arabicCode;
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(AppStrings.locale, languageCode);
    locale = Locale(languageCode);
    await ApiConfig().init();
    emit(ChangeLocaleState());
  }

  //////////////////// Theme ///////////////////////

  int selectedTheme = 1;
  bool isDark = false;
  bool isSystemTheme = false;

  void changeSystemTheme(value) {
    isSystemTheme = value;
    emit(SystemThemeState());
  }

  void chooseAppTheme(int index) {
    if (selectedTheme == 1) {
      isDark = true;
      selectedTheme = index;
    } else {
      isDark = false;
      selectedTheme = index;
    }
    emit(ChooseAppThemeState());
  }

  ThemeMode getThemeMode() {
    if (isSystemTheme) {
      return ThemeMode.system;
    } else {
      if (isDark) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    }
  }

  Future<void> cacheTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setInt(AppStrings.cachedAppTheme, _getAppTheme());
  }

  int _getAppTheme() {
    if (isSystemTheme) {
      return 0;
    } else {
      if (isDark) {
        return 1;
      } else {
        return 2;
      }
    }
  }
}
