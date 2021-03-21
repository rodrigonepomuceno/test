import 'package:challenge/shared/themes/app_colors.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle h2(
          {Color color, FontWeight fontWeight, TextDecoration decoration}) =>
      TextStyle(
        fontSize: 25.sp,
        color: color ?? AppColors.black,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: decoration,
      );
  static TextStyle small(
          {Color color, FontWeight fontWeight, TextDecoration decoration}) =>
      TextStyle(
        fontSize: 12.sp,
        color: color ?? AppColors.black,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: decoration,
      );
  static TextStyle button(
          {Color color, FontWeight fontWeight, TextDecoration decoration}) =>
      TextStyle(
        fontSize: 14.sp,
        color: color ?? AppColors.black,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: decoration,
      );
}
