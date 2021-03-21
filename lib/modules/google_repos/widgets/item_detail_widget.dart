import 'package:challenge/shared/models/google_repos.dart';
import 'package:challenge/shared/themes/app_colors.dart';
import 'package:challenge/shared/themes/app_sized_box.dart';
import 'package:challenge/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailWidget extends StatelessWidget {
  final GoogleRepos googleRepos;
  final int index;
  const ItemDetailWidget({
    Key key,
    this.googleRepos,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
        border: Border.all(
          color: AppColors.blue,
          width: 2.w,
        ),
      ),
      margin: EdgeInsets.all(10.sp),
      child: Column(
        children: [
          AppSizedBox.height_6,
          Text(
            'Index List: $index',
            style: AppTextStyle.small(
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSizedBox.height_6,
          Text(
            'ID: ${googleRepos.id}',
            style: AppTextStyle.small(
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSizedBox.height_6,
          Text(
            'FULL_URL GIT:',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.small(
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${googleRepos.full_name}',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.small(
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
