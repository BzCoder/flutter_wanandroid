import 'package:flutter_wanandroid/net/dio_utils.dart';
import 'package:flutter_wanandroid/page/news_list/news_list_entity.dart';
import 'package:flutter_wanandroid/page/project/project_tree_entity.dart';

class WanAndroidRepository {
  // 项目目录
  static Future fetchProjectTreeCategories() async {
    var response = await DioUtils.instance.getDio().get('project/tree/json');
    return (response.data as List)
        .map<ProjectTreeEntity>((item) => ProjectTreeEntity.fromJson(item))
        .toList();
  }

  // 项目列表
  static Future fetchProjectList(int page, {int cid}) async {
    var response = await DioUtils.instance.getDio().get(
        'project/list/$page/json',
        queryParameters: (cid != null ? {'cid': cid} : null));
    return ((response.data as Map)["datas"] as List)
        .map<NewsBean>((item) => NewsBean.fromJson(item))
        .toList();
  }
}
