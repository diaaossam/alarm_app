import 'package:shared_preferences/shared_preferences.dart';
import 'app_strings.dart';

class ApiConfig {
  static late String userToken;
  static late String userId;
  static late String langCode;
  static late bool isArabic;
  static late bool isCompany;
  static late bool isSubscribed;

  Future<void> init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userToken = sharedPreferences.getString(AppStrings.userToken) ?? AppStrings.defaultValue;
    langCode = sharedPreferences.getString(AppStrings.locale) ?? AppStrings.arabicCode;
    isCompany = sharedPreferences.getBool(AppStrings.accountType) ?? false;
    isSubscribed = sharedPreferences.getBool(AppStrings.isSubscribed) ?? false;
    if(langCode == AppStrings.arabicCode){
      isArabic = true;
    }
    else{
      isArabic = false;
    }
  }

  Future<void> clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  bool getAppTheme(SharedPreferences sharedPreferences) {
    final cachedTheme = sharedPreferences.getInt(AppStrings.cachedAppTheme);
    if (cachedTheme == null) {
      return false;
    } else {
      if (cachedTheme == 0) {
        return false;
      } else if (cachedTheme == 1) {
        return true;
      } else if (cachedTheme == 2) {
        return false;
      } else {
        return false;
      }
    }
  }
}
