import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicar/app/app_controller.dart';
import 'package:medicar/app/modules/login/login_controller.dart';
import 'package:medicar/app/shared/components/custom_buttom/custom_buttom.dart';
import 'package:medicar/app/shared/components/custom_textfield/custom_textfield.dart';
import 'package:medicar/app/shared/components/error_alert_body/error_alert_body.dart';
import 'package:medicar/app/shared/themes/medicar_theme.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';
import 'package:medicar/app/shared/utils/size_config.dart';

class BodyFields extends StatelessWidget {
  final double h;
  final double w;

  BodyFields({Key key, this.h, this.w}) : super(key: key);

  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //
        CustomTextField(
          labelText: 'Usuário',
          hintText: 'Seu nome de usuário',
          suffixIcon: Icons.alternate_email,
          onChanged: controller.setUsername,
        ),
        //
        Container(
          height: .005 * h,
        ),
        //
        CustomTextField(
          labelText: 'Senha',
          hintText: 'Sua senha',
          suffixIcon: Icons.vpn_key,
          isPassword: true,
          onChanged: controller.setPassword,
        ),
        //
        Container(
          height: .02 * h,
        ),
        //
        Observer(
          builder: (_) {
            return CustomButtom(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) => Container(
                    alignment: Alignment.center,
                    height: 200,
                    child: CircularProgressIndicator(
                      backgroundColor: MedicarTheme.greenColor,
                    ),
                  ),
                );

                await controller.callLogin();

                Modular.to.pop();

                Modular.get<AppController>()
                    .setCurrentFocus(FocusScope.of(context));

                if (controller.response.code == 200) {
                  Modular.to.pushNamedAndRemoveUntil(
                      '/home', ModalRoute.withName('/login'));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => ErrorAlertBody(
                      responseMessage: controller.response.message,
                    ),
                  );
                }
              },
              splashColor: MedicarTheme.splashColorWhite,
              backgroundColor: MedicarTheme.greenColor,
              child: Text(
                'ENTRAR',
                textAlign: TextAlign.center,
                style: MedicarTheme.primaryFont.copyWith(
                  fontFamily: ConstantsFonts.MontserratSemiBold,
                  color: Colors.white,
                  fontSize: 2 * SizeConfig.heightMultiplier,
                ),
              ),
            );
          },
        ),
        //
        Container(
          height: .01 * h,
        ),
      ],
    );
  }
}
