

import 'package:flutter_wanandroid/net/dio_utils.dart';

class WanAndroidRepository {
  // 项目分类
  static Future fetchTreeCategories() async {
    var response = await DioUtils.instance.getDio().get('tree/json');
    return response.data;
  }
}
