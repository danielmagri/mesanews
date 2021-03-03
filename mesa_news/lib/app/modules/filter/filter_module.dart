import 'filter_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'filter_page.dart';

class FilterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $FilterController,
      ];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter(Modular.initialRoute, child: (_, args) => FilterPage(filter: args.data))];

  static Inject get to => Inject<FilterModule>.of();
}
