import 'package:alarm_app/core/error/failures.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_days_model.dart';
import 'package:alarm_app/features/timer/domain/entities/all_days_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TimerRepository {
  Future<Either<Failure,List<AllDaysEntity>>> getAllDays();
  Future<Either<Failure,String>> completeRegister({required WorkingDaysModel workingDaysModel});
}