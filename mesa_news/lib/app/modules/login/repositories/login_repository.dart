import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/modules/login/model/signin_model.dart';
import 'package:mesa_news/app/shared/constant/api/authentication_api.dart';
import 'package:mesa_news/app/shared/dio/custom_dio.dart';
import 'package:mesa_news/app/shared/dio/model/result.dart';
import 'package:mesa_news/app/shared/extension/future_extension.dart';

part 'login_repository.g.dart';

@Injectable()
class LoginRepository extends Disposable {
  final CustomDio _client;

  LoginRepository(this._client);

  Future<Result<String>> signin(String email, String password) async {
    var data = SigninModel(email: email, password: password).toJson();
    return _client.post('${AuthenticationApi.POST_LOGIN}', data: data).result((json) => json.toString());
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
