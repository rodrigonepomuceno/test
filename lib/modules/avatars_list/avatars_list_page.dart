import 'package:challenge/modules/avatars_list/avatars_list_controller.dart';
import 'package:challenge/modules/avatars_list/widgets/grid_view_widget.dart';
import 'package:challenge/shared/themes/app_colors.dart';
import 'package:challenge/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvatarsListPage extends GetView<AvatarsListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar List'),
      ),
      body: Obx(
        () => RefreshIndicator(
          child: controller.avatars.isEmpty
              ? Center(
                  child: Text(
                    'Avatar list is empty',
                    style: AppTextStyle.exampleStyle(color: AppColors.blue),
                  ),
                )
              : GridViewPage(controller: controller),
          onRefresh: controller.refreshList,
        ),
      ),
    );
  }
}
