import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'sub_time_item_deisgn.dart';

class SubTimeListDesign extends StatelessWidget {
  final List<WorkingTime> list;

  const SubTimeListDesign({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView.separated(
        itemBuilder: (context, index) => SubTimeItemDesign(workingTimeEntity: list[index],),
        separatorBuilder: (context, index) => SizedBox(
          height: SizeConfig.bodyHeight * .02,
        ),
        shrinkWrap: true,
        itemCount: list.length,
      ),
    );
  }
}
