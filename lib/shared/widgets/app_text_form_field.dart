import 'package:challenge/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final TextInputAction textInputAction;
  final Function onTap;
  final TextStyle hintStyle;
  final TextStyle style;
  final int maxLines;
  final int minLines;
  final Function onEditingComplete;
  final bool enabled;
  final Key fieldKey;
  final bool obscureText;

  const AppTextFormField({
    @required this.hintText,
    @required this.controller,
    @required this.textInputType,
    this.onTap,
    this.textInputAction,
    this.hintStyle,
    this.style,
    this.maxLines = 1,
    this.minLines = 1,
    this.onEditingComplete,
    this.fieldKey,
    this.obscureText = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fieldKey,
      child: Theme(
        data: Theme.of(context).copyWith(
          cursorColor: AppColors.black,
          primaryColor: AppColors.gray1,
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: TextStyle(
              color: AppColors.red,
            ),
          ),
        ),
        child: TextFormField(
          obscureText: obscureText,
          enabled: enabled,
          onEditingComplete: onEditingComplete,
          onTap: onTap,
          controller: controller,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          maxLines: maxLines,
          minLines: minLines,
          showCursor: true,
          style: style,
          decoration: InputDecoration.collapsed(
            hintText: hintText,
            hintStyle: hintStyle,
          ),
        ),
      ),
    );
  }
}
