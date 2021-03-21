import 'package:challenge/modules/google_repos/google_repos_controller.dart';
import 'package:challenge/modules/google_repos/widgets/error_load_widget.dart';
import 'package:challenge/modules/google_repos/widgets/item_detail_widget.dart';
import 'package:challenge/shared/models/google_repos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GoogleReposPage extends GetView<GoogleReposController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Repos'),
      ),
      body: PagedListView<int, GoogleRepos>(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<GoogleRepos>(
          firstPageErrorIndicatorBuilder: (_) => Container(
            child: ErrorLoadWidget(),
          ),
          itemBuilder: (context, item, index) {
            return ItemDetailWidget(
              googleRepos: item,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
