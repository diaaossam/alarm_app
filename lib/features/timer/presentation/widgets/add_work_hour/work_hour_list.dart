import 'package:alarm_app/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:alarm_app/core/utils/app_assets.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/core/utils/app_strings.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:alarm_app/features/timer/timer_helper.dart';
import 'package:alarm_app/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'work_hour_item.dart';

class WorkHourListDesign extends StatelessWidget {
  const WorkHourListDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      listener: (context, state) {},
      builder: (context, state) {
        TimerCubit cubit = BlocProvider.of<TimerCubit>(context);
        return Expanded(
          child: Column(
            children: [
          /*    ...List.generate(cubit.hourItemList.length, (index) => WorkHourItem(
                hourItemEntity: cubit.hourItemList[index],
              )),*/
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemBuilder: (context, index) => WorkHourItem(
                          hourItemEntity: cubit.hourItemList[index],
                        ),
                    itemCount: cubit.hourItemList.length),
              ),
              SizedBox(
                height: SizeConfig.bodyHeight * .02,
              ),
              Visibility(
                visible: cubit.hourItemList.isNotEmpty,
                child: GestureDetector(
                  onTap: () => cubit.addNewHourItem(),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.plus),
                      AppText(
                        text: context.localizations.addAnotherPeriod,
                        fontFamily: AppStrings.arabicFont2,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryOrange,
                        textSize: 12,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
