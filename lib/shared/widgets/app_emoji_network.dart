import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppEmojiNetwork extends StatelessWidget {
  final String url;
  const AppEmojiNetwork({
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: url,
        placeholder: (context, url) => CircularProgressIndicator(
              value: 10,
            ),
        errorWidget: (context, url, error) =>
            Image.asset('assets/notfound.png'));
  }
}
