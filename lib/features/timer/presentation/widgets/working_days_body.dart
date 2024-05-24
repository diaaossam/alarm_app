import 'package:alarm_app/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:alarm_app/core/utils/app_constant.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:alarm_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'timer_header_design.dart';
import 'timer_list/timer_list_design.dart';

class WorkingDaysBody extends StatelessWidget {
  const WorkingDaysBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      listener: (context, state) {
       if(state is CompleteRegisterFailure){
         AppConstant.showCustomSnakeBar(context, state.error, false);
       }else if(state is CompleteRegisterSuccess){
         AppConstant.showCustomSnakeBar(context, state.msg, true);
       }
      },
      builder: (context, state) {
        return Padding(
          padding: screenPadding(),
          child: Column(
            children: [
              const TimerHeaderDesign(),
              SizedBox(height: SizeConfig.bodyHeight * .04,),
              const TimerListDesign(),
              CustomButton(
                  isLoading: state is CompleteRegisterLoading,
                  text: context.localizations.next,
                  press: () =>
                      BlocProvider.of<TimerCubit>(context).completeRegister()),
              SizedBox(height: SizeConfig.bodyHeight * .04,),
            ],
          ),
        );
      },
    );
  }
}
