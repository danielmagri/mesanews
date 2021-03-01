import 'package:flutter_modular/flutter_modular.dart';

import 'core/get_storage_handler.dart';

part 'get_storages.g.dart';

@Injectable()
class GetStorages extends GetStoragesHandler {
  // Example
  String get example => getStorageString(GetStorageKeys.EXAMPLE) ?? "";
  set example(String value) => setStorageString(GetStorageKeys.EXAMPLE, value);
}

class GetStorageKeys {
  static const EXAMPLE = "example";
}
