import 'package:challenge/shared/themes/app_colors.dart';
import 'package:challenge/shared/themes/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppFlatButton extends StatelessWidget {
  final bool active;
  final Function onPressed;
  final String lable;
  final TextStyle textStyle;
  final Color color;
  final Alignment alignment;
  final bool strech;
  final EdgeInsets margin;
  final double height;
  final double width;
  final Color textColor;

  const AppFlatButton(
      {Key key,
      this.lable,
      this.onPressed,
      this.textStyle,
      this.color,
      this.alignment,
      this.strech = true,
      this.active = true,
      this.margin,
      this.height,
      this.width,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: active ? onPressed : null,
        child: Container(
          height: height ?? 50.h,
          width: width ?? 30.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            border: Border.all(
              color: AppColors.blue,
              width: 3.w,
            ),
          ),
          margin: EdgeInsets.all(10),
          child: Center(
            child: Text(
              lable,
              style: AppTextStyle.button(
                  color: textColor ?? AppColors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
