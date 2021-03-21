import 'package:challenge/modules/home/home_controller.dart';
import 'package:challenge/shared/repositories/api/api_repository.dart';
import 'package:get/get.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiRepository());
    Get.lazyPut<HomeController>(() => HomeController(repository: Get.find()));
  }
}
