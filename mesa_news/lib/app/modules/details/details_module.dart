import 'details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'details_page.dart';

class DetailsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DetailsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => DetailsPage(news: args.data)),
      ];

  static Inject get to => Inject<DetailsModule>.of();
}
