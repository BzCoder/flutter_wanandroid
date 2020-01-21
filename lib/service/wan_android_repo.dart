import 'package:flutter_wanandroid/service/wan_android_remote.dart';
import 'package:flutter_wanandroid/service/wan_android_service.dart';
import 'package:rxdart/rxdart.dart';

class WanAndroidRepo extends WanAndroidService {
  WanAndroidService _remote = WanAndroidRemoteService();

  Observable fetchBanners() {
    return _remote.fetchBanners();
  }

  @override
  Observable fetchNews(int pageNum, {int cid}) {
    return _remote.fetchNews(pageNum, cid: cid);
  }

  @override
  Observable fetchTopNews() {
    return _remote.fetchBanners();
  }
}
