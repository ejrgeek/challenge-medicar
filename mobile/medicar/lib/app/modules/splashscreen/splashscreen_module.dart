import 'splashscreen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'splashscreen_page.dart';

class SplashscreenModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SplashscreenController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => SplashscreenPage()),
      ];

  static Inject get to => Inject<SplashscreenModule>.of();
}
