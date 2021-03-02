import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/shared/shared_preferences/get_storages.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'custom_dio.g.dart';

@Injectable()
class CustomDio extends DioForNative {
  final GetStorages _storages;

  CustomDio(this._storages) {
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
    interceptors.add(PrettyDioLogger(requestHeader: true));
  }

  _onRequest(RequestOptions options) async {
    String token = _storages.token;
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
  }

  _onError(DioError e) {
    if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
      //unauthorized - go to logout
      return e;
    }
    return e;
  }
}
