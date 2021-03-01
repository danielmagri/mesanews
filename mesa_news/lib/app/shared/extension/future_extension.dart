import 'package:dio/dio.dart' show Response, DioError;

import '../dio/model/failure.dart';
import '../dio/model/result.dart';

extension FutureExtension on Future<Response> {
  Future<Result<R>> result<R>(R Function(Map<String, dynamic> json) onValue) async {
    try {
      var response = await this;
      return Result.success(onValue(response.data));
    } on DioError catch (e) {
      return Result.error(Failure.dioFailure(e));
    } on Exception catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }

  Future<Result<R>> resultList<R>(R Function(List<dynamic> list) onValue) async {
    try {
      var response = await this;
      return Result.success(onValue(response.data));
    } on DioError catch (e) {
      return Result.error(Failure.dioFailure(e));
    } on Exception catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }
}
