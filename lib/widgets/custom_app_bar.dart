import 'package:flutter/material.dart';
import 'package:alarm_app/config/helper/locale_helper/app_local.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:alarm_app/widgets/app_text.dart';
import 'package:alarm_app/widgets/back_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? pressIcon;
  final String? title;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final bool? isCenterTitle;

  const CustomAppBar(
      {super.key,
      this.pressIcon,
      this.title,
      this.actions,
      this.titleWidget,
      this.isCenterTitle = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: SizeConfig.screenWidth * .2,
      centerTitle: isCenterTitle,
      title: titleWidget ?? AppText(
            text: title??"",
            color: AppColors.black,
            textSize: 16,
            fontWeight: FontWeight.bold,
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);
}
