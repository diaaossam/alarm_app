import 'package:shared_preferences/shared_preferences.dart';

abstract class TimerLocaleDataSource {

}
class TimerLocaleDataSourceImpl implements TimerLocaleDataSource{
  final SharedPreferences sharedPreferences;

  TimerLocaleDataSourceImpl(this.sharedPreferences);
}