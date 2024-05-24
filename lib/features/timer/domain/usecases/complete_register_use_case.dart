import 'package:alarm_app/core/error/failures.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_days_model.dart';
import 'package:alarm_app/features/timer/domain/repositories/timer_repo.dart';
import 'package:dartz/dartz.dart';

class CompleteRegisterUseCase {
  final TimerRepository timerRepository;

  CompleteRegisterUseCase({required this.timerRepository});

  Future<Either<Failure, String>> call(
      {required WorkingDaysModel workingDaysModel}) async {
    return await timerRepository.completeRegister(
        workingDaysModel: workingDaysModel);
  }
}
