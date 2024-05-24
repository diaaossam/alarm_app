import 'package:alarm_app/core/error/failures.dart';
import 'package:alarm_app/core/services/network/netwok_info.dart';
import 'package:alarm_app/core/utils/app_strings.dart';
import 'package:alarm_app/features/timer/data/datasources/timer_locale_data_source.dart';
import 'package:alarm_app/features/timer/data/datasources/timer_remote_data_source.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_days_model.dart';
import 'package:alarm_app/features/timer/domain/entities/all_days_entity.dart';
import 'package:alarm_app/features/timer/domain/repositories/timer_repo.dart';
import 'package:dartz/dartz.dart';

class TimerRepositoryImpl implements TimerRepository {
  final NetworkInfo networkInfo;
  final TimerRemoteDataSource timerRemoteDataSource;
  final TimerLocaleDataSource timerLocaleDataSource;

  TimerRepositoryImpl(
      {required this.networkInfo,
      required this.timerRemoteDataSource,
      required this.timerLocaleDataSource});

  @override
  Future<Either<Failure, List<AllDaysEntity>>> getAllDays() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await timerRemoteDataSource.getAllDays();
        final workDaysList = convertFromModelToEntityAllDays(response);
        return right(workDaysList);
      } catch (error) {
        return left(ServerFailure(msg: error.toString()));
      }
    } else {
      // Handle Locale Data Source
      return left(const ServerFailure(msg: AppStrings.notConnectedToInternet));
    }
  }

  @override
  Future<Either<Failure, String>> completeRegister(
      {required WorkingDaysModel workingDaysModel}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await timerRemoteDataSource.completeRegister(
            workingDaysModel: workingDaysModel);
        return right(response);
      } catch (error) {
        return left(ServerFailure(msg: error.toString()));
      }
    } else {
      // Handle Locale Data Source
      return left(const ServerFailure(msg: AppStrings.notConnectedToInternet));
    }
  }
}
