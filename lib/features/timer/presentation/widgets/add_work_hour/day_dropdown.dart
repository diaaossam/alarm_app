import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/features/timer/domain/entities/all_days_entity.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:alarm_app/widgets/app_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayDropDown extends StatelessWidget {
  const DayDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      listener: (context, state) {},
      builder: (context, state) {
        TimerCubit cubit = BlocProvider.of<TimerCubit>(context);
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.bodyHeight * .02))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                barrierLabel: "أختر اليوم",
                hint: const AppText(text: "أختر اليوم", color: Colors.grey, textSize: 14),
                items: cubit.allDayList
                    .map((item) => DropdownMenuItem<AllDaysEntity>(
                          value: item,
                          child: AppText(
                            text: item.title,
                          ),
                        ))
                    .toList(),
                value: cubit.allDaysEntity,
                onChanged: (value1) => cubit.chooseDay(value: value1 as AllDaysEntity),
              ),
            ));
      },
    );
  }
}
