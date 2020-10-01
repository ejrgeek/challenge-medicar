import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicar/app/app_controller.dart';
import 'package:medicar/app/modules/dashboard/repository/dashboard_repository.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_imgs.dart';
import 'package:medicar/app/shared/utils/size_config.dart';
import 'splashscreen_controller.dart';

class SplashscreenPage extends StatefulWidget {
  final String title;
  const SplashscreenPage({Key key, this.title = "Splashscreen"})
      : super(key: key);

  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState
    extends ModularState<SplashscreenPage, SplashscreenController> {
  //use 'controller' variable to access controller
  final appController = Modular.get<AppController>();

  toAccessPage() async {
    await controller.getToken();
    String page = '/access';
    if (controller.hasToken) {
      DashboardRepository().getUser();
      page = '/home';
    }
    return await Future.delayed(
      Duration(microseconds: 2000),
      () => Modular.to.pushNamedAndRemoveUntil(
        page,
        ModalRoute.withName(Modular.initialRoute),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    appController.setAppVersion();
    toAccessPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double w = constraints.biggest.width;
          double h = constraints.biggest.height;

          return Container(
            width: w * 1,
            height: h * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ConstantsImg.background,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //
                Container(
                  height: .35 * h,
                ),
                //
                Container(
                  height: .25 * h,
                  child: SvgPicture.asset(ConstantsImg.logoSplash),
                ),
                //
                Container(
                  height: .3 * h,
                ),
                //
                Observer(
                  builder: (_) {
                    return Container(
                      alignment: Alignment.bottomCenter,
                      height: .05 * h,
                      child: Text(
                        'Versão ${appController.appVersion}',
                        style: MedicarTheme.primaryFont.copyWith(
                          fontSize: 1.2 * SizeConfig.heightMultiplier,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
                //
              ],
            ),
          );
        },
      ),
    );
  }
}
