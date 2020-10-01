import 'access_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'access_page.dart';

class AccessModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AccessController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => AccessPage()),
      ];

  static Inject get to => Inject<AccessModule>.of();
}
