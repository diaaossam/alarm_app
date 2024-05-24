import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'presentation/widgets/add_hour_dialog_body.dart';

class TimerHelper {
  String convertDayIdToName({required int id}) {
    switch (id) {
      case 1:
        return "السيت";
      case 2:
        return "الأحد";
      case 3:
        return "الأثنين";
      case 4:
        return "الثلاثاء";
      case 5:
        return "الأربعاء";
      case 6:
        return "الخميس";
      case 7:
        return "الجمعة";
      default:
        return "Invalid Day";
    }
  }

  Future<void> showAddHourDialog({required BuildContext context}) async {
    showCupertinoModalBottomSheet(
            context: context,
            topRadius: const Radius.circular(30),
            builder: (BuildContext context) => Container(
                  height: SizeConfig.bodyHeight * .8,
                  width: double.infinity,
                  margin: screenPadding(),
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.bodyHeight * .04,
                      horizontal: SizeConfig.screenWidth * .04),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Scaffold(
                    body: AddHourDialogBody(),
                  ),
                ))
        .then((value) => BlocProvider.of<TimerCubit>(context).onCloseDialog());
  }
}
