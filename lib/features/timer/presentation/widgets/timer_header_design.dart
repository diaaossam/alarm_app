import 'package:alarm_app/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:alarm_app/core/utils/app_assets.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_strings.dart';
import 'package:alarm_app/features/timer/timer_helper.dart';
import 'package:alarm_app/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TimerHeaderDesign extends StatelessWidget {
  const TimerHeaderDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          text: context.localizations.workHours,
          fontFamily: AppStrings.arabicFont2,
          fontWeight: FontWeight.w500,
          textSize: 16,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () =>TimerHelper().showAddHourDialog(context: context),
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
      ],
    );
  }
}
