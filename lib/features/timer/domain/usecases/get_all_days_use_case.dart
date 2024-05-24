import 'package:alarm_app/core/error/failures.dart';
import 'package:alarm_app/features/timer/domain/entities/all_days_entity.dart';
import 'package:alarm_app/features/timer/domain/repositories/timer_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllDaysUseCase {
  final TimerRepository timerRepository;

  GetAllDaysUseCase({required this.timerRepository});

  Future<Either<Failure, List<AllDaysEntity>>> call() async {
    return await timerRepository.getAllDays();
  }
}
