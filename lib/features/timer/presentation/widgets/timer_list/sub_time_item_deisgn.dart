import 'package:alarm_app/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_strings.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_time.dart';
import 'package:alarm_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class SubTimeItemDesign extends StatelessWidget {
  final WorkingTime workingTimeEntity;
  const SubTimeItemDesign({super.key, required this.workingTimeEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: AppText(
            text: "${workingTimeEntity.timeFrom} ${context.localizations.am}",
            color: AppColors.green,
            fontFamily: AppStrings.arabicFont2,
            textSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: AppText(
            text: "${workingTimeEntity.timeTo} ${context.localizations.pm}",
            color: AppColors.primaryOrange,
            fontFamily: AppStrings.arabicFont2,
            textSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
