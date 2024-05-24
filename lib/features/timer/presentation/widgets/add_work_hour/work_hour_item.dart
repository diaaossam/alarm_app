import 'package:alarm_app/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/features/timer/domain/entities/hour_item_entity.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:alarm_app/widgets/app_text.dart';
import 'package:alarm_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WorkHourItem extends StatelessWidget {
  final HourItemEntity hourItemEntity;
  const WorkHourItem({super.key, required this.hourItemEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
  builder: (context, state) {
    return Row(
      children: [
        Expanded(
            child: Column(
              children: [
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: AppText(text: context.localizations.from,textSize: 14,)),
                SizedBox(height: SizeConfig.bodyHeight*.01,),
                CustomTextFormField(
                  controller: hourItemEntity.from..text="08:00",
                  type: TextInputType.number,
                ),
              ],
            )),
        SizedBox(width: SizeConfig.screenWidth*.02,),
        Expanded(
            child: Column(
              children: [
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: AppText(text: context.localizations.to,textSize: 14)),
                SizedBox(height: SizeConfig.bodyHeight*.01,),
                CustomTextFormField(
                  controller: hourItemEntity.to..text="20:00",
                  type: TextInputType.number,
                ),
              ],
            )),
      ],
    );
  },
);
  }
}
