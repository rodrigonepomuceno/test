import 'package:challenge/modules/emojis_list/widgets/emoji_grid_view_widget.dart';
import 'package:challenge/shared/themes/app_colors.dart';
import 'package:challenge/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:challenge/modules/emojis_list/emojis_list_controller.dart';
import 'package:get/get.dart';

class EmojisListPage extends GetView<EmojisListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emoji List'),
      ),
      body: Obx(
        () => RefreshIndicator(
          child: controller.emojis.isEmpty
              ? Center(
                  child: Text(
                    'Emoji list is empty',
                    style: AppTextStyle.h2(color: AppColors.blue),
                  ),
                )
              : EmojisGridViewWidget(controller: controller),
          onRefresh: controller.refreshList,
        ),
      ),
    );
  }
}
