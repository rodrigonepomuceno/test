import 'package:challenge/modules/emojis_list/emojis_list_controller.dart';
import 'package:challenge/shared/widgets/app_container_emoji.dart';
import 'package:flutter/material.dart';

class EmojisGridViewWidget extends StatelessWidget {
  const EmojisGridViewWidget({
    @required this.controller,
  });

  final EmojisListController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(
        controller.emojis.length,
        (index) {
          return InkWell(
            onTap: () => controller.removeEmoji(index: index),
            child: AppContainerImage(url: controller.emojis[index]['url']),
          );
        },
      ),
    );
  }
}
