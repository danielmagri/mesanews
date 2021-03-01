import 'package:flutter_modular/flutter_modular.dart';

import 'core/get_storage_handler.dart';

part 'get_storages.g.dart';

@Injectable()
class GetStorages extends GetStoragesHandler {
  // Token
  String get token => getStorageString(GetStorageKeys.TOKEN) ?? "";
  set token(String value) => setStorageString(GetStorageKeys.TOKEN, value);
}

class GetStorageKeys {
  static const TOKEN = "token";
}
