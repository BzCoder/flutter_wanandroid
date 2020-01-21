import 'package:flutter_wanandroid/net/dio_utils.dart';
import 'package:flutter_wanandroid/page/head_line/banner_item_entity.dart';
import 'package:flutter_wanandroid/page/news_list/news_list_entity.dart';
import 'package:flutter_wanandroid/page/project/project_tree_entity.dart';
import 'package:flutter_wanandroid/page/user/user_entity.dart';
import 'package:flutter_wanandroid/service/wan_android_service.dart';
import 'package:rxdart/rxdart.dart';

/// 网络请求
///
/// author : BaoZhou
/// date : 2020-01-17 10:22
class WanAndroidRemoteService extends WanAndroidService {
  // 首页Banner
  @override
  Observable fetchBanners() {
    return DioUtils.instance.get('banner/json');
  }

  // 置顶文章
  @override
  Observable fetchTopNews() {
    return DioUtils.instance.get('article/top/json');
  }

  // 首页文章
  @override
  Observable fetchNews(int pageNum, {int cid}) {
    return DioUtils.instance.get('article/list/$pageNum/json',
        params: (cid != null ? {'cid': cid} : null));
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

  /// 登录
  /// [Http._init] 添加了拦截器 设置了自动cookie.
  static Future login(String username, String password) async {
    var response = await DioUtils.instance
        .getDio()
        .post<Map>('user/login', queryParameters: {
      'username': username,
      'password': password,
    });
    return UserEntity.fromJson(response.data);
  }

  /// 注册
  static Future register(
      String username, String password, String rePassword) async {
    var response = await DioUtils.instance
        .getDio()
        .post<Map>('user/register', queryParameters: {
      'username': username,
      'password': password,
      'repassword': rePassword,
    });
    return UserEntity.fromJson(response.data);
  }

  /// 登出
  static logout() async {
    /// 自动移除cookie
    await DioUtils.instance.getDio().get('user/logout/json');
  }

//  // 导航
//  static Future fetchNavigationSite() async {
//    var response = await DioUtils.instance.getDio().get('navi/json');
//    return response.data
//        .map<NavigationSite>((item) => NavigationSite.fromMap(item))
//        .toList();
//  }
//
//  // 公众号分类
//  static Future fetchWechatAccounts() async {
//    var response = await DioUtils.instance.getDio().get('wxarticle/chapters/json');
//    return response.data.map<Tree>((item) => Tree.fromJsonMap(item)).toList();
//  }
//
//  // 公众号文章
//  static Future fetchWechatAccountArticles(int pageNum, int id) async {
//    var response = await DioUtils.instance.getDio().get('wxarticle/list/$id/$pageNum/json');
//    return response.data['datas']
//        .map<Article>((item) => Article.fromMap(item))
//        .toList();
//  }
//
//  // 搜索热门记录
//  static Future fetchSearchHotKey() async {
//    var response = await DioUtils.instance.getDio().get('hotkey/json');
//    return response.data
//        .map<SearchHotKey>((item) => SearchHotKey.fromMap(item))
//        .toList();
//  }
//
//  // 搜索结果
//  static Future fetchSearchResult({key = "", int pageNum = 0}) async {
//    var response =
//    await http.post<Map>('article/query/$pageNum/json', queryParameters: {
//      'k': key,
//    });
//    return response.data['datas']
//        .map<Article>((item) => Article.fromMap(item))
//        .toList();
//  }
//
//  /// 登录
//  /// [Http._init] 添加了拦截器 设置了自动cookie.
//  static Future login(String username, String password) async {
//    var response = await http.post<Map>('user/login', queryParameters: {
//      'username': username,
//      'password': password,
//    });
//    return User.fromJsonMap(response.data);
//  }
//
//  /// 注册
//  static Future register(
//      String username, String password, String rePassword) async {
//    var response = await DioUtils.instance.getDio().post<Map>('user/register', queryParameters: {
//      'username': username,
//      'password': password,
//      'repassword': rePassword,
//    });
//    return User.fromJsonMap(response.data);
//  }
//
//  /// 登出
//  static logout() async {
//    /// 自动移除cookie
//    await DioUtils.instance.getDio().get('user/logout/json');
//  }
//
//  static testLoginState() async {
//    await DioUtils.instance.getDio().get('lg/todo/listnotdo/0/json/1');
//  }
//
//  // 收藏列表
//  static Future fetchCollectList(int pageNum) async {
//    var response = await DioUtils.instance.getDio().get<Map>('lg/collect/list/$pageNum/json');
//    return response.data['datas']
//        .map<Article>((item) => Article.fromMap(item))
//        .toList();
//  }
//
//  // 收藏
//  static collect(id) async {
//    await http.post('lg/collect/$id/json');
//  }
//
//  // 取消收藏
//  static unCollect(id) async {
//    await http.post('lg/uncollect_originId/$id/json');
//  }
//
//  // 取消收藏2
//  static unMyCollect({id, originId}) async {
//    await http.post('lg/uncollect/$id/json',
//        queryParameters: {'originId': originId ?? -1});
//  }
//
//  // 个人积分
//  static Future fetchCoin() async {
//    var response = await DioUtils.instance.getDio().get('lg/coin/getcount/json');
//    return response.data;
//  }
//
//  // 我的积分记录
//  static Future fetchCoinRecordList(int pageNum) async {
//    var response = await DioUtils.instance.getDio().get('lg/coin/list/$pageNum/json');
//    return response.data['datas']
//        .map<CoinRecord>((item) => CoinRecord.fromMap(item))
//        .toList();
//  }
//
//  // 积分排行榜
//  /// {
//  ///        "coinCount": 448,
//  ///        "username": "S**24n"
//  ///      },
//  static Future fetchRankingList(int pageNum) async {
//    var response = await DioUtils.instance.getDio().get('coin/rank/$pageNum/json');
//    return response.data['datas'];
//  }
}
