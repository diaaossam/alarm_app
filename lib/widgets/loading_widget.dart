import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:alarm_app/core/utils/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  final Color ? color;
  const LoadingWidget({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid){
      return Center(child: CircularProgressIndicator(color: color??AppColors.primary));
    }else if(Platform.isIOS){
      return const Center(child: CupertinoActivityIndicator());
    }
    return Center(
      child: SpinKitRipple(color: AppColors.primary),
    );
  }
}
