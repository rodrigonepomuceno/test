import 'dart:math';

import 'package:challenge/database/database_fetch.dart';
import 'package:challenge/routes/app_pages.dart';
import 'package:challenge/shared/models/avatar_model.dart';
import 'package:challenge/shared/models/emoji_model.dart';
import 'package:challenge/shared/repositories/api/api_repository.dart';
import 'package:challenge/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiRepository repository;

  RxList emojis = [].obs;
  Avatar avatar = Avatar();
  RxString urlEmoji = ''.obs;
  RxBool inserting = false.obs;
  TextEditingController textEditingController = TextEditingController();

  HomeController({this.repository});

  @override
  void onInit() {
    print('HomeController onInit');
    super.onInit();
    getLocalEmoji();
  }

  Future<bool> getLocalEmoji() async {
    emojis.clear();
    final List<Map<String, dynamic>> maps =
        await DatabaseHelper.instance.queryAllRows(table: 'emojis');
    emojis.addAll(maps);
    return emojis.length > 0;
  }

  void addLocalEmoji(Emoji emoji, String table) async {
    await DatabaseHelper.instance.insert(emoji: emoji, table: table);
  }

  getEmojisApi() async {
    try {
      inserting.value = !inserting.value;
      bool hasData = await getLocalEmoji();
      if (!hasData) {
        var response = await repository.getEmojis();
        if (response != null) {
          emojis.addAll(response);

          for (var item in emojis) {
            addLocalEmoji(item, 'emojis');
          }
          inserting.value = !inserting.value;
          setSnackbar(
            title: 'Insert Emojis',
            message: 'Inserted ${emojis.length} records in the database.',
          );
        } else {
          inserting.value = !inserting.value;
          setSnackbar(
            title: 'Insert Emojis',
            message: 'Error load API',
          );
        }
      } else {
        inserting.value = !inserting.value;
        setSnackbar(
          title: 'Data already included.',
          message: 'The data is already in the database.',
        );
      }
    } catch (e) {
      inserting.value = !inserting.value;
      print(e.toString());
    }
  }

  goToEmojiList() {
    Get.toNamed(Routes.EMOJISLIST, arguments: emojis);
  }

  goToAvatarsList() {
    Get.toNamed(Routes.AVARTARSLIST);
  }

  goToGoogleRpos() {
    Get.toNamed(Routes.GOOGLEREPOS);
  }

  setSnackbar({String title, String message}) {
    Get.snackbar(title, message,
        colorText: AppColors.white, backgroundColor: AppColors.blue);
  }

  getRandomEmoji() async {
    bool hasData = await getLocalEmoji();
    if (hasData) {
      final List<Map<String, dynamic>> map =
          await DatabaseHelper.instance.selectRecord(
        table: 'emojis',
        id: getRandomNumber(maxRange: emojis.length),
      );
      setImageEmoji(url: map.isEmpty ? '' : map[0]['url']);
    } else {
      setSnackbar(
        title: 'List empty',
        message: 'No emoji was found in the local database.',
      );
    }
  }

  setImageEmoji({String url}) {
    urlEmoji.value = url;
  }

  getRandomNumber({int maxRange}) {
    Random random = new Random();
    return random.nextInt(emojis.length);
  }

  getAvatar() async {
    try {
      if (textEditingController.text.isEmpty) {
        setSnackbar(title: 'Warning', message: 'This field must be filled.');
      } else {
        bool hasAvatar = await getLocalAvatar();

        if (!hasAvatar) {
          avatar = await repository.getAvatar(
              userName: textEditingController?.text ?? '');
          if (avatar.id != null) {
            addLocalAvatar(avatar: avatar, table: 'avatars');
          }
        }
        textEditingController.clear();
        setImageEmoji(url: avatar.avatar_url ?? '');
      }
    } catch (e) {
      print('Error getAvar ${e.toString()}');
    }
  }

  Future<bool> getLocalAvatar() async {
    final List<Map<String, dynamic>> maps = await DatabaseHelper.instance
        .selectLogin(
            table: 'avatars',
            login: textEditingController.text.toLowerCase() ?? '');
    if (maps.length > 0) {
      avatar.avatar_url = maps[0]['avatar_url'];
    }
    return maps.length > 0;
  }

  void addLocalAvatar({Avatar avatar, String table}) async {
    await DatabaseHelper.instance.insert(avatar: avatar, table: table);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
