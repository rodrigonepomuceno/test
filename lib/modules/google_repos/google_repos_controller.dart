import 'package:challenge/shared/models/google_repos.dart';
import 'package:challenge/shared/repositories/api/api_repository.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GoogleReposController extends GetxController {
  final ApiRepository repository;
  GoogleReposController({this.repository});

  //RxList<GoogleRepos> googleRepos = <GoogleRepos>[].obs;
  int page = 1;
  int size = 10;

  final PagingController<int, GoogleRepos> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    print('GoogleReposController onInit');
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getGoogleRepos();
    });
  }

  getGoogleRepos() async {
    try {
      var result = await repository.getGoogleRepos(page: page);
      final isLastPage = result.length < size;
      if (isLastPage) {
        pagingController.appendLastPage(result);
      } else {
        final nextPageKey = page + result.length;
        pagingController.appendPage(result, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
