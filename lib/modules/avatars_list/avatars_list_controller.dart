import 'package:challenge/database/database_fetch.dart';
import 'package:challenge/shared/models/avatar_model.dart';
import 'package:challenge/shared/repositories/api/api_repository.dart';
import 'package:get/get.dart';

class AvatarsListController extends GetxController {
  final ApiRepository repository;

  AvatarsListController({this.repository});

  RxList<Avatar> avatars = <Avatar>[].obs;

  @override
  void onInit() {
    print('AvatarsListController onInit');
    super.onInit();
    getLocalAvatars();
  }

  Future<void> getLocalAvatars() async {
    avatars.clear();
    final List<Map<String, dynamic>> maps =
        await DatabaseHelper.instance.queryAllRows(table: 'avatars');
    avatars.addAll(maps.map<Avatar>((json) => Avatar.fromJson(json)).toList());
  }

  removeAvatar({Avatar avatar}) {
    DatabaseHelper.instance.delete(id: avatar.id, table: 'avatars');
    getLocalAvatars();
    print('New list contains ${avatars.length} items.');
  }

  Future<void> refreshList() async {}
}
