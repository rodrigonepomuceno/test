import 'package:challenge/shared/themes/app_colors.dart';
import 'package:challenge/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class ErrorLoadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70),
        child: Text(
          'Something went wrong in the query with the API.',
          textAlign: TextAlign.center,
          style: AppTextStyle.h2(color: AppColors.blue),
        ),
      ),
    );
  }
}
