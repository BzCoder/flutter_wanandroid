import 'package:flutter_wanandroid/page/head_line/banner_item_entity.dart';
import 'package:flutter_wanandroid/page/news_list/news_list_entity.dart';
import 'package:flutter_wanandroid/provider/view_state_refresh_list_model.dart';
import 'package:flutter_wanandroid/service/wan_android_repository.dart';



class HeadLineModel extends ViewStateRefreshListModel {
  List<BannerItemEntity> _banners;

  List<NewsItemEntity> _topNews;

  List<BannerItemEntity> get banners => _banners;

  List<NewsItemEntity> get topNews => _topNews;

  @override
  Future<List> loadData({int pageNum}) async {
    List<Future> futures = [];
    if (pageNum == pageNumFirst) {
      futures.add(WanAndroidRepository.fetchBanners());
      futures.add(WanAndroidRepository.fetchTopNews());
    }
    futures.add(WanAndroidRepository.fetchNews(pageNum));

    var result = await Future.wait(futures);
    if (pageNum == pageNumFirst) {
      _banners = result[0];
      _topNews = result[1];
      return result[2];
    } else {
      return result[0];
    }
  }
}
