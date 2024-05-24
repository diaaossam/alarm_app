import 'package:alarm_app/features/timer/data/datasources/timer_locale_data_source.dart';
import 'package:alarm_app/features/timer/data/datasources/timer_remote_data_source.dart';
import 'package:alarm_app/features/timer/data/repositories/timer_repo_impl.dart';
import 'package:alarm_app/features/timer/domain/repositories/timer_repo.dart';
import 'package:alarm_app/features/timer/domain/usecases/complete_register_use_case.dart';
import 'package:alarm_app/features/timer/domain/usecases/get_all_days_use_case.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';

import 'core_di.dart';

Future<void> init() async {
  ///Features
  sl.registerFactory(() => TimerCubit(
        sl(),
        sl(),
      ));

  //UseCases
  sl.registerLazySingleton(() => GetAllDaysUseCase(timerRepository: sl()));
  sl.registerLazySingleton(() => CompleteRegisterUseCase(timerRepository: sl()));

  //Repository
  sl.registerLazySingleton<TimerRepository>(() => TimerRepositoryImpl(
      networkInfo: sl(),
      timerLocaleDataSource: sl(),
      timerRemoteDataSource: sl()));

  //DataSource
  sl.registerLazySingleton<TimerRemoteDataSource>(
      () => TimerRemoteDataSourceImpl(dioConsumer: sl()));
  sl.registerLazySingleton<TimerLocaleDataSource>(
      () => TimerLocaleDataSourceImpl(sl()));
}
