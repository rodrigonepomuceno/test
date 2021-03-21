import 'package:challenge/modules/avatars_list/avatars_list_controller.dart';
import 'package:challenge/shared/repositories/api/api_repository.dart';
import 'package:get/get.dart';

class AvatarsListBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiRepository());
    Get.lazyPut<AvatarsListController>(
        () => AvatarsListController(repository: Get.find()));
  }
}
