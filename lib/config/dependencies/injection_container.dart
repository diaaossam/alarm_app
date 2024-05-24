
import 'package:alarm_app/config/dependencies/core_di.dart' as core_di;
import 'package:alarm_app/config/dependencies/timer_di.dart' as timer_di;


class InjectionContainer {
  static Future<void> initDependenciesInjection() async {
    await core_di.init();
    await timer_di.init();

  }
}
