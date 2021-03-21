import 'package:challenge/modules/avatars_list/avatars_list_bind.dart';
import 'package:challenge/modules/avatars_list/avatars_list_page.dart';
import 'package:challenge/modules/emojis_list/emojis_list_bind.dart';
import 'package:challenge/modules/emojis_list/emojis_list_page.dart';
import 'package:challenge/modules/google_repos/google_repos_bind.dart';
import 'package:challenge/modules/google_repos/google_repos_page.dart';
import 'package:challenge/modules/home/home_bind.dart';
import 'package:challenge/modules/home/home_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBind(),
    ),
    GetPage(
      name: Routes.EMOJISLIST,
      page: () => EmojisListPage(),
      binding: EmojisListBind(),
    ),
    GetPage(
      name: Routes.AVARTARSLIST,
      page: () => AvatarsListPage(),
      binding: AvatarsListBind(),
    ),
    GetPage(
      name: Routes.GOOGLEREPOS,
      page: () => GoogleReposPage(),
      binding: GoogleReposBind(),
    )
  ];
}
