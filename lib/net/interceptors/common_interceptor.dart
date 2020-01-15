import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_wanandroid/net/exception/fail_exception.dart';
import '../common_response_data.dart';

class CommonInterceptor extends InterceptorsWrapper {
  @override
  Future onResponse(Response response) {
    ResponseData respData;
    if (response.data != null) {
      respData = ResponseData.fromJson(json.decode(response.data));
    }
    if (respData.success) {
      response.data = respData.data;
      return super.onResponse(response);
    } else {
      throw FailException.fromRespData(respData);
    }
  }
}
