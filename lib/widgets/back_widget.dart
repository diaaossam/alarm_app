import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alarm_app/core/utils/app_assets.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/widgets/rotate.dart';

class BackArrowWidget extends StatelessWidget {
  final VoidCallback callback;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? margin;

  const BackArrowWidget(
      {super.key, required this.callback, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(14),
        child: Rotate(child: SvgPicture.asset("")),
      ),
    );
  }
}
