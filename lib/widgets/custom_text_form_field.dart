import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alarm_app/config/theme/app_theme.dart';
import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:alarm_app/core/utils/app_size.dart';

class CustomTextFormField extends StatefulWidget {
  final TextInputType? type;
  final FormFieldValidator<String>? validate;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final void Function(String?)? onChange;
  final VoidCallback? onSuffixPressed;
  final TextEditingController? controller;
  final String? suffixIcon;
  final String? labelText;
  final String? prefixText;
  final String? hintText;
  final String? prefixIcon;
  final TextAlign align;
  final Color? prefixIconColor;
  final Color? hintTextColor;
  final bool? isEnable;
  final bool readOnly;
  final List<TextInputFormatter>? limits;
  final int? maxLines;
  final double? textSize;
  final bool isPassword;
  final bool isWithShadow;

  const CustomTextFormField({
    super.key,
    this.type = TextInputType.text,
    this.validate,
    this.padding,
    this.isWithShadow = false,
    this.onChange,
    this.limits,
    this.prefixText,
    this.textSize,
    this.align = TextAlign.start,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.suffixIcon,
    this.isPassword = false,
    this.onSuffixPressed,
    this.controller,
    this.isEnable = true,
    this.labelText,
    this.prefixIconColor,
    this.hintText,
    this.prefixIcon,
    this.hintTextColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        if (widget.controller!.selection ==
            TextSelection.fromPosition(
                TextPosition(offset: widget.controller!.text.length - 1))) {
          widget.controller!.selection = TextSelection.fromPosition(
            TextPosition(
              offset: widget.controller!.text.length,
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.align,
      showCursor: true,
      readOnly: widget.readOnly,
      inputFormatters: widget.limits,
      controller: widget.controller,
      keyboardType: widget.type,
      obscureText: widget.isPassword,
      style: mainTFFTextStyle(context, isEnabled: widget.isEnable ?? true),
      enabled: widget.isEnable,
      maxLines: widget.maxLines,
      validator: widget.validate,
      onChanged: widget.onChange,
      onTap: widget.onTap,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixText: widget.prefixText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: labelTFFTextStyle(true),
        prefixStyle: mainTFFTextStyle(context, color: AppColors.darkGrey),
        labelStyle: labelTFFTextStyle(false),
        hintText: widget.hintText,
        errorStyle: const TextStyle(color: Colors.red),
        focusedBorder: buildMainBuild(),
        border: buildMainBuild(),
        enabledBorder: buildMainBuild(),
        disabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder: buildErrorBorder(),
        errorBorder: buildErrorBorder(),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
          padding: EdgeInsets.all(SizeConfig.bodyHeight * .02),
          child: SvgPicture.asset(widget.prefixIcon!),
        ),
        hintStyle: hintTFFTextStyle(color: widget.hintTextColor),
        suffixIcon: widget.suffixIcon == null
            ? null
            : InkWell(
          onTap: widget.onSuffixPressed,
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(12.0),
            child: SvgPicture.asset(widget.suffixIcon!),
          ),
        ),
      ),
    );
  }
}
