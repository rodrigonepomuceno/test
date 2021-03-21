import 'package:challenge/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppListTile extends StatelessWidget {
  final Widget body;
  final Widget trailing;
  final Color backgroundColor;
  final double height;
  final double horizontalPadding;

  const AppListTile({
    Key key,
    this.body,
    this.trailing,
    this.backgroundColor,
    this.height,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: backgroundColor ?? AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 10.h,
                bottom: 10.h,
                left: horizontalPadding ?? 16.w,
                right: horizontalPadding ?? 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: body ?? Container()),
                if (trailing != null)
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: trailing,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
