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
          Radius.circular(4),
        ),
        border: Border.all(
          color: Colors.black,
          width: 1.w,
        ),
      ),
      margin: EdgeInsets.all(10),
      child: AppEmojiNetwork(url: url),
    );
  }
}
