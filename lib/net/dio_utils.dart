import 'package:dio/dio.dart';
import 'package:flutter_wanandroid/common/common.dart';
import 'package:rxdart/rxdart.dart';

import 'interceptors/common_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

class DioUtils {

  static final DioUtils _singleton = DioUtils._internal();

  static DioUtils get instance => DioUtils();

  factory DioUtils() {
    return _singleton;
  }

  static Dio _dio;

  Dio getDio() {
    return _dio;
  }

  DioUtils._internal() {
    var options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
      responseType: ResponseType.plain,
      validateStatus: (status) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: 'https://www.wanandroid.com/',
//      contentType: ContentType('application', 'x-www-form-urlencoded', charset: 'utf-8'),
    );
    _dio = Dio(options);

    /// Fiddler抓包代理配置 https://www.jianshu.com/p/d831b1f7c45b
//    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//        (HttpClient client) {
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return 'PROXY 10.41.0.132:8888';
//      };
//      client.badCertificateCallback =
//          (X509Certificate cert, String host, int port) => true;
//    };
    /// 打印Log(生产模式去除)
    if (!Constant.inProduction) {
      _dio.interceptors.add(LoggingInterceptor());
    }

    _dio.interceptors.add(CommonInterceptor());
  }

  ///get
  Future _get(String url, {Map<String, dynamic> params}) async {
    var response = await _dio.get(url, queryParameters: params);
    return response.data;
  }

  ///post
  Future _post(String url, Map<String, dynamic> params) async {
    var response = await _dio.post(url, data: params);
    return response.data;
  }

  Observable post(String url, Map<String, dynamic> params) =>
      Observable.fromFuture(_post(url, params)).asBroadcastStream();

  Observable get(String url, {Map<String, dynamic> params}) =>
      Observable.fromFuture(_get(url, params: params)).asBroadcastStream();
}






