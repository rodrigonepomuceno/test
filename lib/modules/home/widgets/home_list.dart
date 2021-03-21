import 'package:challenge/modules/home/home_controller.dart';
import 'package:challenge/shared/themes/app_colors.dart';
import 'package:challenge/shared/themes/app_sized_box.dart';
import 'package:challenge/shared/widgets/app_container_emoji.dart';
import 'package:challenge/shared/widgets/app_flat_button.dart';
import 'package:challenge/shared/widgets/app_list_tile.dart';
import 'package:challenge/shared/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeDetailsPage extends StatelessWidget {
  const HomeDetailsPage({
    @required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        children: [
          AppSizedBox.height_14,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 130),
            height: 100.h,
            child: AppContainerImage(url: controller.urlEmoji.value),
          ),
          AppSizedBox.height_24,
          AppFlatButton(
            loading: controller.inserting.value,
            active: true,
            onPressed: controller.getEmojisApi,
            lable: 'Get Emojis API',
            height: 45.h,
            strech: false,
            textStyle:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
            margin: EdgeInsets.symmetric(horizontal: 50.w),
          ),
          AppSizedBox.height_8,
          AppFlatButton(
            active: true,
            onPressed: controller.getRandomEmoji,
            lable: 'Random Emoji',
            height: 45.h,
            strech: false,
            textStyle:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
            margin: EdgeInsets.symmetric(horizontal: 50.w),
          ),
          AppSizedBox.height_8,
          AppFlatButton(
            active: true,
            onPressed: controller.goToEmojiList,
            lable: 'Emoji List',
            height: 45.h,
            strech: false,
            textStyle:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
            margin: EdgeInsets.symmetric(horizontal: 50.w),
          ),
          AppSizedBox.height_8,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: AppListTile(
              body: AppTextFormField(
                controller: controller.textEditingController,
                textInputType: TextInputType.text,
                hintText: 'Insert GitHub Username',
              ),
              trailing: InkWell(
                onTap: controller.getAvatar,
                child: Icon(Icons.search),
              ),
            ),
          ),
          AppSizedBox.height_8,
          AppFlatButton(
            active: true,
            onPressed: controller.goToAvatarsList,
            lable: 'Avatar List',
            height: 45.h,
            strech: false,
            textStyle:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
            margin: EdgeInsets.symmetric(horizontal: 50.w),
          ),
          AppSizedBox.height_8,
          AppFlatButton(
            active: true,
            onPressed: controller.goToGoogleRpos,
            lable: 'Google Repos',
            height: 45.h,
            strech: false,
            textStyle:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
            margin: EdgeInsets.symmetric(horizontal: 50.w),
          )
        ],
      ),
    );
  }
}
