import 'package:alarm_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? textSize;
  final double? textHeight;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final TextAlign? align;
  final int? maxLines;
  final String? fontFamily;
  final bool? isLogo;

  const AppText({
    super.key,
    required this.text,
    this.color,
    this.textSize,
    this.fontWeight,
    this.maxLines,
    this.textDecoration,
    this.textHeight = 1.2,
    this.fontFamily,
    this.align,
    this.isLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: appTextStyle(
          context: context,
          color: color,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          textDecoration: textDecoration,
          textHeight: textHeight ?? 1.2,
          textSize: textSize),
    );
  }
}
