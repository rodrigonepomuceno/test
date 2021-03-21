import 'package:challenge/modules/avatars_list/avatars_list_controller.dart';
import 'package:challenge/shared/widgets/app_container_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarGridViewWidget extends StatelessWidget {
  const AvatarGridViewWidget({
    @required this.controller,
  });

  final AvatarsListController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(
        controller.avatars.length,
        (index) {
          return InkWell(
            onTap: () =>
                controller.removeAvatar(avatar: controller.avatars[index]),
            child: Padding(
              padding: EdgeInsets.all(5.sp),
              child: AppContainerImage(
                url: controller.avatars[index].avatar_url,
              ),
            ),
          );
        },
      ),
    );
  }
}
