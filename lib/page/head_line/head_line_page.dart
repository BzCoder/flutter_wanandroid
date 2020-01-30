import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/page/head_line/banner_item_entity.dart';
import 'package:flutter_wanandroid/page/head_line/head_line_model.dart';
import 'package:flutter_wanandroid/page/news_list/news_item_left_image_widget.dart';
import 'package:flutter_wanandroid/page/news_list/news_item_none_image_widget.dart';
import 'package:flutter_wanandroid/page/news_list/news_list_entity.dart';
import 'package:flutter_wanandroid/page/news_list/news_list_page.dart';
import 'package:flutter_wanandroid/provider/provider_widget.dart';
import 'package:flutter_wanandroid/provider/view_state_widget.dart';
import 'package:flutter_wanandroid/routers/fluro_navigator.dart';
import 'package:flutter_wanandroid/widget/banner/banner_view.dart';
import 'package:flutter_wanandroid/widget/load_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 首页头条
///
/// author : BaoZhou
/// date : 2020-01-16 20:38
class HeadLinePage extends StatefulWidget {
  @override
  _HeadLinePageState createState() => _HeadLinePageState();
}

class _HeadLinePageState extends State<HeadLinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HeadLineModel>(
      model: HeadLineModel(),
      onModelReady: (model) => model.initData(),
      builder: (context, model, child) {
        if (model.busy) {
          return Center(child: Text("加载中"));
        } else if (model.error && model.list.isEmpty) {
          return ViewStateErrorWidget(
              error: model.viewStateError, onPressed: model.initData);
        } else if (model.empty) {
          return ViewStateEmptyWidget(onPressed: model.initData);
        }
        return SmartRefresher(
            controller: model.refreshController,
            header: WaterDropHeader(),
            footer: RefresherFooter(),
            onRefresh: model.refresh,
            onLoading: model.loadMore,
            enablePullUp: true,
            child: ListView.builder(
                itemCount: model.list.length + 1,
                itemBuilder: (context, index) {
                  if (model.banners.length > 0 && index == 0) {
                    return Container(
                        height: 200,
                        child: new BannerView(
                          _buildBannerWidget(model.banners),
                          intervalDuration: const Duration(milliseconds: 3000),
                          indicatorMargin: 12.0,
                          indicatorBuilder: (context, smallContainer) {
                            return new Align(
                              alignment: Alignment.bottomCenter,
                              child: new Container(
                                height: 40.0,
                                padding:
                                    new EdgeInsets.symmetric(horizontal: 16.0),
                                alignment: Alignment.center,
                                child: smallContainer,
                              ),
                            );
                          },
                        ));
                  }

                  ///头条
                  else if (model.topNews.length > 0 &&
                      index <
                          model.topNews.length +
                              (model.banners.length > 0 ? 1 : 0)) {
                    NewsItemEntity item = model
                        .topNews[index - (model.banners.length > 0 ? 1 : 0)];
                    return InkWell(
                        onTap: () => NavigatorUtils.goWebViewPage(
                            context, item.title, item.link),
                        child: NewsListNoneImageWidget(
                          item,
                          isTopNews: true,
                        ));
                  }

                  ///普通新闻
                  else {
                    NewsItemEntity item = model.list[index -
                        (model.banners.length > 0 ? 1 : 0) -
                        (model.topNews.length > 0 ? model.topNews.length : 0)];
                    return InkWell(
                        onTap: () => NavigatorUtils.goWebViewPage(
                            context, item.title, item.link),
                        child: NewsListNoneImageWidget(item));
                  }
//                  else return null;
                }));
      },
    );
  }

  List<Widget> _buildBannerWidget(List<BannerItemEntity> banners) {
    return List.generate(banners.length, (i) {
      return Container(
        child: GestureDetector(
            onTap: () => NavigatorUtils.goWebViewPage(
                context, banners[i].title, banners[i].url),
            child: LoadImage(banners[i].imagePath)),
      );
    });
  }
}
