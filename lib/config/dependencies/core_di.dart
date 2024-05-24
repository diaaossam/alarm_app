import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:alarm_app/core/api/app_interceptors.dart';
import 'package:alarm_app/core/api/dio_consumer.dart';
import 'package:alarm_app/core/api/http_consumer.dart';
import 'package:alarm_app/core/services/app_info_service/app_info_service.dart';
import 'package:alarm_app/core/services/network/netwok_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        connectionChecker: sl(),
      ));

  sl.registerLazySingleton(() => DioConsumer(
        client: sl(),
      ));
  //sl.registerLazySingleton(() => DbService());
  //sl.registerLazySingleton(() => PurchasesConsumer());
  sl.registerLazySingleton(() => MapClientConsumer());
 // sl.registerLazySingleton(() => UpdateAppService(packageInfo: sl(), remoteConfig: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => packageInfo);
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
 // sl.registerLazySingleton(() => FirebaseRemoteConfig.instance);
  sl.registerLazySingleton(() => AppInfoService(packageInfo: sl()));
  //sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => Dio()
/*  sl.registerLazySingleton(() => FirebaseMessaging.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => ImagePicker(),*/
  );
}
