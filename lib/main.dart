import 'package:alarm_app/config/environment/environment_helper.dart';
import 'package:alarm_app/config/helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
import 'config/dependencies/injection_container.dart';
import 'config/helper/locale_helper/locale_cubit/bloc_observer.dart';
import 'core/utils/api_config.dart';

 Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await FirebaseHelper().initFirebaseServices();
  await InjectionContainer.initDependenciesInjection();
  await dotenv.load(fileName:Environment.fileName);
  ApiConfig().init();
  //await NotificationService().initNotification();
  runApp(const MyApp());
}
