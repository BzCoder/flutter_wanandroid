import '../base_response_data.dart';

/// 接口的code没有返回为true的异常
class FailException implements Exception {
  String message;

  FailException.fromRespData(BaseResponseData respData) {
    message = respData.message;
  }

  @override
  String toString() {
    return 'NotExpectedException{respData: $message}';
  }
}

