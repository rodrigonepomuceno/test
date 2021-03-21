import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final Function onTap;
  final TextStyle hintStyle;
  final TextStyle style;
  final int maxLines;
  final int minLines;
  final bool enabled;

  const AppTextFormField({
    @required this.hintText,
    @required this.controller,
    @required this.textInputType,
    this.onTap,
    this.hintStyle,
    this.style,
    this.maxLines = 1,
    this.minLines = 1,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onTap: onTap,
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLines,
      minLines: minLines,
      showCursor: true,
      style: style,
      decoration: InputDecoration.collapsed(
        hintText: hintText,
        hintStyle: hintStyle,
      ),
    );
  }
}
