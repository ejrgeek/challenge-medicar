import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:medicar/app/service/storage_data/data_storage.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';
import 'package:medicar/app/shared/utils/constants_imgs.dart';
import 'package:medicar/app/shared/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app_controller.dart';
import 'dashboard_controller.dart';
import 'pages/consult/consult_sheet.dart';
import 'pages/help/help.dart';
import 'pages/home/home.dart';
import 'pages/profile/profile.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller
  KFDrawerController _drawerController;

  String name = 'Usuário';

  setName() async {
    await controller.setUser();
    setState(() {
      name = controller?.user?.user?.firstName?.split(' ')[0];
    });
  }

  @override
  void initState() {
    setName();
    super.initState();
    controller.setUser();
    _drawerController = KFDrawerController(
      initialPage: HomePage(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Início', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: HomePage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Meus dados', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.accessibility, color: Colors.white),
          page: ProfilePage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Marcar consulta',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.content_paste, color: Colors.white),
          page: ConsultPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Nosso site',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.language, color: Colors.white),
          onPressed: () => launch('https://intmed.com.br/'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Ajuda',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.help_outline, color: Colors.white),
          page: HelpPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return KFDrawer(
      controller: _drawerController,
      animationDuration: Duration(milliseconds: 400),
      header: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.only(left: 20),
          height: 100,
          width: MediaQuery.of(context).size.width * 1,
          child: Container(
            child: Row(
              children: <Widget>[
                //LOGO
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    ConstantsImg.logo,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    semanticsLabel: "Logo",
                  ),
                ),
                //TEXTO
                RichText(
                  text: TextSpan(
                    text: 'Olá,\n',
                    style: MedicarTheme.primaryFont.copyWith(
                      fontSize: 2.5 * SizeConfig.heightMultiplier,
                      fontFamily: ConstantsFonts.MontserratBold,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: name,
                        style: MedicarTheme.primaryFont.copyWith(
                          fontSize: 2.5 * SizeConfig.heightMultiplier,
                          fontFamily: ConstantsFonts.MontserratRegular,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                //
              ],
            ),
          ),
        ),
      ),
      footer: Container(
        // color: Colors.red[50],

        child: Column(
          children: <Widget>[
            KFDrawerItem(
              text: Text(
                'Sair',
                style: MedicarTheme.primaryFont.copyWith(
                  color: Colors.white,
                  fontSize: 1.714215 * SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.normal,
                ),
              ),
              icon: RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.exit_to_app,
                  textDirection: TextDirection.ltr,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                await DataStorage().clearStorage();
                await controller.logout();
                Modular.to.pushNamedAndRemoveUntil(
                    '/access', ModalRoute.withName('/home'));
              },
            ),
            Container(
              margin: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5),
              alignment: Alignment.bottomLeft,
              child: Visibility(
                visible: Modular.get<AppController>()?.appVersion != null,
                child: Text(
                  "Versão ${Modular.get<AppController>().appVersion}",
                  style: MedicarTheme.primaryFont.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(color: MedicarTheme.greenColor),
    );
  }
}
