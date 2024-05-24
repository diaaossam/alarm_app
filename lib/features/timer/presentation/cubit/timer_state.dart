part of 'timer_cubit.dart';

abstract class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object> get props => [];
}

class TimerInitial extends TimerState {}

class GetAllDaysLoading extends TimerState {}

class GetAllDaysSuccess extends TimerState {
  final List<AllDaysEntity> list;

  const GetAllDaysSuccess({required this.list});

  @override
  List<Object> get props => [list];
}

class GetAllDaysFailure extends TimerState {
  final String errorMsg;

  const GetAllDaysFailure({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class ChooseDayState extends TimerState {
  final AllDaysEntity allDaysEntity;

  const ChooseDayState({required this.allDaysEntity});

  @override
  List<Object> get props => [allDaysEntity];
}

class AddNewHourWorkState extends TimerState {
  final HourItemEntity hourItemEntity;

  const AddNewHourWorkState({required this.hourItemEntity});

  @override
  List<Object> get props => [hourItemEntity];
}

class AddNewDayState extends TimerState {
  final WorkingDay workingDay;

  const AddNewDayState({required this.workingDay});

  @override
  List<Object> get props => [workingDay];
}

class ChangeHolidayState extends TimerState {
  final int dayId;

  final int isHoliday;

  const ChangeHolidayState({required this.dayId, required this.isHoliday});

  @override
  List<Object> get props => [dayId, isHoliday];
}
class RemoveItemFromWorkingDay extends TimerState {
  final WorkingDay workingDaysEntity;

  const RemoveItemFromWorkingDay({required this.workingDaysEntity});

}

class CompleteRegisterLoading extends TimerState {}

class CompleteRegisterSuccess extends TimerState {
  final String msg;

  const CompleteRegisterSuccess({required this.msg});

  @override
  List<Object> get props => [msg];
}

class CompleteRegisterFailure extends TimerState {
  final String error;

  const CompleteRegisterFailure({required this.error});

  @override
  List<Object> get props => [error];
}


class ClearAllData extends TimerState {}
