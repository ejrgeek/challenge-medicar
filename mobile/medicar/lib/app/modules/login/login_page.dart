import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicar/app/shared/components/back_buttom/back_buttom.dart';
import 'package:medicar/app/shared/components/custom_appbar/custom_appbar.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'components/body_fields.dart';
import 'components/body_header.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double w = constraints.biggest.width;
          double h = constraints.biggest.height;

          return Container(
            color: MedicarTheme.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // APP BAR
                Container(
                  height: .1 * h,
                  width: 1 * w,
                  child: CustomAppBar(
                    leftWidget: CustomBackButtom(),
                  ),
                ),
                // APP BODY HEADER
                Container(
                  height: .28 * h,
                  width: .8 * w,
                  child: BodyHeader(
                    w: w,
                    h: h,
                  ),
                ),
                // APP BODY FIELDS
                Container(
                  height: .35 * h,
                  width: .8 * w,
                  child: BodyFields(w: w, h: h),
                ),
                // APP FOOTER
                Container(
                  height: .1 * h,
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
