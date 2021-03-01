import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/modules/login/model/signin_model.dart';
import 'package:mesa_news/app/modules/login/model/signup_model.dart';
import 'package:mesa_news/app/modules/login/model/token_model.dart';
import 'package:mesa_news/app/shared/constant/api/authentication_api.dart';
import 'package:mesa_news/app/shared/dio/custom_dio.dart';
import 'package:mesa_news/app/shared/dio/model/result.dart';
import 'package:mesa_news/app/shared/extension/future_extension.dart';
import 'package:mesa_news/app/shared/shared_preferences/get_storages.dart';

part 'login_repository.g.dart';

@Injectable()
class LoginRepository extends Disposable {
  final CustomDio _client;
  final GetStorages _storages;

  LoginRepository(this._client, this._storages);

  Future<Result<TokenModel>> signin(String email, String password) async {
    var data = SigninModel(email: email, password: password).toJson();
    return _client.post('${AuthenticationApi.POST_SIGNIN}', data: data).result((json) {
      var data = TokenModel.fromJson(json);
      _storages.token = data.token;
      return data;
    });
  }

  Future<Result<TokenModel>> signup(String name, String email, String password, String birthday) async {
    var data = SignupModel(name: name, email: email, password: password, birthday: birthday).toJson();
    return _client.post('${AuthenticationApi.POST_SIGNUP}', data: data).result((json) {
      var data = TokenModel.fromJson(json);
      _storages.token = data.token;
      return data;
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
