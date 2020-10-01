import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:medicar/app/models/user/user_model.dart';
import 'package:medicar/app/modules/dashboard/dashboard_controller.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

// ignore: must_be_immutable
class ProfilePage extends KFDrawerContent {
  ProfilePage({
    Key key,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Modular.get<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: MedicarTheme.greenColor,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Observer(
              builder: (_) {
                UserModel user = controller.user;
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //
                      Text(
                        'Nome: ${user.user.firstName}',
                        textAlign: TextAlign.center,
                        style: MedicarTheme.primaryFont.copyWith(
                          fontSize: 2.25 * SizeConfig.heightMultiplier
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Email: ${user.user.email}',
                          textAlign: TextAlign.center,
                          style: MedicarTheme.primaryFont.copyWith(
                            fontSize: 2.25 * SizeConfig.heightMultiplier
                          ),
                        ),
                      ),
                      //
                      Text(
                        'Username: ${user.user.username}',
                        textAlign: TextAlign.center,
                        style: MedicarTheme.primaryFont.copyWith(
                          fontSize: 2.25 * SizeConfig.heightMultiplier
                        ),
                      ),
                      //
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
