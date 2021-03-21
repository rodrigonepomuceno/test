import 'package:challenge/shared/themes/app_colors.dart';
import 'package:challenge/shared/widgets/app_emoji_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppContainerImage extends StatelessWidget {
  const AppContainerImage({
    Key key,
    @required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
        border: Border.all(
          color: AppColors.blue,
          width: 2.w,
        ),
      ),
      child: AppEmojiNetwork(url: url),
    );
  }
}
