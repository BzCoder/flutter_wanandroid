import 'package:rxdart/rxdart.dart';

abstract class WanAndroidService{
  Observable fetchBanners();

  Observable fetchTopNews();

  Observable fetchNews(int pageNum, {int cid});
}