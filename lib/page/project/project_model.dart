import 'package:flutter_wanandroid/page/news_list/news_list_entity.dart';
import 'package:flutter_wanandroid/page/project/project_tree_entity.dart';
import 'package:flutter_wanandroid/provider/view_state_list_model.dart';
import 'package:flutter_wanandroid/provider/view_state_refresh_list_model.dart';
import 'package:flutter_wanandroid/service/wan_android_repository.dart';

/// 项目资源请求
///
/// author : BaoZhou
/// date : 2020-01-15 20:21
class ProjectCategoryModel extends ViewStateListModel<ProjectTreeEntity> {
  @override
  Future<List<ProjectTreeEntity>> loadData() async {
    return await WanAndroidRepository.fetchProjectTreeCategories();
  }
}

class ProjectListModel extends ViewStateRefreshListModel<NewsItemEntity> {
  @override
  Future<List<NewsItemEntity>> loadData({int pageNum}) async {
    return await WanAndroidRepository.fetchProjectList(pageNum, cid: 294);
  }
}
