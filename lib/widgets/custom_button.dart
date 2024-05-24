import 'dart:io';

import 'package:flutter/material.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_size.dart';

import 'app_text.dart';
import 'loading_widget.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.textSize,
    required this.press,
    this.isActive = true,
    this.iconData,
    this.iconColor,
    this.width,
    this.radius,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.height,
  }) : super(key: key);
  final String? text;
  final VoidCallback press;
  final double? width;
  final double? height;
  final double? textSize;
  final bool isActive;
  final double? radius;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final IconData? iconData;
  final bool? isLoading;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.isActive,
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height == null
            ? getProportionateScreenHeight(60)
            : getProportionateScreenHeight(widget.height!),
        decoration: BoxDecoration(
            boxShadow: widget.isActive
                ? null
                : [
                    BoxShadow(
                      color: const Color(0xff84988D).withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: const Offset(4, 4), // changes position of shadow
                    ),
                  ],
            border: Border.all(
                color: _setUpBorderColor(),
                width: getProportionateScreenHeight(2)),
            color: _setUpColor(),
            borderRadius: BorderRadius.circular(widget.radius == null
                ? getProportionateScreenHeight(15)
                : getProportionateScreenHeight(widget.radius!))),
        child: widget.isLoading == true
            ? const Center(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: LoadingWidget(
                    color: Colors.white,
                  ),
              ),
            )
            : MaterialButton(
                onPressed: widget.press,
                child: AppText(
                  color: widget.textColor ?? Colors.white,
                  text: widget.text!,
                  fontWeight: FontWeight.bold,
                  textSize: widget.textSize == null
                      ? Platform.isAndroid
                          ? 16.0
                          : 14.0
                      : Platform.isAndroid
                          ? (widget.textSize!)
                          : (widget.textSize! - 3),
                ),
              ),
      ),
    );
  }

  Color _setUpColor() {
    if (widget.isActive) {
      return widget.backgroundColor ?? AppColors.primary;
    } else {
      return const Color(0xffE5E5E5);
    }
  }

  Color _setUpBorderColor() {
    if (widget.isActive) {
      return widget.borderColor == null
          ? AppColors.primary
          : widget.borderColor!;
    } else {
      return const Color(0xffE5E5E5);
    }
  }
}
