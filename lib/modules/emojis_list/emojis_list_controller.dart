import 'package:challenge/shared/repositories/api/api_repository.dart';
import 'package:get/get.dart';

class EmojisListController extends GetxController {
  final ApiRepository repository;

  EmojisListController({this.repository});

  RxList emojis = [].obs;

  @override
  void onInit() {
    print('EmojisListController onInit');
    super.onInit();
    emojis.addAll(Get.arguments);
  }

  removeEmoji({int index}) {
    emojis.removeAt(index);
    print('New list contains ${emojis.length} items.');
  }

  Future<void> refreshList() async {
    emojis.clear();
    emojis.addAll(Get.arguments);
  }
}
