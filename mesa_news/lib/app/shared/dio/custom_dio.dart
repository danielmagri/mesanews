import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options = BaseOptions(
      baseUrl: "https://mesa-news-api.herokuapp.com/",
      connectTimeout: 60000,
      receiveTimeout: 60000,
    );
    interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onError: _onError,
      ),
    );
    interceptors.add(PrettyDioLogger());
  }

  _onRequest(RequestOptions options) async {
    //String token = '$TOKEN';
    //options.headers['X-WSSE'] = '$token';
  }

  _onError(DioError e) {
    if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
      //unauthorized - go to logout
      return e;
    }
    return e;
  }
}