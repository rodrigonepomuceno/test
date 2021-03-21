import 'package:challenge/modules/google_repos/google_repos_controller.dart';
import 'package:challenge/shared/repositories/api/api_repository.dart';
import 'package:get/get.dart';

class GoogleReposBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiRepository());
    Get.lazyPut<GoogleReposController>(
        () => GoogleReposController(repository: Get.find()));
  }
}
