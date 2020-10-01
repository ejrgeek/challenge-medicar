
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'app_widget.dart';
import 'modules/access/access_module.dart';
import 'modules/dashboard/dashboard_module.dart';
import 'modules/login/login_module.dart';
import 'modules/register/register_module.dart';
import 'modules/splashscreen/splashscreen_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashscreenModule()),

        ModularRouter('/home', module: DashboardModule()),

        ModularRouter('/access', module: AccessModule()),

        ModularRouter(
          '/login',
          module: LoginModule(),
          transition: TransitionType.rightToLeftWithFade,
          duration: Duration(milliseconds: 1000)
        ),

        ModularRouter(
          '/register',
          module: RegisterModule(),
          transition: TransitionType.rightToLeftWithFade,
          duration: Duration(milliseconds: 1000)
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
