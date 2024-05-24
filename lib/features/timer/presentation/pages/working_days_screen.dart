import 'package:alarm_app/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:alarm_app/features/timer/presentation/widgets/working_days_body.dart';
import 'package:alarm_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkingDaysScreen extends StatelessWidget {
  const WorkingDaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: context.localizations.workSchedule,
          ),
          body: const WorkingDaysBody(),
        );
      },
    );
  }
}
