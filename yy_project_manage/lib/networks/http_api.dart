import 'package:dio/dio.dart';

typedef ResponeCallBlock(YYRespone response);

class YYRespone<T> {
  YYRespone(
    this.jsonData,
    this.code,
    this.message,
  );
   T jsonData;
   int code;
   String message;
}

class HttpApi {
 static void httpLogin(String userName, String password,ResponeCallBlock callBlock) async {
    try {
      Response response = await Dio().get('http://www.baidu.com');
      print('----------');
      callBlock(YYRespone(response.data, 1, 'message'));
    } catch (e) {
      callBlock(YYRespone('content', 0, 'error'));
    }
  }
}
