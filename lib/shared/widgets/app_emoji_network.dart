import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEmojiNetwork extends StatelessWidget {
  final String url;
  const AppEmojiNetwork({
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ? Container(
            margin: EdgeInsets.all(5.sp),
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl: url,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Container(
                margin: EdgeInsets.all(5.sp),
                child: Image.asset(
                  'assets/notfound.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.all(5.sp),
            child: Image.asset(
              'assets/notfound.png',
              fit: BoxFit.contain,
            ),
          );
  }
}
