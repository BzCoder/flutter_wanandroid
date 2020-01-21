import 'package:flutter_wanandroid/provider/view_state_refresh_list_model.dart';
import 'package:flutter_wanandroid/service/wan_android_remote.dart';

class NewsListModel extends ViewStateRefreshListModel {
  final int cid;

  NewsListModel(this.cid, {int pageSize, int pageNumFirst})
      : super(pageNumFirst: pageNumFirst, pageSize: pageSize);

  @override
  Future<List> loadData({int pageNum}) async {
    return await WanAndroidRemoteService.fetchProjectList(pageNum, cid: cid);
  }

  @override
  onCompleted(List data) {
//    GlobalFavouriteStateModel.refresh(data);
  }
}
