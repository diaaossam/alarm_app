import 'package:alarm_app/core/utils/app_size.dart';
import 'package:flutter/material.dart';
class CustomVerticalGap extends StatelessWidget {
  final double ? height;
  const CustomVerticalGap({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? SizeConfig.bodyHeight*.02,);
  }
}
