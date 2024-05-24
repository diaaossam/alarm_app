import 'package:alarm_app/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_constant.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_day.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:alarm_app/features/timer/presentation/widgets/add_work_hour/work_hour_list.dart';
import 'package:alarm_app/widgets/app_text.dart';
import 'package:alarm_app/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_work_hour/day_dropdown.dart';

class AddHourDialogBody extends StatefulWidget {
  const AddHourDialogBody({super.key});

  @override
  State<AddHourDialogBody> createState() => _AddHourDialogBodyState();
}

class _AddHourDialogBodyState extends State<AddHourDialogBody> {
  @override
  void initState() {
    BlocProvider.of<TimerCubit>(context).getAllDays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      listener: (context, state) {
        TimerCubit cubit =BlocProvider.of<TimerCubit>(context);
        if(state is AddNewDayState){
          cubit.hourItemList.clear();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        TimerCubit cubit =BlocProvider.of<TimerCubit>(context);
        return SizedBox(
          height: SizeConfig.bodyHeight * .8,
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.arrow_back_ios),
                  SizedBox(
                    width: SizeConfig.screenWidth * .2,
                  ),
                  AppText(
                    text: context.localizations.addAntherHours,
                    fontWeight: FontWeight.bold,
                    textSize: 18,
                    color: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: AppText(text: context.localizations.today)),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              const DayDropDown(),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              const WorkHourListDesign(),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomButton(text: context.localizations.next, press: (){
                if(cubit.allDaysEntity == null){
                  AppConstant.showCustomSnakeBar(context, "من فضلك قم بإختيار اليوم", false);
                }else{
                  cubit.confirmDialogData();
                }
              }),
            ],
          ),
        );
      },
    );
  }
}
