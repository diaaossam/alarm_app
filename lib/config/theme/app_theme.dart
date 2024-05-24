import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/core/utils/app_strings.dart';

class ThemeManger {
  static ThemeData appTheme() {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppColors.black),
          headlineMedium: TextStyle(color: AppColors.iconGrey)),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.iconGrey,
          ),
          actionsIconTheme: IconThemeData(
            color: AppColors.iconGrey,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white)),
      fontFamily: AppStrings.englishFont,
      inputDecorationTheme: InputDecorationTheme(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        disabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 5.0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
              fontSize: 10),
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.black),
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.primary,
        primary: AppColors.primary,
        brightness: Brightness.light,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        primaryContainer: AppColors.lightGrey,
        error: AppColors.black,
        onError: Colors.white,
        background: Colors.blue,
        onBackground: Colors.white,
        surface: Colors.pink,
        onSurface: Colors.white,
      ),
    );
  }

  static ThemeData blackTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primaryDark,
      textTheme: TextTheme(
          bodyMedium: const TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: AppColors.iconGrey)),
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.primaryDark,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white)),
      fontFamily: AppStrings.englishFont,
      inputDecorationTheme: InputDecorationTheme(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        disabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
      ),
      primaryColor: AppColors.primary,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 5.0,
          backgroundColor: const Color(0xff1f1a2a),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.lightGrey),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.primary,
        primary: AppColors.primary,
        brightness: Brightness.light,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        primaryContainer: AppColors.lightGrey,
        error: Colors.black,
        onError: Colors.white,
        background: Colors.blue,
        onBackground: Colors.white,
        surface: Colors.pink,
        onSurface: Colors.white,
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );
}

OutlineInputBorder buildMainBuild() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff979797), width: 1),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
}

OutlineInputBorder buildErrorBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius:
        BorderRadius.all(Radius.circular(SizeConfig.bodyHeight * .02)),
  );
}

TextStyle mainTFFTextStyle(context, {Color? color, bool isEnabled = true}) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: AppStrings.arabicFont,
          overflow: TextOverflow.ellipsis,
          color: color ?? AppColors.black,
          fontSize: 14,
        );

TextStyle hintTFFTextStyle({Color? color}) => TextStyle(
      color: color ?? AppColors.iconGrey,
      fontSize: 12,
    );

TextStyle labelTFFTextStyle(bool isFloating) => TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    fontFamily: AppStrings.arabicFont);

TextStyle appTextStyle(
    {required BuildContext context,
    double textHeight = 1.2,
    TextDecoration? textDecoration,
    Color? color,
    String? fontFamily,
    FontWeight? fontWeight,
    double? textSize}) {
  return Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontFamily: fontFamily??AppStrings.arabicFont,
        overflow: TextOverflow.ellipsis,
        height: textHeight,
        decoration: textDecoration,
        color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
        fontSize: textSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
      );
}
