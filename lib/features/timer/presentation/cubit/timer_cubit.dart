import 'package:alarm_app/features/timer/data/models/working_days_model/working_day.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_days_model.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_time.dart';
import 'package:alarm_app/features/timer/domain/entities/all_days_entity.dart';
import 'package:alarm_app/features/timer/domain/entities/hour_item_entity.dart';
import 'package:alarm_app/features/timer/domain/repositories/timer_repo.dart';
import 'package:alarm_app/features/timer/domain/usecases/complete_register_use_case.dart';
import 'package:alarm_app/features/timer/domain/usecases/get_all_days_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final GetAllDaysUseCase getAllDaysUseCase;
  final CompleteRegisterUseCase completeRegisterUseCase;

  TimerCubit(this.getAllDaysUseCase, this.completeRegisterUseCase)
      : super(TimerInitial());

  List<AllDaysEntity> allDayList = [];

  Future<void> getAllDays() async {
    emit(GetAllDaysLoading());
    allDayList.clear();
    final response = await getAllDaysUseCase();

    emit(response.fold((l) => GetAllDaysFailure(errorMsg: l.msg), (r) {
      allDayList = r;
      return GetAllDaysSuccess(list: r);
    }));
  }

  AllDaysEntity? allDaysEntity;

  void chooseDay({required AllDaysEntity value}) {
    allDaysEntity = value;
    if (hourItemList.isEmpty) {
      addNewHourItem();
    }
    emit(ChooseDayState(allDaysEntity: value));
  }

  /////
  List<HourItemEntity> hourItemList = [];

  void addNewHourItem() {
    HourItemEntity hourItemEntity = HourItemEntity(
        from: TextEditingController(), to: TextEditingController());
    hourItemList.add(hourItemEntity);
    emit(AddNewHourWorkState(hourItemEntity: hourItemEntity));
  }

  List<WorkingDay> workingDaysList = [
    WorkingDay(isTitle: true),
  ];

  void confirmDialogData() {
    List<WorkingTime> workingTimeList = [];
    for (var element in hourItemList) {
      WorkingTime workingTime = WorkingTime(
          dayId: allDaysEntity?.id,
          timeTo: element.to.text,
          timeFrom: element.from.text);
      workingTimeList.add(workingTime);
    }
    WorkingDay workingDay = WorkingDay(
      dayId: allDaysEntity?.id,
      isHoliday: 0,
      workingTimes: workingTimeList,
    );
    workingDaysList.add(workingDay);
    emit(AddNewDayState(workingDay: workingDay));
  }

  void removeItemFromWorking({required WorkingDay workingDaysEntity}){
    workingDaysList.remove(workingDaysEntity);
    emit(RemoveItemFromWorkingDay(workingDaysEntity: workingDaysEntity));
  }

  void changeDayHoliday({required int dayId, required int isHoliday}) {
    for (var element in workingDaysList) {
      if (element.dayId == dayId) {
        element.isHoliday = isHoliday == 0 ? 1 : 0;
      }
    }
    emit(ChangeHolidayState(isHoliday: isHoliday, dayId: dayId));
  }

  Future<void> completeRegister() async {
    emit(CompleteRegisterLoading());
    WorkingDaysModel workingDaysModel =
        WorkingDaysModel(workingDays: workingDaysList);
    final response =
        await completeRegisterUseCase(workingDaysModel: workingDaysModel);
    emit(response.fold((l) => CompleteRegisterFailure(error: l.msg),
        (r) => CompleteRegisterSuccess(msg: r)));
  }

  void onCloseDialog(){
    allDaysEntity = null;
    hourItemList.clear();
    emit(ClearAllData());
  }
}
