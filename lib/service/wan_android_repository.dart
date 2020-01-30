import 'package:flutter_wanandroid/net/dio_utils.dart';
import 'package:flutter_wanandroid/page/head_line/banner_item_entity.dart';
import 'package:flutter_wanandroid/page/news_list/news_list_entity.dart';
import 'package:flutter_wanandroid/page/project/project_tree_entity.dart';

/// 网络请求
///
/// author : BaoZhou
/// date : 2020-01-17 10:22
class WanAndroidRepository {
  // 首页Banner
  static Future fetchBanners() async {
    var response = await DioUtils.instance.getDio().get('banner/json');
    return response.data
        .map<BannerItemEntity>((item) => BannerItemEntity.fromJson(item))
        .toList();
  }

  // 置顶文章
  static Future fetchTopNews() async {
    var response = await DioUtils.instance.getDio().get('article/top/json');
    return (response.data as List)
        .map<NewsItemEntity>((item) => NewsItemEntity.fromJson(item))
        .toList();
  }

  // 首页文章
  static Future fetchNews(int pageNum, {int cid}) async {
    await Future.delayed(Duration(seconds: 1)); //增加动效
    var response = await DioUtils.instance.getDio().get(
        'article/list/$pageNum/json',
        queryParameters: (cid != null ? {'cid': cid} : null));
    return response.data['datas']
        .map<NewsItemEntity>((item) => NewsItemEntity.fromJson(item))
        .toList();
  }

  // 项目目录
  static Future fetchProjectTreeCategories() async {
    var response = await DioUtils.instance.getDio().get('project/tree/json');
    return (response.data as List)
        .map<ProjectTreeEntity>((item) => ProjectTreeEntity.fromJson(item))
        .toList();
  }

  // 项目新闻列表
  static Future fetchProjectList(int page, {int cid}) async {
    var response = await DioUtils.instance.getDio().get(
        'project/list/$page/json',
        queryParameters: (cid != null ? {'cid': cid} : null));
    return ((response.data as Map)["datas"] as List)
        .map<NewsItemEntity>((item) => NewsItemEntity.fromJson(item))
        .toList();
  }
}
