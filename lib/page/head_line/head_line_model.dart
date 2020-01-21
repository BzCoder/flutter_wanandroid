import 'package:flutter_wanandroid/page/head_line/banner_item_entity.dart';
import 'package:flutter_wanandroid/page/news_list/news_list_entity.dart';
import 'package:flutter_wanandroid/provider/view_state_refresh_list_model.dart';
import 'package:flutter_wanandroid/service/wan_android_repo.dart';
import 'package:rxdart/rxdart.dart';

class HeadLineModel extends ViewStateRefreshListModel {
  List<BannerItemEntity> _banners;

  List<NewsItemEntity> _topNews;

  List<BannerItemEntity> get banners => _banners;

  List<NewsItemEntity> get topNews => _topNews;

  final WanAndroidRepo wanAndroidRepo = new WanAndroidRepo();

  @override
  Future<List> loadData({int pageNum}) async {
    List<Future> futures = [];
    if (pageNum == pageNumFirst) {
      Observable.merge([
        wanAndroidRepo.fetchBanners(),
        wanAndroidRepo.fetchTopNews(),
        wanAndroidRepo.fetchNews(pageNum)
      ]).listen((onData)=>{


      });


    } else {
      wanAndroidRepo.fetchNews(pageNum);
    }
  }
}
