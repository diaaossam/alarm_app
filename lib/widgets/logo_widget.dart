import 'package:alarm_app/core/utils/app_assets.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.appLogo,
      height: SizeConfig.bodyHeight*.04,
      width: SizeConfig.screenWidth*.1,
    );
  }
}
