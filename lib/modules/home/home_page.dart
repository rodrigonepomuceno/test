import 'package:challenge/modules/home/home_controller.dart';
import 'package:challenge/modules/home/widgets/home_list.dart';
import 'package:challenge/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: HomeDetailsPage(controller: controller),
    );
  }
}
