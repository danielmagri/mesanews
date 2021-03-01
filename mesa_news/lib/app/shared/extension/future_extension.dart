// import 'package:dio/dio.dart' show Response, DioError;

// import '../dio/enums/dio_type_enum.dart';
// import '../dio/model/failure.dart';
// import '../dio/model/result.dart';
// import '../model/generic/default_response_model.dart';

// extension FutureExtension on Future<Response> {
//   Future<Result<R>> result<R>(
//       R Function(Map<String, dynamic> json) onValue) async {
//     try {
//       var response = await this;
//       switch (response.request.extra[TYPE]) {
//         case DioTypeEnum.TESLA:
//           DefaultResponse res = DefaultResponse.fromJson(response.data);
//           if (res.ok) {
//             return Result.success(onValue(res.data));
//           } else {
//             return Result.error(Failure.dataFailure(res.message));
//           }
//           break;
//         case DioTypeEnum.LINX_SEARCH:
//         default:
//           return Result.success(onValue(response.data));
//       }
//     } on DioError catch (e) {
//       //TODO ADD Firebase Crashlytics
//       return Result.error(Failure.dioFailure(e));
//     } on Exception catch (e) {
//       return Result.error(Failure.unknownFailure(e));
//     }
//   }

//   Future<Result<R>> resultList<R>(
//       R Function(List<dynamic> list) onValue) async {
//     try {
//       var response = await this;
//       switch (response.request.extra[TYPE]) {
//         case DioTypeEnum.TESLA:
//           DefaultResponse res = DefaultResponse.fromJson(response.data);
//           if (res.ok) {
//             return Result.success(onValue(res.list));
//           } else {
//             return Result.error(Failure.dataFailure(res.message));
//           }
//           break;
//         case DioTypeEnum.LINX_SEARCH:
//         default:
//           return Result.success(onValue(response.data));
//       }
//     } on DioError catch (e) {
//       //TODO ADD Firebase Crashlytics
//       return Result.error(Failure.dioFailure(e));
//     } on Exception catch (e) {
//       return Result.error(Failure.unknownFailure(e));
//     }
//   }
// }
