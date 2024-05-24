import 'package:alarm_app/core/utils/app_size.dart';
import 'package:flutter/material.dart';
class CustomHorizontalGap extends StatelessWidget {
  final double ? width;
  const CustomHorizontalGap({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width ?? SizeConfig.screenWidth*.04,);
  }
}
