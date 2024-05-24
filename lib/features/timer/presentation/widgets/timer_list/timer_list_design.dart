import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:alarm_app/features/timer/presentation/widgets/timer_list/timer_item_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerListDesign extends StatelessWidget {
  const TimerListDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        TimerCubit cubit = BlocProvider.of<TimerCubit>(context);
        return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => DayItemDesign(
                    workingDaysEntity: cubit.workingDaysList[index]),
                separatorBuilder: (context, index) => SizedBox(
                      height: SizeConfig.bodyHeight * .02,
                    ),
                itemCount: cubit.workingDaysList.length));
      },
    );
  }
}
