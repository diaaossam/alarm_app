import 'package:alarm_app/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_strings.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_day.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:alarm_app/features/timer/presentation/widgets/switch_button_design.dart';
import 'package:alarm_app/features/timer/presentation/widgets/timer_list/sub_time_list_deisgn.dart';
import 'package:alarm_app/features/timer/timer_helper.dart';
import 'package:alarm_app/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DayItemDesign extends StatelessWidget {
  final WorkingDay workingDaysEntity;

  const DayItemDesign({super.key, required this.workingDaysEntity});

  @override
  Widget build(BuildContext context) {
    if (workingDaysEntity.isTitle) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: AppText(
              text: context.localizations.today,
              color: AppColors.black,
            )),
            Expanded(
                child: AppText(
              text: context.localizations.from,
              color: AppColors.black,
            )),
            Expanded(
                child: AppText(
              text: context.localizations.to,
              color: AppColors.black,
            )),
          ],
        ),
      );
    }
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Dismissible(
          onDismissed: (direction) => BlocProvider.of<TimerCubit>(context).removeItemFromWorking(workingDaysEntity: workingDaysEntity),
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.delete,color: Colors.white,),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: AppText(
                text: TimerHelper()
                    .convertDayIdToName(id: workingDaysEntity.dayId ?? 0),
                color: AppColors.black,
                fontWeight: FontWeight.w400,
                fontFamily: AppStrings.arabicFont,
              )),
              SubTimeListDesign(list: workingDaysEntity.workingTimes ?? []),
              CustomSwitch(
                isOn: workingDaysEntity.isHoliday == 0,
                onChanged: (value) {
                  BlocProvider.of<TimerCubit>(context).changeDayHoliday(
                      dayId: workingDaysEntity.dayId ?? 0,
                      isHoliday: workingDaysEntity.isHoliday ?? 0);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
