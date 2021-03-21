import 'package:challenge/modules/emojis_list/emojis_list_controller.dart';
import 'package:challenge/shared/repositories/api/api_repository.dart';
import 'package:get/get.dart';

class EmojisListBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiRepository());
    Get.lazyPut<EmojisListController>(
        () => EmojisListController(repository: Get.find()));
  }
}
